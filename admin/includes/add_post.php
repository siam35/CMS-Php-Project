
<?php 

//// Project Name
//define('cms', 'ldpm');
//// Root path
//define('ROOT', strstr($_SERVER['REQUEST_URI'], cms, true).cms.'/');

//define('ADMIN_ROOT', ROOT.'admin/');



	  if(isset($_POST['create_post'])) {
   
            $post_title        = $_POST['title'];
            $post_author       = $_POST['author'];
            $post_category_id  = $_POST['post_category'];
            $post_status       = $_POST['post_status'];
    
            $post_image        = $_FILES['image']['name'];
            $post_image_temp   = $_FILES['image']['tmp_name'];
    
    
            $post_tags         = $_POST['post_tags'];
            $post_content      = $_POST['post_content'];
            $post_date         = date('d-m-y');



move_uploaded_file($post_image_temp, "../images/$post_image") ;



/* function file_upload($location,$file,$prefix) {
		if(strlen($file['name']>30)){
		$name = $prefix.'_'.substr(str_replace(" ", "-",$file['name']), -30);
		}
		else{
			$name=$prefix.'_'.str_replace(" ", "-",$file['name']);
		}
        
        $tmpName = $file['tmp_name'];
        $error = $file['error'];
        $size = $file['size'];
        $ext = strtolower(pathinfo($name, PATHINFO_EXTENSION));
        $response = array();
        switch ($error) {
            case UPLOAD_ERR_OK:
                $valid = true;
                //validate file extensions
                if (!in_array($ext, array('jpg', 'jpeg', 'png', 'gif','pdf','doc','docx','xls','xlsx'))) {
                    $valid = false;
                    $response[] = 'Invalid file extension.';
                }
                //validate file size
                if ($size / 1024 / 1024 > 30) {
                    $valid = false;
                    $response[] = 'File size is exceeding maximum allowed size.';
                }
                //upload file
                if ($valid) {

                    $rename = strtolower(date("Y_m_d_H_i_s"). '_' . $name);
                    $targetPath = dirname(_FILE_) . DIRECTORY_SEPARATOR . $location . DIRECTORY_SEPARATOR . $rename;
                    move_uploaded_file($tmpName, $targetPath);
                    $response['file_name'] = $rename;
                }
                break;
            case UPLOAD_ERR_INI_SIZE:
                $response[] = 'The uploaded file exceeds the upload_max_filesize directive in php.ini.';
                break;
            case UPLOAD_ERR_FORM_SIZE:
                $response[] = 'The uploaded file exceeds the MAX_FILE_SIZE directive that was specified in the HTML form.';
                break;
            case UPLOAD_ERR_PARTIAL:
                $response[] = 'The uploaded file was only partially uploaded.';
                break;
            case UPLOAD_ERR_NO_FILE:
                $response[] = 'No file was uploaded.';
                break;
            case UPLOAD_ERR_NO_TMP_DIR:
                $response[] = 'Missing a temporary folder. Introduced in PHP 4.3.10 and PHP 5.0.3.';
                break;
            case UPLOAD_ERR_CANT_WRITE:
                $response[] = 'Failed to write file to disk. Introduced in PHP 5.1.0.';
                break;
            case UPLOAD_ERR_EXTENSION:
                $response[] = 'File upload stopped by extension. Introduced in PHP 5.2.0.';
                break;
            default:
                $response[] = 'Unknown error';
                break;
        }

        return $response;
    }

*/


 $query = "INSERT INTO posts(post_category_id, post_title, post_author, post_date,post_image,post_content,post_tags,post_status) ";
 $query .= "VALUES({$post_category_id},'{$post_title}','{$post_author}',now(),'{$post_image}','{$post_content}',
 '{$post_tags}','{$post_status}') "; 

 //echo $query;
             
      $create_post_query = mysqli_query($connection, $query);

      if (!$create_post_query) {
      	# code...
      	die("Query Failed" .mysqli_error($connection));
      }
      
}

 ?>



<form action="" method="post" enctype="multipart/form-data">


	<div class="form-group">
		<label for="title">Post title</label>
		<input type="text" class="form-control" name="title">
	</div>

<div class="form-group">
		<select name="post_category" id="">
			<?php 
              $query="SELECT * FROM categories";
                    $select_categories = mysqli_query($connection,$query);            
                     while ($row=mysqli_fetch_assoc($select_categories)) {
                        # code...
                        $cat_id=$row['cat_id'];
                        $cat_title=$row['cat_title'];


                       echo "<option value='{$cat_id}'>{$cat_title}</option>";
                    }

			 ?>
		</select>
	</div>
	<div class="form-group">
		<label for="post_author">Post Author</label>
		<input type="text" class="form-control" name="author">
	</div>
	<div class="form-group">
		<label for="post_status">Post Status</label>
		<input type="text" class="form-control" name="post_status">
	</div>
	<div class="form-group">
		<label for="post_image">Post Image</label>
		<input type="file" name="image">
	</div>
	<div class="form-group">
		<label for="post_tags">Post Tags</label>
		<input type="text" class="form-control" name="post_tags">
	</div>
	<div class="form-group">
		<label for="post_content">Post Content</label>
		<textarea class="form-control" name="post_content" id="" cols="30" rows="10"></textarea>
	</div>
	<div class="form-group">
		
		<input type="submit" class="btn btn-primary" name="create_post" value="Publish Post">
	</div>
	

</form>