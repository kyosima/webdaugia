@php
use App\Models\Posts;
$posts_new = Posts::orderBy('id', 'DESC')->take(5)->get();
@endphp
<div class="blog__sidebar">
    <div class="blog__sidebar__search">
        <form action="#">
            <input type="text" placeholder="Search...">
            <button type="submit"><span class="icon_search"></span></button>
        </form>
    </div>
    
    <div class="blog__sidebar__item">
        <h4>Bài viết mới</h4>
        <div class="blog__sidebar__recent">
            @foreach($posts_new as $value)
            <a href="{{URL::to('bai-viet/'.$value->slug)}}" class="blog__sidebar__recent__item">
                <div class="blog__sidebar__recent__item__pic blog-img-small">
                    <img src="{{asset($value->avatar)}}" alt="">
                </div>
                <div class="blog__sidebar__recent__item__text">
                    <h6>{{$value->title}}</h6>
                    <span>{{date("d/m/Y",strtotime($value->created_at))}}</span>
                </div>
            </a>
            @endforeach
        </div>
    </div>
    
</div>