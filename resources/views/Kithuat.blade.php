
@permission('kithuat')

<h1>Hello anh ki thuat</h1>
@endpermission
@if ($message = Session::get('success'))
		<div class="alert alert-success">
			<p>{{ $message }}</p>
		</div>
	@endif