@php
use App\Models\CategoryPost;
$category = CategoryPost::select('title', 'slug')->get();
@endphp
<!DOCTYPE html>
<html lang="zxx">

<head>
    <meta charset="UTF-8">
    <meta name="description" content="Đấu giá Template">
    <meta name="keywords" content="Đấu giá, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name='robots' content='index, follow, max-image-preview:large, max-snippet:-1, max-video-preview:-1' />
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="canonical" href="{{URL('/')}}">
    <link rel="icon" href="{{asset('public/mevivu/img/logo.png')}}" type="image/gif" sizes="32x32">
    <title>Đấu giá | Template</title>

    <!-- Google Font -->
    <!-- <link href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap" rel="stylesheet"> -->
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Pridi:wght@200;300;400;600;900&display=swap" rel="stylesheet">
    <!-- Css Styles -->
    <link rel="stylesheet" href="{{asset('public/mevivu/css/bootstrap.min.css')}}" type="text/css">
    <link rel="stylesheet" href="{{asset('public/mevivu/css/font-awesome.min.css')}}" type="text/css">
    <link rel="stylesheet" href="{{asset('public/mevivu/css/elegant-icons.css')}}" type="text/css">
    <link rel="stylesheet" href="{{asset('public/mevivu/css/nice-select.css')}}" type="text/css">
    <link rel="stylesheet" href="{{asset('public/mevivu/css/jquery-ui.min.css')}}" type="text/css">
    <link rel="stylesheet" href="{{asset('public/mevivu/css/owl.carousel.min.css')}}" type="text/css">
    <link rel="stylesheet" href="{{asset('public/mevivu/css/slicknav.min.css')}}" type="text/css">
    <link rel="stylesheet" href="{{asset('public/mevivu/css/style.css')}}" type="text/css">
</head>

<body>
    <!-- Page Preloder -->
    <div id="preloder">
        <div class="loader"></div>
    </div>

    <!-- Humberger Begin -->
    <div class="humberger__menu__overlay"></div>
    <div class="humberger__menu__wrapper">
        <div class="humberger__menu__logo">
            <a href="{{URL::to('/')}}"><img src="{{asset('public/mevivu/img/logo.png')}}" alt=""></a>
        </div>
        <div class="humberger__menu__cart">
            <ul>
                <li><a href="#"><i class="fa fa-heart"></i> <span>1</span></a></li>
                <li><a href="#"><i class="fa fa-shopping-bag"></i> <span>3</span></a></li>
            </ul>
            <div class="header__cart__price"><span>150.000 đ</span></div>
        </div>
        <div class="humberger__menu__widget">
            @guest
            <div class="header__top__right__auth header__top__register">
                <a href="{{URL::to('/dang-nhap')}}"><i class="fa fa-user"></i>Đăng nhập</a>
            </div>
            <div class="header__top__right__auth">
                <a href="{{URL::to('/lien-he')}}"><i class="fa fa-user-plus"></i>Đăng ký đại lý</a>
            </div>
            @endguest
            @auth
            <div class="header__top__right__auth">
                    <a href="{{URL::to('/dang-ky')}}">Xin chào, {{Auth::user()->name}}</a>
                </div> 
            @endauth
        </div>
        <nav class="humberger__menu__nav mobile-menu">
            <ul>
                <li class="active"><a href="./index.html">Home</a></li>
                <li><a href="{{URL::to('/cua-hang')}}">Cửa hàng</a></li>
                <li><a href="{{URL::to('/dau-gia')}}">Đấu giá</a>
                    <ul class="header__menu__dropdown">
                        <li><a href="{{URL::to('/loai-dau-gia')}}">Đang diễn ra</a></li>
                        <li><a href="{{URL::to('/loai-dau-gia')}}">Đã diễn ra</a></li>
                        <li><a href="{{URL::to('/loai-dau-gia')}}">Chuẩn bị diễn ra</a></li>    
                    </ul>
                </li>
                <li><a href="{{URL::to('/blog')}}">Blog</a>
                    <ul class="header__menu__dropdown">
                        @foreach($category as $value)
                        <li><a href="{{URL::to('/danh-muc-bai-viet/'.$value->slug)}}">{{$value->title}}</a></li>
                        @endforeach  
                    </ul>
                </li>
                <li><a href="{{URL::to('/lien-he')}}">Liên hệ</a></li>
            </ul>
        </nav>
        <div id="mobile-menu-wrap"></div>
        <div class="humberger__menu__contact">
            <ul>
                <li><i class="fa fa-envelope"></i> hello@colorlib.com</li>
                <li><i class="fa fa-phone"></i> 0342909557</li>
            </ul>
        </div>
    </div>
    <!-- Humberger End -->

    <!-- Header Section Begin -->
    <header class="header">
        <div class="header__top">
            <div class="container">
                <div class="row">
                    <div class="col-lg-6 col-md-6">
                        <div class="header__top__left">
                            <ul>
                                <li><i class="fa fa-envelope"></i> hello@colorlib.com</li>
                                <li><i class="fa fa-phone"></i> 0342909557</li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-lg-6 col-md-6">
                        <div class="header__top__right">
                            @guest
                            <div class="header__top__right__auth header__top__register">
                                <a href="{{URL::to('/dang-nhap')}}"><i class="fa fa-user"></i>Đăng nhập</a>
                            </div>
                            <div class="header__top__right__auth">
                                <a href="{{URL::to('/lien-he')}}"><i class="fa fa-user-plus"></i>Đăng ký đại lý</a>
                            </div>
                            @endguest
                            @auth
                            <div class="header__top__right__auth_login">
                                <span class="dropdow_custom" data-toggle=".dropdown_custom">
                                    Xin chào, {{Auth::user()->name}}
                                </span>
                                <div class="dropdown_custom" style="display:none;">
                                    <a class="dropdown-item" href="#"><i class="fa fa-list-alt"></i> Đơn hàng</a>
                                    <a class="dropdown-item" href="#"><i class="fa fa-hourglass-half"></i> Đấu giá</a>
                                    <a class="dropdown-item" href="#"><i class="fa fa-heart-o"></i> Yêu thích</a>
                                    <div class="dropdown-divider"></div>
                                    <a class="dropdown-item" href="{{URL::to('/thoat-tai-khoan')}}"><i class="fa fa-sign-out"></i> Thoát tài khoản</a>
                                </div>     
                            </div> 
                            @endauth
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="container">
            <div class="row align-item-center">
                <div class="col-lg-3">
                    <div class="header__logo">
                        <a href="{{URL::to('/')}}"><img src="{{asset('public/mevivu/img/logo.png')}}" alt=""></a>
                    </div>
                </div>
                <div class="col-lg-9 d-none d-md-block">
                    <div class="header__cart">
                        <ul>
                            <li class="search_all">
                                <div class="seach_form" style="display:none;">
                                    <div class="input-group">
                                        <input type="text" class="form-control" placeholder="Search">
                                        <div class="input-group-append">
                                            <button class="btn btn-ocean" type="submit">Tìm kiếm</button>
                                        </div>
                                    </div>
                                </div>
                                <a href="#" class="search_icon"><i class="fa fa-search"></i></a>
                            </li>
                            <li><a href="#"><i class="fa fa-heart"></i> <span>1</span></a></li>
                            <li><a href="#"><i class="fa fa-shopping-bag"></i> <span>3</span></a></li>
                        </ul>
                        <div class="header__cart__price"><span>150.000 đ</span></div>
                    </div>
                </div>
            </div>
            <div class="humberger__open">
                <i class="fa fa-bars"></i>
            </div>
        </div>
    </header>
    <!-- Header Section End -->

    <!-- Hero Section Begin -->
    <section class="hero">
        <div class="container">
            <div class="row">
                <div class="col-lg-3">
                    <div class="hero__categories">
                        <div class="hero__categories__all">
                            <i class="fa fa-bars"></i>
                            <span>CÁC DÒNG CÁ KOI</span>
                        </div>
                        <ul style="display: none;">
                            <li><a href="#">Fresh Meat</a></li>
                            <li><a href="#">Vegetables</a></li>
                            <li><a href="#">Fruit & Nut Gifts</a></li>
                            <li><a href="#">Fresh Berries</a></li>
                            <li><a href="#">Ocean Foods</a></li>
                            <li><a href="#">Butter & Eggs</a></li>
                            <li><a href="#">Fastfood</a></li>
                            <li><a href="#">Fresh Onion</a></li>
                            <li><a href="#">Papayaya & Crisps</a></li>
                            <li><a href="#">Oatmeal</a></li>
                            <li><a href="#">Fresh Bananas</a></li>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-9">
                	<nav class="header__menu">
                        <ul>
                            <li class="active"><a href="./index.html"><i class="fa fa-home" aria-hidden="true"></i></a></li>
                            <li><a href="{{URL::to('/cua-hang')}}">Giới thiệu</a></li>
                            <li><a href="{{URL::to('/cua-hang')}}">Danh sách đại lý</a></li>
                            <li><a href="{{URL::to('/cua-hang')}}">Sản phẩm</a>
                            <ul class="header__menu__dropdown">
                                    <li><a href="{{URL::to('/loai-dau-gia')}}">Koi</a></li>
                                    <li><a href="{{URL::to('/loai-dau-gia')}}">Cám cá</a></li>
                                    <li><a href="{{URL::to('/loai-dau-gia')}}">Vật liệu</a></li>    
                                </ul>
                            </li>
                            <li><a href="{{URL::to('/dau-gia')}}">Đấu giá</a>
                                <ul class="header__menu__dropdown">
                                    <li><a href="{{URL::to('/loai-dau-gia')}}">Đang diễn ra</a></li>
                                    <li><a href="{{URL::to('/loai-dau-gia')}}">Đã diễn ra</a></li>
                                    <li><a href="{{URL::to('/loai-dau-gia')}}">Chuẩn bị diễn ra</a></li>    
                                </ul>
                            </li>
                            <li><a href="{{URL::to('/blog')}}">Blog</a>
                                <ul class="header__menu__dropdown">
                                    @foreach($category as $value)
                                    <li><a href="{{URL::to('/danh-muc-bai-viet/'.$value->slug)}}">{{$value->title}}</a></li>
                                    @endforeach  
                                </ul>
                            </li>
                            
                            <li><a href="{{URL::to('/lien-he')}}">Liên hệ</a></li>
                        </ul>
                    </nav>
                    
                </div>
            </div>
        </div>
    </section>
    <!-- Hero Section End -->

    @yield('content')

    <!-- Footer Section Begin -->
    <footer class="footer spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-3 col-md-6 col-sm-6">
                    <div class="footer__about">
                        <div class="footer__about__logo">
                            <a href="{{URL::to('/')}}"><img src="{{asset('public/mevivu/img/logo.png')}}" alt=""></a>
                        </div>
                        <ul>
                            <li>Address: 60-49 Road 11378 New York</li>
                            <li>Phone: +65 11.188.888</li>
                            <li>Email: hello@colorlib.com</li>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6 col-sm-6 offset-lg-1">
                    <div class="footer__widget">
                        <h6>Useful Links</h6>
                        <ul>
                            <li><a href="#">About Us</a></li>
                            <li><a href="#">About Our Shop</a></li>
                            <li><a href="#">Secure Shopping</a></li>
                            <li><a href="#">Delivery infomation</a></li>
                            <li><a href="#">Privacy Policy</a></li>
                            <li><a href="#">Our Sitemap</a></li>
                        </ul>
                        <ul>
                            <li><a href="#">Who We Are</a></li>
                            <li><a href="#">Our Services</a></li>
                            <li><a href="#">Projects</a></li>
                            <li><a href="#">Contact</a></li>
                            <li><a href="#">Innovation</a></li>
                            <li><a href="#">Testimonials</a></li>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-4 col-md-12">
                    <div class="footer__widget">
                        <h6>Join Our Newsletter Now</h6>
                        <p>Get E-mail updates about our latest shop and special offers.</p>
                        <form action="#">
                            <input type="text" placeholder="Enter your mail">
                            <button type="submit" class="site-btn">Subscribe</button>
                        </form>
                        <div class="footer__widget__social">
                            <a href="#"><i class="fa fa-facebook"></i></a>
                            <a href="#"><i class="fa fa-instagram"></i></a>
                            <a href="#"><i class="fa fa-twitter"></i></a>
                            <a href="#"><i class="fa fa-pinterest"></i></a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12">
                    <div class="footer__copyright">
                        <div class="footer__copyright__text"><p><!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
  Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="fa fa-heart" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>
  <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. --></p></div>
                    </div>
                </div>
            </div>
        </div>
    </footer>
    <!-- Footer Section End -->

    <!-- Js Plugins -->
    <script src="{{asset('public/mevivu/js/jquery-3.3.1.min.js')}}"></script>
    <script src="{{asset('public/mevivu/js/bootstrap.min.js')}}"></script>
    <!-- <script src="{{asset('public/mevivu/js/popper.min.js')}}"></script> -->
    <script src="{{asset('public/mevivu/js/jquery.nice-select.min.js')}}"></script>
    <script src="{{asset('public/mevivu/js/jquery-ui.min.js')}}"></script>
    <script src="{{asset('public/mevivu/js/jquery.slicknav.js')}}"></script>
    <script src="{{asset('public/mevivu/js/mixitup.min.js')}}"></script>
    <script src="{{asset('public/mevivu/js/owl.carousel.min.js')}}"></script>
    <script src="{{asset('public/mevivu/js/main.js')}}"></script>
    <script src="{{asset('public/mevivu/js/jquery.countdown.min.js')}}"></script>

</body>

</html>