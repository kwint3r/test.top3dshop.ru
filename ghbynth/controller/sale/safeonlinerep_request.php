<?php
/**
* @file safeonlinerep_request.php
* @author Oleksandr Kuklyuk <kuklyuk@gmail.com>
* @version 1.2.1
* @brief PHP-module which sends a request to SafeOnlineReputation`s server.
*/
error_reporting( E_ALL ^ E_NOTICE );

if( !function_exists( 'curl_init' ) ) 
{
  SafeOnlineRep_Request::errorLog( 'SafeOnlineRep_Request class requires CURL PHP extension.' );
  return false;
}

if( !function_exists( 'json_decode' ) ) 
{
  SafeOnlineRep_Request::errorLog( 'SafeOnlineRep_Request class requires JSON PHP extension.' );
  return false;
}

define( "SAFEONLINEREPUTATION_DOMAIN", "safeonlinereputation.ru" );

/**
* @class SafeOnlineRep_Request
* @brief Main class for sending requests to SafeOnlineReputation`s server.
*
*/
class SafeOnlineRep_Request
{

  private static $CURL_OPTS = Array
                                (
                                  CURLOPT_CONNECTTIMEOUT => 10,
                                  CURLOPT_RETURNTRANSFER => true,
                                  CURLOPT_TIMEOUT        => 60,
                                  CURLOPT_USERAGENT      => 'safeonlinerep_request'
                                );
  private $access_key;
  
  private $SafeOnlineRep_params = Array
                                    (
                                      'ident' => '',
                                      'customer_email' => '',
                                      'customer_salutation' => '',
                                      'customer_fullname' => '',
                                      'customer_id' => '',
                                      'customer_country' => '',
                                      'customer_city' => '',
                                      'order_id' => '',
                                      'products' => Array()
                                    );
  
  /**
  * Constructor that initializes an SafeOnlineRep_Request instance.
  * @param params Associative array that represents the SafeOnlineRep_params structure. Optional.
  * @param access_key The access key you`ve received from SafeOnlineReputation manager. Optional.
  */
  public function __construct( $params, $access_key )
  {
    if( $access_key )
    {
      $this->access_key = trim( $access_key );
    }
    $this->SafeOnlineRep_params = $params;
  }
  
  /**
  * Sets the identificator of your shop into the SafeOnlineRep_params structure.
  * @param ident String.
  *
  * Usage:
  * @code
  * //assume that $sr is an SafeOnlineRep_Request instance
  * $sr->setIdent( 'demoshop' );
  * @endcode
  */
  public function setIdent( $ident )
  {
    $this->SafeOnlineRep_params['ident'] = $ident;
  }
  
  /**
  * Sets the access key you received from SafeOnlineReputation manager.
  * @param access_key String.
  *
  * Usage:
  * @code
  * //assume that $sr is an SafeOnlineRep_Request instance
  * $sr->setAccessKey( '123WERGOSDLJEOJGSJKODBLJKB789' );
  * @endcode
  */
  public function setAccessKey( $access_key )
  {
    $this->access_key = $access_key;
  }
  
  /**
  * Sets the customer`s ID into the SafeOnlineRep_params structure.
  * @param customer_id String.
  * 
  * Usage:
  * @code
  * //assume that $sr is an SafeOnlineRep_Request instance
  * $sr->setCustomerId( 123 );
  * @endcode
  */
  public function setCustomerId( $customer_id )
  {
    $this->SafeOnlineRep_params['customer_id'] = $customer_id;
  }
  
  /**
  * Sets the third-party`s shop title into the SafeOnlineRep_params structure. 
  * @param shop_title String.
  * 
  * Usage:
  * @code
  * //assume that $sr is an SafeOnlineRep_Request instance
  * $sr->setShopTitle( 'Super Shop' );
  * @endcode
  */
  public function setShopTitle( $shop_title )
  {
    $this->SafeOnlineRep_params['shop_title'] = $shop_title;
  }
  
  /**
  * Sets the customer`s full name into the SafeOnlineRep_params structure.
  * @param customer_fullname String.
  * 
  * Usage:
  * @code
  * //assume that $sr is an SafeOnlineRep_Request instance
  * $sr->setCustomerFullname( 'John Dow' );
  * @endcode
  */
  public function setCustomerFullname( $customer_fullname )
  {
    $this->SafeOnlineRep_params['customer_fullname'] = $customer_fullname;
  }
  
  /**
  * Sets the customer`s salutation into the SafeOnlineRep_params structure.
  * @param customer_salutation String.
  * 
  * Usage:
  * @code
  * //assume that $sr is an SafeOnlineRep_Request instance
  * $sr->setCustomerFullname( 'Mr.' );
  * @endcode
  */
  public function setCustomerSalutation( $customer_salutation )
  {
    $this->SafeOnlineRep_params['customer_salutation'] = $customer_salutation;
  }
  
  /**
  * Sets the customer`s e-mail address into the SafeOnlineRep_params structure.
  * @param customer_fullname String.
  * 
  * Usage:
  * @code
  * //assume that $sr is an SafeOnlineRep_Request instance
  * $sr->setCustomerEmail( 'johndow@someserver.com' );
  * @endcode
  */
  public function setCustomerEmail( $customer_email )
  {
    $this->SafeOnlineRep_params['customer_email'] = $customer_email;
  }
  
  /**
  * Sets the customer`s country name into the SafeOnlineRep_params structure.
  * @param customer_country String.
  *
  * Usage:
  * @code
  * //assume that $sr is an SafeOnlineRep_Request instance
  * $sr->setCustomerCountry( 'United Kingdom' );
  * @endcode
  */
  public function setCustomerCountry( $customer_country )
  {
    $this->SafeOnlineRep_params['customer_country'] = $customer_country;
  }
  
  /**
  * Sets the customer`s city name into the SafeOnlineRep_params structure.
  * @param customer_city String.
  *
  * Usage:
  * @code
  * //assume that $sr is an SafeOnlineRep_Request instance
  * $sr->setCustomerCity( 'London' );
  * @endcode
  */
  public function setCustomerCity( $customer_city )
  {
    $this->SafeOnlineRep_params['customer_city'] = $customer_city;
  }
  
  /**
  * Sets the ID of current order into the SafeOnlineRep_params structure.
  * @param order_id String.
  *
  * Usage:
  * @code
  * //assume that $sr is an SafeOnlineRep_Request instance
  * $sr->setOrderId( 65456 );
  * @endcode
  */
  public function setOrderId( $order_id )
  {
    $this->SafeOnlineRep_params['order_id'] = $order_id;
  }
  
  /**
  * Adds an item to the list of products being ordered ( 'products' field in the SafeOnlineRep_params structure ).
  * @param product_name String.
  *
  * Usage:
  * @code
  * //assume that $sr is an SafeOnlineRep_Request instance
  * $sr->addProduct( 'Bluetooth handsfree headphones' );
  * @endcode
  */
  public function addProduct( $product )
  {
    if( !isset( $this->SafeOnlineRep_params['products'] ) )
    {
      $this->SafeOnlineRep_params['products'] = Array();
    }
    array_push( $this->SafeOnlineRep_params['products'], $product );
  }
  
  /**
  * Returns an associative array of SafeOnlineRep_params structure that contains data to be sent to SafeOnlineReputation`s server.
  * For test or other purposes.
  * @return Associative array of data of the current SafeOnlineRep_Request instance.
  *
  * Usage:
  * @code
  * //assume that $sr is an SafeOnlineRep_Request instance
  * $dump = $sr->Dump();
  * @endcode
  */
  public function Dump()
  {
    return $this->SafeOnlineRep_params;
  }
  
  /**
  * Sends to the SafeOnlineReputation`s server a request which contains the data of SafeOnlineRep_params structure. 
  * @return Associative array containing the following fields:
  * @li <b>status</b>:   1 if the request succeeds, otherwise 0;
  * @li <b>errno</b>:    0 if the request succeeds, otherwise error code (negative integer);
  * @li <b>error</b>:    empty string if the request succeeds, otherwise the error message.
  *
  * <p><b>Probable 'errno' values:</b></p>
  * @li 0 Success.
  * @li -1 <b>Input value is not set</b>. This error occurs if the handler on the SafeOnlineReputation`s server receives no data from your request.
  * @li -2 <b>Invalid algorithm. HMAC-SHA256 expected</b>. This error occurs if the 'algorithm' field of the request has an invalid value. (This field is filled implicitly; no user action is required.)
  * @li -3 <b>Bad signature</b>. This error occurs if the access code you provided is invalid.
  * @li -4 <b>Shop ident is not set</b>. This error occurs if <i>ident</i> field of SafeOnlineRep_params structure is empty.
  * @li -5 <b>Customer e-mail is not set</b>. This error occurs if <i>customer_email</i> field of SafeOnlineRep_params structure is empty.
  * @li -6 <b>Invalid shop ident</b>. This error occurs if <i>ident</i> field of SafeOnlineRep_params structure has an invalid value.
  * @li -7 <b>Shop ident not found</b>. This error occurs if the value you provided  for <i>ident</i> field cannot be found in SafeOnlineReputation`s database.
  * @li -8 <b>This request is a duplicate of another request received from you before</b>. This error occurs if the request for the same order is sent to SafeOnlineReputation`s server repeatedly (for example, if you set the order status to "Delivering", then set another status to that order and after it change the status to "Delivering" again. Returning this error means that the SafeOnlineReputation system prevented your customer from receive extra unnecessary "rate-us" invitations. ).
  * @li -9 <b>Error saving request</b>. Internal system error on our server.
  * @li -10 <b>Error saving product list</b>. Internal system error on our server.
  *
  *
  * If the request fails or <i>'errno'</i> is non-equal to 0, this method doesn`t throw any exception, but writes an entry into standard PHP log.
  *
  * Usage:
  * @code
  * //assume that $sr is an SafeOnlineRep_Request instance
  * $ret = $sr->Execute();
  * @endcode
  */
  public function Execute()
  {
    $ident = trim( $this->SafeOnlineRep_params['ident'] );
    if( strlen( $ident ) )
    {
      if( $data_string = $this->_scramble() )
      {
        $ch = curl_init();
        $opts = self::$CURL_OPTS;
        $opts[CURLOPT_URL] = 'https://' . $ident . '.' . SAFEONLINEREPUTATION_DOMAIN . '/request/' . $data_string;
        if( isset( $opts[CURLOPT_HTTPHEADER] ) )
        {
          $existing_headers = $opts[CURLOPT_HTTPHEADER];
          $existing_headers[] = 'Expect:';
          $opts[CURLOPT_HTTPHEADER] = $existing_headers;
        } 
        else 
        {
          $opts[CURLOPT_HTTPHEADER] = array( 'Expect:' );
        }
        
        curl_setopt_array( $ch, $opts );
        $result = curl_exec( $ch );

        if( strlen( $result ) )
        {
          $ret = json_decode( self::base64UrlDecode( $result ) );
          if( $ret->errno )
          {
            self::errorLog( "SafeOnlineRep_Request failed: " . $ret->error );
          }
          return $ret;
        }
        else
        {
          $curl_errcode =  curl_errno( $ch );
          $curl_errmsg = curl_error( $ch );
          if( $curl_errcode )
          {
            self::errorLog( $curl_errmsg . "( Error {$curl_errcode})" );
          }
          
          return false;
        }
        curl_close( $ch );
      }
      else
      {
        self::errorLog( "SafeOnlineRep_Request scrambling error." );
      }
    }
    else
    {
      self::errorLog( "SafeOnlineRep_Request error: shop ident not set." );
    }
  }
  
  private function _scramble()
  {
    if( strlen( $this->SafeOnlineRep_params['ident'] ) and strlen( $this->access_key ) )
    {
      $data = array_merge( $this->SafeOnlineRep_params, Array( 'algorithm' => 'HMAC-SHA256' ) );
      $data_encoded = self::base64UrlEncode( json_encode( $data ) );
      $sign = hash_hmac( 'sha256', $data_encoded, $this->access_key, false );
      $sign_encoded = self::base64UrlEncode( $sign );
      return "{$sign_encoded}.{$data_encoded}";
    }
    return false;
  }
  
  private static function base64UrlEncode( $input )
  {
    return strtr( base64_encode( $input ), '+/', '-_' );
  }
  
  private static function base64UrlDecode( $input )
  {
    return base64_decode( strtr( $input, '-_', '+/' ) );
  }
  
  public static function errorLog( $msg ) 
  {
    if( php_sapi_name() != 'cli' )
    {
      error_log( $msg );
    }
    
    //uncomment this if you want to see the errors on the screen
    print 'error_log: ' . $msg . "\n";
  }

}