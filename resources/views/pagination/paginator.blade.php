@if ($paginator->hasPages())
    @if ($paginator->onFirstPage())
        <a href="Javascrip:void();" class="disabled"><i class="fa fa-long-arrow-left"></i></a>
    @else
        <a href="{{ $paginator->previousPageUrl() }}" rel="prev"><i class="fa fa-long-arrow-left"></i></a>
    @endif


    
    @foreach ($elements as $element)
        
        @if (is_string($element))
            <a class="disabled" href="Javascrip:void();">{{ $element }}</a>
        @endif


        
        @if (is_array($element))
            @foreach ($element as $page => $url)
                @if ($page == $paginator->currentPage())
                    <a href="Javascrip:void();" class="active my-active">{{ $page }}</a>
                @else
                    <a href="{{ $url }}">{{ $page }}</a>
                @endif
            @endforeach
        @endif
    @endforeach


    
    @if ($paginator->hasMorePages())
        <a href="{{ $paginator->nextPageUrl() }}" rel="next"><i class="fa fa-long-arrow-right"></i></a>
    @else
        <a href="Javascrip:void();" class="disabled"><i class="fa fa-long-arrow-right"></i></a>
    @endif
@endif 