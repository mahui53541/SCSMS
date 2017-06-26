package com.github.mahui53541.srs.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public interface TranscriptService {

	List<Map<String, String>> queryTranscript(String ssn);

}
