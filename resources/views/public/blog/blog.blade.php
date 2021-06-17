@extends('public.layout')
@section('content')


   <!-- Breadcrumb Section Begin -->
    <x-breadcrumb title="{{$title}}"/>

    <!-- Blog Section Begin -->
    <section class="blog spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-4 col-md-5">
                    <x-sidebarblog />
                </div>
                <div class="col-lg-8 col-md-7">
                    <div class="row">
                        @foreach($posts as $value)
                        <div class="col-lg-6 col-md-6 col-sm-6">
                            <div class="blog__item">
                                <div class="blog__item__pic">
                                    <img src="{{asset($value->avatar)}}" alt="">
                                </div>
                                <div class="blog__item__text">
                                    <ul>
                                        <li><i class="fa fa-calendar-o"></i> {{date("d/m/Y",strtotime($value->created_at))}}</li>
                                    </ul>
                                    <h5><a href="{{URL::to('/bai-viet/'.$value->slug)}}">{{$value->title}}</a></h5>
                                    <p>{{Str::of($value->desc_short)->limit(80, '...')}}</p>
                                    <a href="{{URL::to('/bai-viet/'.$value->slug)}}" class="blog__btn">READ MORE <span class="arrow_right"></span></a>
                                </div>
                            </div>
                        </div>
                        @endforeach
                        <div class="col-lg-12">
                            <div class="product__pagination blog__pagination">
                                {!! $posts->links('pagination.paginator') !!}
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Blog Section End -->



@endsection