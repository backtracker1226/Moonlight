package org.moon.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.io.IOUtils;
import org.apache.log4j.Logger;
import org.moon.util.MediaUtils;
import org.moon.util.UploadFileUtils;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class RoofTopUploadController {

	private static final Logger logger = Logger.getLogger(RoofTopUploadController.class);

	/*@GetMapping("/uploadForm")
	public void uploadFormGet() {

	}
*/
	@Resource(name = "uploadPath")
	private String uploadPath;

	/*
	 * @PostMapping("/uploadForm") public void uploadFormPost(MultipartFile
	 * file, Model model)throws Exception{
	 * 
	 * String savedName = uploadFile(file.getOriginalFilename(),
	 * file.getBytes());
	 * 
	 * model.addAttribute("savedName", savedName);
	 * 
	 * }
	 */

	@ResponseBody
	@RequestMapping(value = "/uploadAjax", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
	public ResponseEntity<String> uploadAjax(MultipartFile file) throws Exception {

		logger.info("originalName: " + file.getOriginalFilename());
		logger.info("uploadAjax start!");

		return new ResponseEntity<>(UploadFileUtils.uploadFile(uploadPath, file.getOriginalFilename(), file.getBytes()),
				HttpStatus.CREATED);

	}

	@ResponseBody
	@RequestMapping("/displayFile")
	public ResponseEntity<byte[]> displayFile(String fileName) throws Exception {

		InputStream in = null;

		ResponseEntity<byte[]> entity = null;

		logger.info("FILE NAME: " + fileName);

		try {

			String formatName = fileName.substring(fileName.lastIndexOf(".") + 1);

			MediaType mType = MediaUtils.getMediaType(formatName);

			HttpHeaders headers = new HttpHeaders();

			in = new FileInputStream(uploadPath + fileName);

			if (mType != null) {

				headers.setContentType(mType);
			} else {// 책이랑 다른곳. 이미지 파일만 올리게 할 것이므로. 564쪽 참고

			}

			entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in), headers, HttpStatus.CREATED);

		} catch (Exception e) {

			e.printStackTrace();
			entity = new ResponseEntity<byte[]>(HttpStatus.BAD_REQUEST);

		} finally {
			in.close();
		}

		return entity;
	}

	@ResponseBody
	@PostMapping("/deleteFile")
	public ResponseEntity<String> deleteFile(String fileName) {

		logger.info("delete file: " + fileName);

		String formatName = fileName.substring(fileName.lastIndexOf(".") + 1);

		logger.info("formatName: " + formatName);

		MediaType mType = MediaUtils.getMediaType(formatName);

		logger.info("mType: " + mType);

		if (mType != null) {

			logger.info("1111");
			String front = fileName.substring(0, 12);
			String end = fileName.substring(14);
			logger.info("front: " + front);
			logger.info("end: " + end);
			new File(uploadPath + (front + end).replace('/', File.separatorChar)).delete();

		}
		logger.info("2222");
		new File(uploadPath + fileName.replace('/', File.separatorChar)).delete();

		return new ResponseEntity<String>("deleted", HttpStatus.OK);

	}

	@ResponseBody
	@RequestMapping(value = "/deleteAllFiles", method = RequestMethod.POST)
	public ResponseEntity<String> deleteFile(@RequestParam("files[]") String[] files) {

		logger.info("delete all files: " + files);

		if (files == null || files.length == 0) {
			return new ResponseEntity<String>("deleted", HttpStatus.OK);
		}

		for (String fileName : files) {
			String formatName = fileName.substring(fileName.lastIndexOf(".") + 1);

			MediaType mType = MediaUtils.getMediaType(formatName);

			/*if (mType != null) {

				String front = fileName.substring(0, 12);
				String end = fileName.substring(14);
				new File(uploadPath + (front + end).replace('/', File.separatorChar)).delete();
			}*/

			new File(uploadPath + fileName.replace('/', File.separatorChar)).delete();

		}
		return new ResponseEntity<String>("deleted", HttpStatus.OK);
	}

	@ResponseBody
	@RequestMapping(value = "/deleteAllHashTags", method = RequestMethod.POST)
	public ResponseEntity<String> deleteHashTag(@RequestParam(value = "hashtags[]") String[] tagArr) {

		logger.info("delete all HashTags: " + tagArr);

		if (tagArr == null || tagArr.length == 0) {
			return new ResponseEntity<String>("deleted", HttpStatus.OK);
		}

		return new ResponseEntity<String>("deleted", HttpStatus.OK);
	}
	
	@ResponseBody
	@RequestMapping(value = "/deleteAllOptions", method = RequestMethod.POST)
	public ResponseEntity<String> deleteOption(@RequestParam(value = "options[]") String[] optionArr) {

		logger.info("delete all options: " + optionArr);

		if (optionArr == null || optionArr.length == 0) {
			return new ResponseEntity<String>("deleted", HttpStatus.OK);
		}

		return new ResponseEntity<String>("deleted", HttpStatus.OK);
	}

	
	 /*@ResponseBody
	 @PostMapping("/uploadOption") public void
	 uploadOption(@RequestParam(value="options[]") List<String> optionArr){
	 
		 logger.info("Option: "+optionArr); 
	 
	 }*/
	 

	@ResponseBody
	@PostMapping("/uploadOption")
	public ResponseEntity<List<String>> updateOption(@RequestParam(value = "options[]") List<String> optionArr)
			throws Exception {

		ResponseEntity<List<String>> entity = null;

		try {

			entity = new ResponseEntity<>(optionArr, HttpStatus.OK);

		} catch (Exception e) {
			e.printStackTrace();

			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);

		}

		return entity;
	}

	/*
	 * @ResponseBody
	 * 
	 * @PostMapping("/uploadTags") public void
	 * uploadTags(@RequestParam(value="hashtags[]") List<String> tagArr){
	 * 
	 * logger.info("HashTags: "+tagArr); }
	 */

	@ResponseBody
	@PostMapping("/uploadTags")
	public ResponseEntity<List<String>> updateTags(@RequestParam(value = "hashtags[]") List<String> tagArr)
			throws Exception {

		ResponseEntity<List<String>> entity = null;

		try {

			entity = new ResponseEntity<>(tagArr, HttpStatus.OK);

		} catch (Exception e) {
			e.printStackTrace();

			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);

		}

		return entity;
	}
	/*
	 * private String uploadFile(String originalFilename, byte[] fileData)
	 * throws Exception{
	 * 
	 * UUID uid = UUID.randomUUID();
	 * 
	 * String savedName = uid.toString() + "_" + originalFilename;
	 * 
	 * File target = new File(uploadPath,savedName);
	 * 
	 * FileCopyUtils.copy(fileData, target);
	 * 
	 * return savedName; }
	 */

}
