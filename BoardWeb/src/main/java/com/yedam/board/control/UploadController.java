package com.yedam.board.control;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.yedam.board.domain.AttachFileDTO;

import lombok.extern.log4j.Log4j;
import net.coobird.thumbnailator.Thumbnailator;
import oracle.jdbc.proxy.annotation.Post;

@Controller
@Log4j
public class UploadController {
	
	@GetMapping("/uploadForm")
	public void uploadForm() {
		log.info("uploadForm...");
	}
	
	
	@GetMapping("/uploadAjax")
	public void uploadAjax() {
		log.info("uploadAjax...");
	}
	
	
	@PostMapping("/uploadFormAction")
	public void uploadFormPost(MultipartFile[] uploadFile) {
		String uploadFolder = "c:\\upload";
		
		
		for(MultipartFile multipartFile : uploadFile) {
			log.info("----------");
			log.info("Upload FileName:" + multipartFile.getOriginalFilename());
			log.info("file Size:"+ multipartFile.getSize());
			
			File saveFile = new File(uploadFolder, multipartFile.getOriginalFilename());
			
			try {
				multipartFile.transferTo(saveFile);
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}
 	
	
	@PostMapping(value = "/uploadAjaxAction", 
			produces= MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public  List<AttachFileDTO> uploadAjaxPost(MultipartFile[] uploadFile) {
		
		List<AttachFileDTO> list = new ArrayList<>();
		
		
		String uploadFolder = "c:\\upload";
		
		// folder setting
				File uploadPath = new File(uploadFolder, getFolder());
				log.info(uploadPath);
				
				if (uploadPath.exists() == false) {	// 폴더가 존재하는지 체크 후 폴더 생성.
					uploadPath.mkdirs();
				}
		
		for(MultipartFile multipartFile : uploadFile) {
			AttachFileDTO attachDTO = new AttachFileDTO();
			
			String uploadFileName = multipartFile.getOriginalFilename();
			attachDTO.setFileName(uploadFileName);
			
			// 중복된 파일이름 방지. UUID -> 중복되지 않는 임의의 값을 문자로 만듦.
			UUID uuid = UUID.randomUUID();	// 문자열을 중복되지 않게 랜덤 생성.
			uploadFileName = uuid.toString() + "_" + uploadFileName;
			
			
			log.info(uploadFileName);
			
			// File saveFile = new File(uploadFolder, uploadFileName);
			File saveFile = new File(uploadPath, uploadFileName);
			
			try {
				multipartFile.transferTo(saveFile);
				
				attachDTO.setUuid(uuid.toString());
				attachDTO.setUploadPath(uploadFolder);
				
				// 이미지 파일이면 썸네일 이미지 생성.
				if(checkImageType(saveFile)) {
					
					
					FileOutputStream thumbnail = new FileOutputStream(new File(uploadPath, "s_" + uploadFileName));
					Thumbnailator.createThumbnail(multipartFile.getInputStream(), thumbnail, 200, 200);
					thumbnail.close();
				}
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			list.add(attachDTO);
			
		}	// end of for
		
		return list;
	}	// end of uploadAjaxPost
	
	
	// 업로드 파일을 저장할 폴더를 날자별로 생성해서 저장하기 위한 폴저네이밍.
	private String getFolder() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date();
		String str = sdf.format(date);
		
		return str.replace("-", File.separator);
	}
	
	
	// 이미지 파일 여부 체크.
	private boolean checkImageType(File file) {
		try {
			String contentType = Files.probeContentType(file.toPath());
			log.info(contentType);	// image/PNG
			return contentType.startsWith("image");
			
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return false;
	}
	
	
}
