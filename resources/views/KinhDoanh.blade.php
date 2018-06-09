
@permission('kinhdoanh')

<h1>Hello anh kinh doanh</h1>
@endpermission
@if ($message = Session::get('success'))
		<div class="alert alert-success">
			<p>{{ $message }}</p>
		</div>
	@endif