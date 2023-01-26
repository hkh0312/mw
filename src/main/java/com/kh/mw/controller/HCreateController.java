package com.kh.mw.controller;

import java.io.FileInputStream;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.kh.mw.service.HCreateService;
import com.kh.mw.util.MyFileUploader;
import com.kh.mw.vo.H_HomeScheduleVo;
import com.kh.mw.vo.H_HomeVo;
import com.kh.mw.vo.H_OurstoryVo;
import com.kh.mw.vo.H_PhotosDataVo;
import com.kh.mw.vo.H_PhotosVo;
import com.kh.mw.vo.H_QnaDataVo;
import com.kh.mw.vo.H_QnaVo;
import com.kh.mw.vo.H_TempPhotosVo;
import com.kh.mw.vo.H_TravelVo;
import com.kh.mw.vo.UserVo;

@Controller
@RequestMapping("/create/*")
public class HCreateController {
	
	@Autowired
	private HCreateService createService;
	
	// 페이지 만들기 - 템플릿 선택 페이지
	@RequestMapping(value = "/choose_temp", method = RequestMethod.GET)
	public String chooseTemp() {
		return "/create/choose_temp";
	}
	
	// 템플릿 선택 페이지 - 템플릿 미리보기 페이지
	
	
	// 페이지 만들기 - 프로젝트 페이지
	@RequestMapping(value = "/insert_info", method = RequestMethod.GET)
	public String insertInfo(HttpSession session, Model model) {
		UserVo userVo = (UserVo)session.getAttribute("loginInfo");
		System.out.println("create컨트롤러, userVo: "+userVo);
		if (userVo.getPjnum() != 0) {
			H_TempPhotosVo tpVo = createService.getTpVo(userVo.getUserid());
			H_HomeVo hVo = createService.getHvo(userVo.getUserid());
			List<H_HomeScheduleVo> list_hsVo = createService.getList_hsVo(hVo.getH_no());
			H_OurstoryVo oVo = createService.getOvo(userVo.getUserid());
			H_PhotosVo pVo = createService.getPvo(userVo.getUserid());
			List<H_PhotosDataVo> list_pdVo = createService.getList_pdVo(pVo.getP_no());
			H_QnaVo qVo = createService.getQvo(userVo.getUserid());
			List<H_QnaDataVo> list_qdVo = createService.getList_qdVo(qVo.getQ_no());
			H_TravelVo tVo = createService.getTvo(userVo.getUserid());
			
			model.addAttribute("tpVo", tpVo);
			model.addAttribute("hVo", hVo);
			model.addAttribute("list_hsVo", list_hsVo);
			model.addAttribute("oVo", oVo);
			model.addAttribute("pVo", pVo);
			model.addAttribute("list_pdVo", list_pdVo);
			model.addAttribute("qVo", qVo);
			model.addAttribute("list_qdVo", list_qdVo);
			model.addAttribute("tVo", tVo);
		}
		return "/create/insert_info";
	}
	
	// 프로젝트 페이지 - 이미지 표시
	@RequestMapping(value="/displayImage", method=RequestMethod.GET)
	@ResponseBody
	public byte[] displayImage(String pic) {
		FileInputStream fis = null;
		try {
			fis = new FileInputStream(pic);
			// org.apache.common.io.IOUtils
			byte[] bytes = IOUtils.toByteArray(fis);
			return bytes;
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try {fis.close();} catch(Exception e) {}
		}
		return null;
	}
	
	// 프로젝트 페이지 - 미리보기 페이지
	@RequestMapping(value = "/preview", method = RequestMethod.GET)
	public String preView() {
		return "forward:/preview/h_home";
	}
	
	// 프로젝트 페이지 - 정보 입력 처리
	@RequestMapping(value = "/insert_run", method = RequestMethod.POST)
	public String insertRun(
			HttpSession session,
			@RequestParam("files_tempphotos") List<MultipartFile> files_tempphotos,
			MultipartFile file_home,
			MultipartFile file_ourstory,
			@RequestParam("files_photos") List<MultipartFile> files_photos,
			MultipartFile file_travel,
			
			String h_year, String h_month, String h_date, 
			@RequestParam("start_ampm") List<String> start_ampms, 
			@RequestParam("start_time") List<String> start_times, 
			@RequestParam("end_ampm") List<String> end_ampms, 
			@RequestParam("end_time") List<String> end_times, 
			@RequestParam("wedevent") List<String> wedevents, 
			@RequestParam("pyear") List<String> pyears, 
			@RequestParam("pmonth") List<String>pmonths, 
			@RequestParam("pdate") List<String> pdates,
			@RequestParam("ptext") List<String> ptexts,
			@RequestParam("q") List<String> qs, @RequestParam("a") List<String> as,
			
			H_TempPhotosVo tpVo, H_HomeVo hVo, H_OurstoryVo oVo, 
			H_PhotosVo pVo, H_QnaVo qVo, H_TravelVo tVo) {
		
		UserVo userVo = (UserVo)session.getAttribute("loginInfo");
		
		// TempPhotosVo
		tpVo.setUserid(userVo.getUserid());
		try {
			for (int i = 0; i < files_tempphotos.size(); i++) {
				String originalFileName = files_tempphotos.get(i).getOriginalFilename();
				if (originalFileName != null && !originalFileName.equals("")) {
					String pic = MyFileUploader.uploadFile(
							"C:/workspace/mw_upload_img", originalFileName, files_tempphotos.get(i).getBytes());
					switch (i) {
					case 0:
						tpVo.setTp_htitlepic(pic);
						break;
					case 1:
						tpVo.setTp_hspic(pic);
						break;
					case 2:
						tpVo.setTp_mpic(pic);
						break;
					case 3:
						tpVo.setTp_titlepic(pic);
						break;
					}
				}
			}
		} catch (Exception e) { e.printStackTrace(); }
		System.out.println("tpVo: "+tpVo);
		
		// H_HomeVo
		hVo.setUserid(userVo.getUserid());
		try {
			String originalFileName = file_home.getOriginalFilename();
			if (originalFileName != null && !originalFileName.equals("")) {
				String pic = MyFileUploader.uploadFile(
						"C:/workspace/mw_upload_img", originalFileName, file_home.getBytes());
				hVo.setH_pic(pic);} 
		} catch (Exception e) { e.printStackTrace(); }
		
		String h_weddate = h_year + "년 " + h_month + "월 " + h_date + "일";
		hVo.setH_weddate(h_weddate);
		hVo.setH_wedloc(tVo.getT_wedloc());
		System.out.println("hVo: "+hVo);
		
		// H_HomeScheduleVo
		List<String> starttimes = new ArrayList<String>();
		List<String> endtimes = new ArrayList<String>();
		
		for (int i = 0; i < start_ampms.size(); i++) {
			String s_ampm = start_ampms.get(i);
			String s_time = start_times.get(i);
			String e_ampm = end_ampms.get(i);
			String e_time = end_times.get(i);
			String starttime = s_ampm + " " + s_time;
			String endtime = e_ampm + " " + e_time;
			starttimes.add(starttime);
			endtimes.add(endtime);
		}
		
		if (wedevents.size() == 0) { wedevents.add(""); }
		List<H_HomeScheduleVo> list_hsVo = new ArrayList<H_HomeScheduleVo>();
		for (int i = 0; i < starttimes.size(); i++) {
			H_HomeScheduleVo vo = new H_HomeScheduleVo();
			vo.setHs_starttime(starttimes.get(i));
			vo.setHs_endtime(endtimes.get(i));
			vo.setHs_event(wedevents.get(i));
			list_hsVo.add(vo);
		}
		
		for (int i = 0; i < list_hsVo.size(); i++) {
			System.out.println("list_hsVo["+i+"]: "+list_hsVo.get(i));			
		}
		
		// H_OurstoryVo
		oVo.setUserid(userVo.getUserid());
		try {
			String originalFileName = file_ourstory.getOriginalFilename();
			if (originalFileName != null && !originalFileName.equals("")) {
				String pic = MyFileUploader.uploadFile(
						"C:/workspace/mw_upload_img", originalFileName, file_ourstory.getBytes());
				oVo.setO_pic(pic);} 
		} catch (Exception e) { e.printStackTrace(); }
		System.out.println("oVo: "+oVo);
		
		// H_PhotosVo
		pVo.setUserid(userVo.getUserid());
		
		// H_PhotosDataVo
		List<H_PhotosDataVo> list_pdVo = new ArrayList<H_PhotosDataVo>();
		try {
			for (int i = 0; i < files_photos.size(); i++) {
				H_PhotosDataVo vo = new H_PhotosDataVo();
				String originalFileName = files_photos.get(i).getOriginalFilename();
				if (originalFileName != null && !originalFileName.equals("")) {
					String pic = MyFileUploader.uploadFile(
							"C:/workspace/mw_upload_img", originalFileName, files_photos.get(i).getBytes());
					vo.setPd_pic(pic);
				} else { vo.setPd_pic(null); }
				list_pdVo.add(vo);
			}
		} catch (Exception e) { e.printStackTrace(); }
		
		List<String> pd_pdates = new ArrayList<String>();
		for (int i = 0; i < pyears.size(); i++) {
			String s_year= pyears.get(i);
			String s_month = pmonths.get(i);
			String s_date = pdates.get(i);
			String pddate = s_year + "년 " + s_month + "월 " + s_date + "일";
			pd_pdates.add(pddate);
		}
		if (ptexts.size() == 0) { ptexts.add(""); }
		for (int i = 0; i < pd_pdates.size(); i++) {
			H_PhotosDataVo vo = list_pdVo.get(i);
			vo.setPd_pdate(pd_pdates.get(i));
			vo.setPd_text(ptexts.get(i));
		}
		
		for (int i = 0; i < list_pdVo.size(); i++) {
			System.out.println("list_pdVo["+i+"]: "+list_pdVo.get(i));			
		}
		
		// H_QnaVo
		qVo.setUserid(userVo.getUserid());
				
		// H_QnaDataVo
		if (qs.size() == 0) { qs.add(""); }
		if (as.size() == 0) { as.add(""); }
		List<H_QnaDataVo> list_qdVo = new ArrayList<H_QnaDataVo>();
		for (int i = 0; i < qs.size(); i++) {
			H_QnaDataVo vo = new H_QnaDataVo();
			vo.setQd_q(qs.get(i));
			vo.setQd_a(as.get(i));
			list_qdVo.add(vo);
		}
		for (int i = 0; i < list_qdVo.size(); i++) {
			System.out.println("list_qdVo["+i+"]: "+list_qdVo.get(i));			
		}
		
		// H_TravelVo
		tVo.setUserid(userVo.getUserid());
		try {
			String originalFileName = file_travel.getOriginalFilename();
			if (originalFileName != null && !originalFileName.equals("")) {
				String pic = MyFileUploader.uploadFile(
						"C:/workspace/mw_upload_img", originalFileName, file_travel.getBytes());
				tVo.setT_pic(pic); } 
		} catch (Exception e) { e.printStackTrace(); }
		System.out.println("tVo: " + tVo);
		
		// 위 정보(vo들)를 입력
		boolean result = createService.insertRun(
				tpVo, hVo, list_hsVo, oVo, pVo, list_pdVo, qVo, list_qdVo, tVo);
		if (result) {
			System.out.println("저장 성공");
			if (userVo.getPjnum() == 0) {
				userVo.setPjnum(1);
				boolean rs_udpjn= createService.updatePjnum(userVo);
				if (rs_udpjn) {
					System.out.println("pjnum 갱신 성공");
				} else { System.out.println("pjnum 갱신 실패"); }
			}
		} else { System.out.println("저장 실패"); }
		return "redirect:/create/insert_info";
	}
	
	// 프로젝트 페이지 - 프로젝트 삭제 처리
		@RequestMapping(value = "/remove", method = RequestMethod.GET)
		public String removeProject(HttpSession session) {
			UserVo userVo = (UserVo)session.getAttribute("loginInfo");
			boolean result = createService.removeProject(userVo.getUserid());
			if (result) {
				System.out.println("삭제 성공");
				userVo.setPjnum(0);
				boolean rs_udpjn = createService.updatePjnum(userVo);
				if (rs_udpjn) {
					System.out.println("pjnum 갱신 성공");
				} else { System.out.println("pjnum 갱신 실패"); }
			} else { System.out.println("삭제 실패"); }
			return "/main/create_form";
		}
		
}
