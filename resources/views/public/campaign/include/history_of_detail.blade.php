<table id="auction-history" class="table table- table-bordered ">
    <tbody>
        @foreach($auctions as $item)
            <tr>
                <td>{{date('Y-m-d H:i:s', strtotime($item->created_at))}}</td>
                <td>{{$item->user()->value('name')}}</td>
                <td>{{getCurrency($item->price)}}</td>
                <td class="text-center">
                    @if($item->type ==1)
                    -
                    @else
                        auto
                    @endif
                </td>
            </tr>
        @endforeach
    </tbody>
</table>