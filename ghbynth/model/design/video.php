<?php
class ModelDesignVideo extends Model {
	public function addVideo($data) {
		$this->db->query("INSERT INTO " . DB_PREFIX . "video 
		SET 
		name = '" . $this->db->escape($data['name']) . "', 
		status = '" . (int)$data['status'] . "'");
	
		$video_id = $this->db->getLastId();
	
		if (isset($data['video_player'])) {
			foreach ($data['video_player'] as $video_player) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "video_player 
				SET 
				video_id = '" . (int)$video_id . "', 
				link = '" .  $this->db->escape($video_player['link']) . "'
			");
				
				$video_player_id = $this->db->getLastId();
				
				foreach ($video_player['video_player_description'] as $language_id => $video_player_description) {				
					$this->db->query("INSERT INTO " . DB_PREFIX . "video_player_description 
					SET 
					video_player_id = '" . (int)$video_player_id . "', 
					language_id = '" . (int)$language_id . "', 
					video_id = '" . (int)$video_id . "', 
					title = '" .  $this->db->escape($video_player_description['title']) . "'");
				}
			}
		}		
	}
	
	public function editVideo($video_id, $data) {
		$this->db->query("UPDATE " . DB_PREFIX . "video 
		SET 
		name = '" . $this->db->escape($data['name']) . "', 
		status = '" . (int)$data['status'] . "' 
		WHERE 
		video_id = '" . (int)$video_id . "'
	");

		$this->db->query("DELETE FROM " . DB_PREFIX . "video_player WHERE video_id = '" . (int)$video_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "video_player_description WHERE video_id = '" . (int)$video_id . "'");
			
		if (isset($data['video_player'])) {
			foreach ($data['video_player'] as $video_player) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "video_player 
				SET 
				video_id = '" . (int)$video_id . "', 
				link = '" .  $this->db->escape($video_player['link']) . "'
			");
				
				$video_player_id = $this->db->getLastId();
				
				foreach ($video_player['video_player_description'] as $language_id => $video_player_description) {				
					$this->db->query("INSERT INTO " . DB_PREFIX . "video_player_description 
					SET 
					video_player_id = '" . (int)$video_player_id . "', 
					language_id = '" . (int)$language_id . "', 
					video_id = '" . (int)$video_id . "', 
					title = '" .  $this->db->escape($video_player_description['title']) . "'
				");
				}
			}
		}			
	}
	
	public function deleteVideo($video_id) {
		$this->db->query("DELETE FROM " . DB_PREFIX . "video WHERE video_id = '" . (int)$video_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "video_player WHERE video_id = '" . (int)$video_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "video_player_description WHERE video_id = '" . (int)$video_id . "'");
	}
	
	public function getVideo($video_id) {
		$query = $this->db->query("SELECT DISTINCT * FROM " . DB_PREFIX . "video WHERE video_id = '" . (int)$video_id . "'");
		
		return $query->row;
	}
		
	public function getVideos($data = array()) {
		$sql = "SELECT * FROM " . DB_PREFIX . "video";
		
		$sort_data = array(
			'name',
			'status'
		);	
		
		if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
			$sql .= " ORDER BY " . $data['sort'];	
		} else {
			$sql .= " ORDER BY name";	
		}
		
		if (isset($data['order']) && ($data['order'] == 'DESC')) {
			$sql .= " DESC";
		} else {
			$sql .= " ASC";
		}
		
		if (isset($data['start']) || isset($data['limit'])) {
			if ($data['start'] < 0) {
				$data['start'] = 0;
			}					

			if ($data['limit'] < 1) {
				$data['limit'] = 20;
			}	
		
			$sql .= " LIMIT " . (int)$data['start'] . "," . (int)$data['limit'];
		}		
		
		$query = $this->db->query($sql);

		return $query->rows;
	}
		
	public function getVideoPlayers($video_id) {
		$video_player_data = array();
		
		$video_player_query = $this->db->query("SELECT * FROM " . DB_PREFIX . "video_player WHERE video_id = '" . (int)$video_id . "'");
		
		foreach ($video_player_query->rows as $video_player) {
			$video_player_description_data = array();
			 
			$video_player_description_query = $this->db->query("SELECT * FROM " . DB_PREFIX . "video_player_description WHERE video_player_id = '" . (int)$video_player['video_player_id'] . "' AND video_id = '" . (int)$video_id . "'");
			
			foreach ($video_player_description_query->rows as $video_player_description) {			
				$video_player_description_data[$video_player_description['language_id']] = array('title' => $video_player_description['title']);
			}
		
			$video_player_data[] = array(
				'video_player_description' => $video_player_description_data,
				'link'                     => $video_player['link']
			);
		}
		
		return $video_player_data;
	}
	
	public function getTotalVideos() {
      	$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "video");
		
		return $query->row['total'];
	}	
}
?>