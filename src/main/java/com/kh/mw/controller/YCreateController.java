package com.kh.mw.controller;

import java.io.FileInputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.mw.service.Y_CreateService;
import com.kh.mw.service.Y_LikeService;
import com.kh.mw.util.MyFileUploader;
import com.kh.mw.vo.Y_AskVo;
import com.kh.mw.vo.Y_HomeVo;
import com.kh.mw.vo.Y_MessageVo;
import com.kh.mw.vo.Y_PhotoVo;
import com.kh.mw.vo.Y_QnaVo;
import com.kh.mw.vo.Y_StoryVo;
import com.kh.mw.vo.Y_TravelVo;

@Controller
@RequestMapping(value = "/create/*")
public class YCreateController {
	String clientId = "lee";
	@Autowired
	Y_CreateService y_createService;
	@Autowired
	Y_LikeService y_likeService;

	@RequestMapping(value = "/form", method = RequestMethod.GET)
	public String insertInfo() {
		System.out.println("insert_form");
		return "/create/form";
	}

	@RequestMapping(value = "/insertRun", method = RequestMethod.POST)
	public String insertRun(@RequestParam("multiFile") List<MultipartFile> multiFileList, Y_HomeVo homeVo,
			Y_StoryVo storyVo, Y_QnaVo qnaVo, Y_TravelVo travelVo, Y_PhotoVo photoVo, RedirectAttributes rttr,
			Model model, HttpServletRequest request) {
		System.out.println("insertRun");
		System.out.println("multiFileList: " + multiFileList);
		for (int i = 0; i < multiFileList.size(); i++) {
			try {
				String str_coverPic = multiFileList.get(0).getOriginalFilename();
				if (str_coverPic != null && !str_coverPic.equals("")) {
					String coverPic = uploadFile(multiFileList.get(0));
					homeVo.setCoverPic(coverPic);
				}
				String str_pic_one = multiFileList.get(1).getOriginalFilename();
				if (str_pic_one != null && !str_pic_one.equals("")) {
					String story_one_pic = uploadFile(multiFileList.get(1));
					storyVo.setStory_one_pic(story_one_pic);
				}
				String str_pic_two = multiFileList.get(2).getOriginalFilename();
				if (str_pic_two != null && !str_pic_two.equals("")) {
					String story_two_pic = uploadFile(multiFileList.get(2));
					storyVo.setStory_two_pic(story_two_pic);
				}
				String str_mespic = multiFileList.get(3).getOriginalFilename();
				if (str_mespic != null && !str_mespic.equals("")) {
					String mespic = uploadFile(multiFileList.get(3));
					photoVo.setMespic(mespic);
				}
				String str_mapPic = multiFileList.get(4).getOriginalFilename();
				if (str_mapPic != null && !str_mapPic.equals("")) {
					String mapPic = uploadFile(multiFileList.get(4));
					travelVo.setMapPic(mapPic);
				}
				String str_footerpic = multiFileList.get(5).getOriginalFilename();
				if (str_footerpic != null && !str_footerpic.equals("")) {
					String footerpic = uploadFile(multiFileList.get(5));
					photoVo.setFooterpic(footerpic);
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		} // for
//			System.out.println("homeVo: " + homeVo);
//			System.out.println("storyVo: " + storyVo);
		System.out.println("qnaVo: " + qnaVo);
//			System.out.println("travelVo: " + travelVo);
//			System.out.println("photoVo:" + photoVo);
		
		String[] str_ques = qnaVo.getArr_ques();
		String[] str_answers = qnaVo.getArr_answers();
		for (int i = 0; i < str_ques.length; i++) {
			if (str_ques[i] != null || str_answers[i] != null) {
				qnaVo.setQues(str_ques[i]);
				qnaVo.setAnswer(str_answers[i]);
				y_createService.insertQnA(qnaVo);
			}
		}
		String[] update_ques = qnaVo.getUpdate_ques();
		String[] update_answers = qnaVo.getUpdate_answers();
		for(int i = 0; i <update_ques.length; i++) {
			if(update_ques[i] != null || update_answers[i] != null ) {
				qnaVo.setUpdate_ques(update_ques);
				qnaVo.setUpdate_answers(update_answers);
				y_createService.updateQna(qnaVo);
			}			
		}

		y_createService.insert(homeVo, storyVo, travelVo, photoVo);
		String page = search(clientId, model);
		return page;
	}

	public String uploadFile(MultipartFile file) throws Exception {
		System.out.println("upload File");
		System.out.println("file: " + file);
		String origionalName = file.getOriginalFilename();
		System.out.println("filename: " + origionalName);
		String path = "C:/group_pics";
		String filename = MyFileUploader.uploadFile(path, origionalName, file.getBytes());
		System.out.println("filename: " + filename);
		return filename;
	}

	@RequestMapping(value = "/search", method = RequestMethod.GET)
	public String search(String clientId, Model model) {
		clientId="lee";
		Map<String, Object> map = y_createService.searchInfo(clientId);
		model.addAttribute("map", map);
		return "/create/home";
	}

	@RequestMapping(value = "/updateform", method = RequestMethod.GET)
	public String updateform(String clientId, Model model) {
		clientId="lee";
		
		Map<String, Object> map = y_createService.searchInfo(clientId);
		model.addAttribute("map", map);
		return "/create/form";
	}

	@RequestMapping(value = "/displayImg", method = RequestMethod.GET, produces = "application/text;charset=utf-8")
	@ResponseBody
	public byte[] displayImg(String pic) {
		System.out.println(pic);
		FileInputStream fis = null;
		try {
			System.out.println("displayImage");

			fis = new FileInputStream(pic);
			byte[] bytes = IOUtils.toByteArray(fis);
			return bytes;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (fis != null)
					fis.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return null;
	}// displayImg

	@RequestMapping(value = "/story", method = RequestMethod.GET)
	public String getStory(String clientId, Model model) {
		// session에서 clientId 받아오기
		Y_StoryVo storyVo = y_createService.searchStory(clientId);
		Y_PhotoVo photoVo = y_createService.searchPhoto(clientId);
		Y_HomeVo homeVo = y_createService.searchHome(clientId);
		Map<String, Object> map = new HashMap<>();
		map.put("homeVo", homeVo);
		map.put("storyVo", storyVo);
		map.put("photoVo", photoVo);
		model.addAttribute("map", map);
		return "/create/story";
	}

	@RequestMapping(value = "/qna", method = RequestMethod.GET)
	public String getQna(String clientId, Model model) {
		// session에서 clientId 받아오기
		List<Y_QnaVo> qnalist = y_createService.searchQna(clientId);
		Y_PhotoVo photoVo = y_createService.searchPhoto(clientId);
		Y_HomeVo homeVo = y_createService.searchHome(clientId);
		Map<String, Object> map = new HashMap<>();
		map.put("qnalist", qnalist);
		map.put("photoVo", photoVo);
		map.put("homeVo", homeVo);
		model.addAttribute("map", map);
		return "/create/qna";
	}

	@RequestMapping(value = "/showmes", method = RequestMethod.GET)
	public String getMes(String clientId, Model model) {
		// session에서 clientId 받아오기
		List<Y_MessageVo> meslist = y_createService.searchMes(clientId);
		Y_PhotoVo photoVo = y_createService.searchPhoto(clientId);
		Y_HomeVo homeVo = y_createService.searchHome(clientId);
		Map<String, Object> map = new HashMap<>();
		map.put("homeVo", homeVo);
		map.put("photoVo", photoVo);
		map.put("meslist", meslist);
		model.addAttribute("map", map);
		return "/create/show_message";
	}

	@RequestMapping(value = "/travel", method = RequestMethod.GET)
	public String getTravel(String clientId, Model model) {
		// session에서 clientId 받아오기
		Y_TravelVo travelVo = y_createService.searchTravel(clientId);
		Y_PhotoVo photoVo = y_createService.searchPhoto(clientId);
		Y_HomeVo homeVo = y_createService.searchHome(clientId);
		Map<String, Object> map = new HashMap<>();
		map.put("homeVo", homeVo);
		map.put("travelVo", travelVo);
		map.put("photoVo", photoVo);
		model.addAttribute("map", map);
		return "/create/travel";
	}

	@RequestMapping(value = "/insertmes", method = RequestMethod.GET)
	public String insertMes(String clientId, Model model) {
		System.out.println("insert_mes");
		Y_PhotoVo photoVo = y_createService.searchPhoto(clientId);
		Y_HomeVo homeVo = y_createService.searchHome(clientId);
		Map<String, Object> map = new HashMap<>();
		map.put("homeVo", homeVo);
		map.put("photoVo", photoVo);
		model.addAttribute("map", map);
		return "/create/insert_message";
	}

	@RequestMapping(value = "/message", method = RequestMethod.POST)
	public String insertMes(MultipartFile file, Y_MessageVo mesVo) {
		try {
			System.out.println("create/message");
			System.out.println("message: " + mesVo);
			String filename = uploadFile(file);
			mesVo.setMespic(filename);
			y_createService.insertMes(mesVo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:/create/search";
	}

	@RequestMapping(value = "/ask", method = RequestMethod.POST)
	@ResponseBody
	public boolean insertQues(Y_AskVo askVo, Model model) {
		System.out.println("ask");
		boolean result = y_createService.insertQues(askVo);
		if (result == true) {
			return true;
		}
		return false;
	}

	@RequestMapping(value = "/create/delete", method = RequestMethod.GET)
	@ResponseBody
	public boolean delete(String clientId) {
		// redirect to main
		// 삭제할때, foreign key - child element도 같이 삭제해줘야함
		return y_createService.delete(clientId);
	}

}
