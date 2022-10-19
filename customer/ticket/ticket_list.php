<br>
<h5 class="">Search Problem</h5>
<hr>
<style>
	.ticket-user {
		max-height: 50px;
		max-width: 50px;
		object-fit: cover;
		border-radius: 50%;
		border: 1px solid;
	}

	.card-body {
		padding: 5px;
		margin: 0px;
	}

	.ticket-list {
		padding: 5px;
		margin: 0px;
	}

	.paginate ul {
		padding: 5px;
		margin: 0px;
	}

	/* List component */
	.list {
		width: 100%;

		list-style: none;
		margin: 0px;
		padding: 0px;
		border-radius: 0px;
	}

	.list .list-item {
		display: flex;
		flex-flow: row wrap;

		padding: 5px;
		margin: 10px;
		border-radius: 20px;
	}

	.list .list-item:not(:last-child) {
		border-bottom: 1px solid #EEE;
	}

	/*list item image wrapper*/
	.list .list-item__image {
		flex: 1 1 initial;
		align-items: flex-start;
		height: 80px;
		width: 80px;
	}

	.list .list-item__image img {
		border-radius: 50%;
		width: 80px;
		height: 80px;
	}

	/*list item content*/
	.list .list-item__content {
		flex: 1 1 auto;
		align-items: flex-start;
		flex-grow: 1;
		flex-flow: column;
		padding: 5px;
		max-width: 600px;
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

	.list .list-item__content span {

		max-width: 200px;
		margin-right: auto;
	}

	.list .list-item__action {
		flex: 1 1 auto;
		align-items: flex-end;
		justify-content: flex-end;
		max-height: 40px;

	}

	@media only screen and (max-width: 600px) {
		.list .list-item__image {
			height: 0px;
			width: 0px;
		}

		.list .list-item__image img {
			width: 0px;
			height: 0px;
		}
	}
</style>
<div class="row">
	<div class="container-fluid">
		<div class="card card-outline card-primary">
			<div class="card-header">
				<h5 class="card-title">List of Problem</h5>
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
					<div class="paginate list" id="paginate-list">
						<ul id="ticket-list"></ul>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<div id="ticket_clone" class="d-none">
	<li class="list-item">
		<div class="list-item list-item__image">
			<img class="image-thubnail ticket-user border-info" src="<?php echo validate_image($_settings->info('logo')) ?>" alt="">
		</div>
		<div class="list-item list-item__content">
			<h4 class="ticket-title search"></h4>
			<small class="ticket-service search"></small>
			<hr>
			<p class='truncate ticket-description'></p>
			<hr>
			<span class="float-right"><span><i>Section</i>:</span> <span class="badge section-status"></span></span>
			<span class="float-right"><span><i>Category</i>:</span> <span class="badge category-status"></span></span>
			<span class="float-right"><span><i>Date Created</i>:</span> <span class="badge badge-light ticket-created"></span></span>
		</div>
		<div class="list-item list-item__action">
			<div class="btn-group">
				<button type="button" class="btn btn-info dropdown-toggle dropdown-icon" data-toggle="dropdown">
					Action

				</button>
				<div class="dropdown-menu" role="menu" style="">
					<a class="dropdown-item text-primary view_data" data-id="" href="javascript:void(0)"><span class="fa fa-eye"></span> View</a>
				</div>
			</div>
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
							if (!!data[k].section)
								item.find('.section-status').html(data[k].section);
							if (!!data[k].section_badge)
								item.find('.section-status').addClass(data[k].section_badge);
							if (!!data[k].category)
								item.find('.category-status').html(data[k].category);
							if (!!data[k].category_badge)
								item.find('.category-status').addClass(data[k].category_badge);
							if (!!data[k].date_created)
								item.find('.ticket-created').html(data[k].date_created);
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
		$('.view_data').click(function() {
			location.href = _base_url_ + 'customer/?page=ticket&view=view_ticket&id=' + $(this).attr('data-id')
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
	$(document).ready(function() {
		load_data()
		$('#new_data').click(function() {
			uni_modal('<span class="fa fa-plus"></span> Create New Service Category', _base_url_ + 'admin/services/manage_category.php')
		})

	})
</script>