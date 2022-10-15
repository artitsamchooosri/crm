<br>
<h5 class="">Tickets</h5>
<hr>
<style>
	.ticket-user {
		height: 100px;
		width: 100px;
		object-fit: cover;
		border-radius: 50%;
		border: 1px solid;
	}

	.list-wrapper {
		width: 90%;
		max-width: 400px;
		margin: 30px auto;
	}


	/* List component */
	.list {
		background-color: #FFF;
		list-style: none;
		margin: 0;
		padding: 15px;
		border-radius: 2px;
		box-shadow: 0 2px 6px rgba(0, 0, 0, 0.15);
	}

	.list .list-item {
		display: flex;
		padding: 10px 5px;
	}

	.list .list-item:not(:last-child) {
		border-bottom: 1px solid #EEE;
	}

	/*list item image wrapper*/
	.list .list-item__image {
		flex-shrink: 0;
		height: 80px;
	}

	.list .list-item__image img {
		border-radius: 50%;
		width: 80px;
		height: 80px;
	}

	/*list item content*/
	.list .list-item__content {
		flex-grow: 1;
		padding: 0 20px;
	}

	.list .list-item__content h4 {
		margin: 0;
		font-size: 18px;
		margin-top: 15px;
	}

	.list .list-item__content p {
		margin-top: 5px;
		color: #AAA;
		margin-bottom: 0;
	}
</style>
<div class="row">
	<div class="container-fluid">
		<div class="card card-outline card-primary">
			<div class="card-header">
				<h5 class="card-title">List of Tickets</h5>
				<div class="card-tools">
					<a class="btn btn-flat btn-primary btn-sm" type="button" href="<?php echo base_url ?>admin/?page=ticket&view=create_ticket"><span class="fa fa-plus"></span> New Ticket</a>
				</div>
			</div>
			<div class="card-body">
				<div class="container-fluid">
					<form id="search_keyword">
						<div class="input-group">
							<input type="search" id="keyword" class="form-control form-control-sm" value="<?php echo isset($_GET['keyword']) ? $_GET['keyword'] : '' ?>" placeholder="Type your keywords here">
							<div class="input-group-append">
								<button class="btn btn-success" type="submit">Search</button>
							</div>
						</div>
					</form>
					<div class="paginate" id="paginate-list">
						<ul id="ticket-list list"></ul>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<div id="ticket_clone" class="d-none">
	<li class="list-item">
		<div class="list-item list-item__image">
			<img src="images/image.png" alt="Image">
		</div>
		<div class="list-item list-item__content">
			<h4> Name Surname </h4>
			<p> Info </p>
		</div>
	</li>
</div>
<div id="ticket_clones" class="d-none">
	<li>
		<div class="callout ticket-item callout-info m-2">
			<table width="100%">
				<colgroup>
					<col width="15%">
					<col width="70%">
					<col width="15%">
				</colgroup>
				<tr>
					<td width="15%">
						<img class="image-thubnail ticket-user border-info" src="<?php echo validate_image($_settings->info('logo')) ?>" alt="">
					</td>
					<td width="70%">
						<h4 class="ticket-title search"></h4>
						<small class="ticket-service search"></small>
						<hr>
						<p class='truncate ticket-description'></p>
						<hr>
						<span><i>Status</i>:</span> <span class="badge ticket-status"></span>
						<span class="float-right"><span><i>Date Created</i>:</span> <span class="badge badge-light ticket-created"></span></span>
					</td>
					<td class="text-center" width="15%">
						<div class="btn-group">
							<button type="button" class="btn btn-default dropdown-toggle dropdown-icon" data-toggle="dropdown" aria-expanded="false">
								Action &nbsp;
								<span class="sr-only">Toggle Dropdown</span>
							</button>
							<div class="dropdown-menu" role="menu" style="">
								<a class="dropdown-item text-primary view_data" data-id="" href="javascript:void(0)"><span class="fa fa-eye"></span> View</a>
								<div class="dropdown-divider"></div>
								<a class="dropdown-item text-primary edit_data" data-id="" href="javascript:void(0)"><span class="fa fa-edit"></span> Edit</a>
								<div class="dropdown-divider"></div>
								<a class="dropdown-item text-danger delete_data" data-id="" href="javascript:void(0)"><span class="fa fa-trash text-fanger"></span> Delete</a>
							</div>
						</div>
					</td>
				</tr>
			</table>
		</div>
	</li>
</div>

<script>
	function load_data($search = '<?php echo isset($_GET['keyword']) ? $_GET['keyword'] : '' ?>') {
		start_loader();
		$('#paginate-list').html('<ul id="ticket-list"></ul>')
		$.ajax({
			url: _base_url_ + "classes/Master.php?f=load_tickets",
			method: 'POST',
			data: {
				search: $search
			},
			dataType: "json",
			error: err => {
				console.log(err)
				alert_toast("An error occured", 'error');
				end_loader();
			},
			success: function(resp) {
				// resp = JSON.parse(resp)
				if (!!resp.status) {
					if (resp.data.length > 0) {
						let data = (resp.data);
						var i = 1;
						Object.keys(data).map((k) => {
							let item = $("#ticket_clone").clone();
							if (!!data[k].user_avatar)
								item.find('.ticket-user').attr('src', data[k].user_avatar);
							if (!!data[k].title)
								item.find('.ticket-title').html(data[k].title);
							if (!!data[k].service)
								item.find('.ticket-service').html(data[k].service);
							if (!!data[k].description)
								item.find('.ticket-description').html(data[k].description);
							if (!!data[k].status)
								item.find('.ticket-status').html(data[k].status);
							if (!!data[k].status_badge)
								item.find('.ticket-status').addClass(data[k].status_badge);
							if (!!data[k].date_created)
								item.find('.ticket-created').addClass(data[k].date_created);
							if (!!data[k].id)
								item.find('.edit_data, .delete_data, .view_data').attr('data-id', data[k].id);
							item.attr('data-id', data[k].id);
							$('#ticket-list').append(item.html())
						})
					} else {
						$('#ticket-list').html('')
					}
					end_loader();
				} else {
					alert_toast("An error occured", 'error');
					end_loader();
				}
			},
			complete: function() {
				data_func()

				$("#ticket-list").JPaging({
					pageSize: 10,
					visiblePageSize: 7
				});
				end_loader();
			}
		})
	}

	function data_func() {
		$('.edit_data').click(function() {
			location.href = _base_url_ + 'admin/?page=ticket&view=edit&id=' + $(this).attr('data-id')
		})
		$('.view_data').click(function() {
			location.href = _base_url_ + 'admin/?page=ticket&view=view_ticket&id=' + $(this).attr('data-id')
		})
		$('.delete_data').click(function() {
			_conf('Are you sure to delete this data?', 'delete_data', [$(this).attr('data-id')]);
		})
		$('#search_keyword').submit(function(e) {
			e.preventDefault()
			var find = $('#keyword').val();
			var loc = location.href;
			location.href = loc + '&keyword=' + find;
		})
		$('#keyword').on('search', function() {
			var find = $('#keyword').val();
			var loc = location.href;
			location.href = loc + '&keyword=' + find;
		})
	}

	function delete_data($id) {
		start_loader();
		$.ajax({
			url: _base_url_ + "classes/Master.php?f=delete_ticket",
			method: 'POST',
			data: {
				id: $id
			},
			dataType: 'json',
			error: err => {
				console.log(err);
				alert_toast("An error occured", "error");
				end_loader();
			},
			success: function(resp) {
				if (!!resp.status && resp.status == 'success') {
					alert_toast(" Data successfully deleted.", "success");
					$('.modal').modal('hide');
					end_loader();
					load_data()
				}
			}
		})
	}
	$(document).ready(function() {
		load_data()
		$('#new_data').click(function() {
			uni_modal('<span class="fa fa-plus"></span> Create New Service Category', _base_url_ + 'admin/services/manage_category.php')
		})

	})
</script>