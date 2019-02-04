<div id="el_[@id]" class="container news_el">
	<div class="row">
		<div class="col-sm-1">
			<div class="btn-group-vertical btn-group-sm" role="group2" aria-label="">
				<button type="button" data-aid="[@id]" data-val="up" class="news_move_button btn btn-light"><i class="fas fa-arrow-up"></i></button>
				<button type="button" data-aid="[@id]" data-val="down" class="news_move_button btn btn-light"><i class="fas fa-arrow-down"></i></button>
			</div>
		</div>
		<div class="col-sm-4">
			<span class="">[@datum], [@name]</span><br /><span class="badge badge-info">[@ktitle]</span>
		</div>
		<div class="col-sm-5">
			<h5 id="atitle_[@id]">[@title]</h5>
		</div>
		<div class="col-sm-2">
			<div class="btn-group-vertical btn-group-sm float-right" role="group1" aria-label="">
				<button type="button" data-toggle="modal" data-target="#edit_modal" data-aid="[@id]" data-kid="[@kid]" class="btn btn-light"> <i class="far fa-edit"></i>&nbsp;&nbsp;Editieren</button>
				<button type="button" data-toggle="modal" data-target="#del_modal" data-aid="[@id]" class="btn btn-light"><i class="fas fa-trash"></i>&nbsp;&nbsp;&nbsp;Löschen</button>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-sm-1"></div>
		<div class="col-sm-11">
			<div class="collapse pcollapse ws" id="atext_[@id]"><p></p>[@cont]</div>
		</div>
	</div>
	<hr />
</div>
