<footer class="bg-second">
        <div class="container">
            <div class="row">
                <div class="col-5 col-md-6 ">
                    <h3 class="footer-head">Web bán đồ điện tử</h3>
                    <ul class="menu">
                        <li><a href="#">Sinh viên thực hiện: </a></li>
                        <li><a href="#">Shop Chính hãng</a></li>
                        <li><a href="#">Địa chỉ: 135 Cầu Giấy</a></li>
                    </ul>
                </div>

                <div class="col-5 col-md-6">
                    <h3 class="footer-head">Danh mục sản phẩm</h3>
                    <ul class="menu">
                        <li><a href="#">Laptop chính hãng giá rẻ</a></li>
                        <li><a href="#">Điện thoại chính hãng</a></li>
                        <li><a href="#">Tai nghe giá rẻ</a></li>
                    </ul>
                </div>
                <div class="col-2 col-md-6 col-sm-12">
                    <div class="contact">
                        <h3 class="contact-header">
                            COSSOFT
                        </h3>
                        <ul class="contact-socials">
                            <li><a href="#">
                                    <i class='bx bxl-facebook-circle'></i>
                                </a></li>
                            <li><a href="#">
                                    <i class='bx bxl-instagram-alt'></i>
                                </a></li>
                            <li><a href="#">
                                    <i class='bx bxl-youtube'></i>
                                </a></li>
                            <li><a href="#">
                                    <i class='bx bxl-twitter'></i>
                                </a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
</footer>
<!-- app js -->
<script src="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/alertify.min.js"></script>
<script>
  <?php if(isset($_SESSION['message']))
  {
  ?>
    alertify.set('notifier','position', 'top-right');
    alertify.success('<?= $_SESSION['message'] ?>');
  <?php 
    unset($_SESSION['message']);
  }
  ?>
</script>
