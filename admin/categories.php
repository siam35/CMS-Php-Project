
<?php include "includes/header.php"; ?>


    <div id="wrapper">

        <!-- Navigation -->
        <?php include "includes/navigation.php"; ?>

        <div id="page-wrapper">

            <div class="container-fluid">

                <!-- Page Heading -->
                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">
                            Welcome to the admin page
                            <small>Author</small>
                        </h1>
                     
                      <div class="col-xs-6">


                        <?php 
                        
                        
                          if(isset($_POST['submit'])){

            $cat_title = $_POST['cat_title'];

        if($cat_title == "" || empty($cat_title)) {
        
             echo "This Field should not be empty";
    
    } else {
        $query="INSERT INTO categories(cat_title) ";
        $query.="VALUE ('{$cat_title}') ";
        $create_category_query = mysqli_query($connection,$query);
        if (!$create_category_query) {
            # code...
            die("Failed");
        }
    }
}



                        ?>
                        
                          <form action="" method="post">
                              
                              <div class="form-group">
                                <label for="cat-_title">Add Category</label><br>
                                  <input type="text" class="from-control" name="cat_title">

                              </div>
                               <div class="form-group">
                                  <input class="btn btn-primary" type="submit" name="submit" value="Add Category">

                              </div>
                          </form>

<?php 
if (isset($_GET['edit'])) {
    # code...
    $cat_id=$_GET['edit'];

include "includes/edit_categories.php";

}





 ?>




                            

                      

                      </div>
                      <!--Add category--> 


                     <div class="col-xs-6">

                        <table class="table table-bordered table-hover">
                            <thead>
                                <tr>
                                    <th>Id</th>
                                    <th>Category</th>
                                </tr>
                            </thead>
                            <tbody>
                    <?php 

                    $query="SELECT * FROM categories";
                    $select_categories = mysqli_query($connection,$query);            
                     while ($row=mysqli_fetch_assoc($select_categories)) {
                        # code...
                        $cat_id=$row['cat_id'];
                        $cat_title=$row['cat_title'];
                        echo"<tr>";
                        echo "<td>{$cat_id}</td>";
                        echo "<td>{$cat_title}</td>";
                        echo "<td><a href='categories.php?delete={$cat_id}'>Delete</a></td>";
                        echo "<td><a href='categories.php?edit={$cat_id}'>Edit</a></td>";
                        echo "</tr>";       
}     
?>


                         


<?php 

//Delete query
if (isset($_GET['delete'])) {
    $the_cat_id=$_GET['delete'];
    $query="DELETE FROM categories WHERE cat_id={$the_cat_id}";

    $delete_query= mysqli_query($connection,$query);
    header("Location: categories.php");
}

 ?>
                            </tbody>
                        </table>
                      </div>


 </div>
                             

                    </div>
                </div>
                <!-- /.row -->

            </div>
            <!-- /.container-fluid -->

        </div>
        <!-- /#page-wrapper -->
        

   <?php include "includes/footer.php"; ?>
