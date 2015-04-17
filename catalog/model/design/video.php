<?php
class ModelDesignVideo extends Model {	
	public function getVideo($video_id) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "video_player bi 
		LEFT JOIN " . DB_PREFIX . "video_player_description bid ON (bi.video_player_id  = bid.video_player_id) 
		WHERE 
		bi.video_id = '" . (int)$video_id . "' 
		AND 
		bid.language_id = '" . (int)$this->config->get('config_language_id') . "'");
		
		return $query->rows;
	}
}
?>