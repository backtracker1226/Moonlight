package org.moon.controller;

import java.awt.Graphics;
import java.awt.Image;
import java.awt.image.BufferedImage;
import java.awt.image.ImageObserver;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import javax.imageio.ImageIO;

import org.apache.commons.io.IOUtils;
import org.apache.log4j.Logger;
import org.imgscalr.Scalr;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

@Controller
@RequestMapping("/up/*")
public class UploadController {

	private static Logger logger = Logger.getLogger(UploadController.class);

	@GetMapping(name = "/display", produces = { "image/jpg; charset=UTF-8" })
	@ResponseBody
	public byte[] display(String fileName) throws Exception {

		InputStream fin = new FileInputStream("C:\\zzz\\upimages\\"+fileName);
		byte[] arr = IOUtils.toByteArray(fin);

		fin.close();
		
		logger.info("File display");

		return arr;
	}
	// 안씀
	@GetMapping(name = "/imagedisplay")
	@ResponseBody
	public ResponseEntity<byte[]> imagedisplay(String fileName) throws Exception {

//		InputStream fin = new FileInputStream("C:\\editorimages\\" + fileName);
		String formatName = fileName.substring(fileName.lastIndexOf(".")+1);
		Map<String, MediaType> mimeMap = new HashMap<>();
		mimeMap.put("jpg", MediaType.IMAGE_JPEG);
		mimeMap.put("gif", MediaType.IMAGE_GIF);
		mimeMap.put("png", MediaType.IMAGE_PNG);
		MediaType mType = mimeMap.get(formatName);
		logger.info("확장자: "+mType);
		ResponseEntity<byte[]> entity = null;
		HttpHeaders headers = new HttpHeaders();
		String path = "C:\\editorimages\\";
		InputStream in = new FileInputStream(path + fileName);
		headers.setContentType(mType);
//		headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
//		headers.add("Content-Disposition",
//				"attachment;filename=\"" + new String(fileName.getBytes("UTF-8"), "ISO-8859-1") + "\"");
		entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in), headers, HttpStatus.CREATED);

		return entity;
	}

	@GetMapping("/filedown")
	@ResponseBody
	public ResponseEntity<byte[]> filedown(String fileName) throws Exception {
		// String formatName = fileName.substring(fileName.lastIndexOf(".")+1);
		ResponseEntity<byte[]> entity = null;

		// Map<String,MediaType> mimeMap= new HashMap<>();
		// mimeMap.put("JPG", MediaType.IMAGE_JPEG);
		// mimeMap.put("GIF", MediaType.IMAGE_GIF);
		// mimeMap.put("PNG", MediaType.IMAGE_PNG);
		
		// MediaType mType = mimeMap.get(formatName);
		HttpHeaders headers = new HttpHeaders();
		String path = "C:\\editorfiles\\";
		InputStream in = new FileInputStream(path + fileName);
		// headers.setContentType(mType);
		headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
		headers.add("Content-Disposition",
				"attachment;filename=\"" + new String(fileName.getBytes("UTF-8"), "ISO-8859-1") + "\"");
		entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in), headers, HttpStatus.CREATED);

		return entity;

	}
	
	@GetMapping("/noticefiledown")
	@ResponseBody
	public ResponseEntity<byte[]> filedownload(String fileName) throws Exception {
		// String formatName = fileName.substring(fileName.lastIndexOf(".")+1);
		ResponseEntity<byte[]> entity = null;

		// Map<String,MediaType> mimeMap= new HashMap<>();
		// mimeMap.put("JPG", MediaType.IMAGE_JPEG);
		// mimeMap.put("GIF", MediaType.IMAGE_GIF);
		// mimeMap.put("PNG", MediaType.IMAGE_PNG);
		// MediaType mType = mimeMap.get(formatName);
		HttpHeaders headers = new HttpHeaders();
		String path = "C:\\zzz\\upimages\\";
		InputStream in = new FileInputStream(path + fileName);
		// headers.setContentType(mType);
		headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
		headers.add("Content-Disposition",
				"attachment;filename=\"" + new String(fileName.getBytes("UTF-8"), "ISO-8859-1") + "\"");
		entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in), headers, HttpStatus.CREATED);

		return entity;

	}	
	
	@PostMapping("/upload1")
	@ResponseBody
	public String[] upload1Post(@RequestParam("file[]") MultipartFile[] files)
			throws FileNotFoundException, IOException {
		
		String[] arr = new String[files.length];
		
		for(int i = 0; i< files.length; i++){
			UUID uid = UUID.randomUUID();

			String uidStr = uid.toString();
			String saveName = uidStr + "_" + files[i].getOriginalFilename();
			String thumbName = uidStr + "_s_" + files[i].getOriginalFilename();

			IOUtils.copy(files[i].getInputStream(), new FileOutputStream("C:\\zzz\\upimages\\" + saveName));

			BufferedImage src = ImageIO.read(files[i].getInputStream());

			BufferedImage thumb = Scalr.resize(src, Scalr.Method.AUTOMATIC, Scalr.Mode.FIT_TO_HEIGHT, 600);

			ImageIO.write(thumb, "jpg", new FileOutputStream("C:\\zzz\\upimages\\" + thumbName));
			
			arr[i] = thumbName;
		}		
		return arr;
	}
	
	
	// 씀
	@PostMapping(name = "/fileup", produces =  "text/plain; charset=UTF-8" )
	@ResponseBody
	public String notice(@RequestParam("fileName") MultipartFile fileName)
			throws FileNotFoundException, IOException {
		logger.info(fileName.getName());
		logger.info(fileName.getOriginalFilename());
		logger.info("uploadPost");
 
		UUID uid = UUID.randomUUID();

		String uidStr = uid.toString();
		String saveName = uidStr + "_" + fileName.getOriginalFilename();
		String thumbName = uidStr + "_s_" + fileName.getOriginalFilename();
		String[] savenameValue = saveName.split("\\.");
		
		IOUtils.copy(fileName.getInputStream(), new FileOutputStream("C:\\zzz\\upimages\\" + saveName));
		
		logger.info(saveName);
		logger.info(savenameValue[1]);
		if (!(savenameValue[1].equals("jpg") || savenameValue[1].equals("gif") || savenameValue[1].equals("png"))) {
			return saveName;
			
		} else {
			
			BufferedImage src = ImageIO.read(fileName.getInputStream());
			
			BufferedImage thumb = Scalr.resize(src, Scalr.Method.AUTOMATIC, Scalr.Mode.FIT_TO_HEIGHT, 600);

			ImageIO.write(thumb, "jpg", new FileOutputStream("C:\\zzz\\upimages\\" + thumbName));

			logger.info("이미지파일 넘어옴: "+ thumbName);
			
			return thumbName;
		}
	}
	
	@DeleteMapping("/delete")
	@ResponseBody
	public String delete(@RequestBody String fileName) {
		String temp = fileName.replace("_s_", "_");
		File imgFile = new File("C:\\zzz\\upimages\\" + fileName);
		File imgFile2 = new File("C:\\zzz\\upimages\\" + temp);
		imgFile.delete();
		imgFile2.delete();

		return "success";
	}

	
	@PostMapping("/editorfile")
	@ResponseBody
	public Map<String, Object> editorFile(@RequestParam("Filedata") MultipartFile multipartFile) {
		logger.info("fileupload...................");
		Map<String, Object> fileMap = new HashMap<>();
		if (multipartFile != null && !(multipartFile.getOriginalFilename().equals(""))) {
			logger.info(multipartFile.getOriginalFilename());
			long filesize = multipartFile.getSize();
			long limitFileSize = 5 * 1024 * 1024;
			if (limitFileSize < filesize) {
				fileMap.put("result", -1);
				return fileMap;
			}

			SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
			String today = formatter.format(new Date());
			String originalName = multipartFile.getOriginalFilename();
			String modifyName = today + "-" + originalName;
			String path = "C:\\editorfiles\\";// 날짜별 폴더생성.
			File file = new File(path);
			if (!file.exists()) { // 디렉토리 존재하지 않을경우 디렉토리 생성
				file.mkdirs();
			}
			try {
				multipartFile.transferTo(new File(path + modifyName));
				logger.info("** upload 정보 **");
				logger.info("** path : " + path + " **");
				logger.info("** originalName : " + originalName + " **");
				logger.info("** modifyName : " + modifyName + " **");

			} catch (Exception e) {
				e.printStackTrace();
				logger.info("파일업로드 실패 ------------");
			}
			String fileMime = multipartFile.getContentType();
			logger.info(fileMime);

			fileMap.put("attachurl", path + modifyName);
			fileMap.put("filemime", fileMime); // mime
			fileMap.put("filename", modifyName); // 파일명
			fileMap.put("filesize", filesize); // 파일사이즈
			fileMap.put("result", 1); // -1을 제외한 아무거나 싣어도 됨
		}

		return fileMap;
	}

	@PostMapping("/imagefile")
	@ResponseBody
	public Map<String, Object> imageFile(@RequestParam("Filedata") MultipartFile multipartFile) {
		logger.info("fileupload...................");
		Map<String, Object> fileMap = new HashMap<>();
		if (multipartFile != null && !(multipartFile.getOriginalFilename().equals(""))) {
			logger.info(multipartFile.getOriginalFilename());
			String originalName = multipartFile.getOriginalFilename();
			String originalNameExtension = originalName.substring(originalName.lastIndexOf(".") + 1).toLowerCase();
			logger.info("확장자: " + originalNameExtension);
			if (!((originalNameExtension.equals("jpg")) || (originalNameExtension.equals("gif"))
					|| (originalNameExtension.equals("png")) || (originalNameExtension.equals("bmp")))) {

				fileMap.put("result", -1); // 허용 확장자가 아닐 경우
				return fileMap;

			}
			long filesize = multipartFile.getSize(); // 파일크기
			long limitFileSize = 5 * 1024 * 1024; // 5MB
			if (limitFileSize < filesize) { // 제한보다 파일크기가 클 경우
				fileMap.put("result", -2);
				return fileMap;
			}
			String path = "C:\\zzz\\upimages\\";
			File file = new File(path);
			if (!file.exists()) { // 디렉토리 존재하지 않을경우 디렉토리 생성
				file.mkdirs();
			}

			SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
			String today = formatter.format(new Date());
			String modifyName = today + "-" + UUID.randomUUID().toString().substring(20) + "." + originalNameExtension;
			try { // 서버에 파일 저장 (쓰기)
				File savefile = new File(path + modifyName);
				multipartFile.transferTo(savefile);

				
			} catch (Exception e) {
				e.printStackTrace();
				logger.info("이미지파일업로드 실패 ");
			}

			String imageurl = "/up/display?fileName="; // separator와는 다름! 
			fileMap.put("imageurl", imageurl+modifyName); // 상대파일경로(사이즈변환이나 변형된 파일) 
			fileMap.put("filename", modifyName); // 파일명
			fileMap.put("filesize", filesize); // 파일사이즈
			fileMap.put("imagealign", "L"); // 이미지정렬(C:center) 
			fileMap.put("originalurl", imageurl+modifyName); // 실제파일경로
			fileMap.put("thumburl", imageurl+modifyName); // 썸네일파일경로(사이즈변환이나 변형된 파일) 
			fileMap.put("result", 1); // -1, -2를 제외한 아무거나 싣어도 됨

		}

		return fileMap;
	}

}
