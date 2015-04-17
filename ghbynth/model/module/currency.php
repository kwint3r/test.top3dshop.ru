<?

class ModelModuleCurrency extends Model {
	
	public function index($product_id, $data) {
		
		$this->db->query("DELETE FROM ".DB_PREFIX."product_currency WHERE product_id = '".(int)$product_id."'");
		
		if($data['usd'] || $data['eur']){
			$this->db->query("INSERT INTO ".DB_PREFIX."product_currency SET product_id = '".(int)$product_id."', usd = '".(int)$data['usd']."', eur = '".$data['eur']."'");
		}
		
	}

	public function getData($product_id) {
		$query = $this->db->query("SELECT * FROM ".DB_PREFIX."product_currency WHERE product_id = '".(int)$product_id."'");
		return $query->row;
	}

}