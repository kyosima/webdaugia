@extends('public.layout')
@section('content')


   <!-- Breadcrumb Section Begin -->
<section class="breadcrumb-section">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="breadcrumb__text">
                    <div class="breadcrumb__option">
                        <a href="{{URL::to('/')}}">Trang chủ</a>
                        <span>Danh sách đại lý</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

    <!-- Blog Section Begin -->
    <section class="blog spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-4 col-md-5 d-none d-md-block">
                    <x-sidebarblog />

                </div>
                <div class="col-lg-8 col-md-7">
                    <div class="row">
                        @foreach($agent as $value)
                            <div class="col-12">
                                <div class="featured__item">
                                    <div class="featured__item__text">
                                        <h4 class="mb-1">{{ $value->fullname }}</h4>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <h6>
                                                    <i class="fa fa-envelope" aria-hidden="true"></i> 
                                                    {{ $value->email }}
                                                </h6>
                                            </div>
                                            <div class="col-md-6">
                                                <h6>
                                                    <i class="fa fa-phone" aria-hidden="true"></i> 
                                                    {{ $value->phone }}
                                                </h6>
                                            </div>
                                        </div>
                                        <h6>
                                        <i class="fa fa-map-marker" aria-hidden="true"></i>
                                            {{ $value->address }}
                                        </h6>
                                        
                                    </div>
                                </div>
                            </div>
                        @endforeach
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Blog Section End -->



@endsection