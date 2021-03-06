<script language="JavaScript" type="text/javascript">
<!--
	var error_msg = "";
	function checkAddForm()
	{
		error_msg = "";

		if(document.form.cat_name.value == "")
		{
			error_msg += "{L_CAT_NAME_FIELD_EMPTY}";
		}

		if(error_msg != "")
		{
			alert(error_msg);
			error_msg = "";
			return false;
		}
		else
		{
			return true;
		}
	}
// -->
</script>



<h1>{L_CAT_TITLE}</h1>

<p>{L_CAT_EXPLAIN}</p>

<!-- BEGIN pafiledb_error -->
<table width="100%" cellpadding="3" cellspacing="1" class="forumline">
  <tr>
	<td class="row2" align="center">{ERROR}</td>
  </tr>
</table>
<br />
<!-- END pafiledb_error -->

<form action="{S_CAT_ACTION}" method="post" name="form" onsubmit="return checkAddForm();">
<table width="100%" cellpadding="3" cellspacing="1" class="forumline">
  <tr>
	<th colspan="2" class="thHead">{L_CAT_TITLE}</th>
  </tr>
  <tr>
	<td width="50%" class="row1">{L_CAT_NAME}<br><span class="gensmall">{L_CAT_NAME_INFO}</span></td>
	<td class="row2"><input type="text" class="post" size="50" name="cat_name" value="{CAT_NAME}"></td>
  </tr>
  <tr>
	<td class="row1">{L_CAT_DESC}<br><span class="gensmall">{L_CAT_DESC_INFO}</span></td>
	<td class="row2"><input type="text" class="post" size="50" name="cat_desc" value="{CAT_DESC}"></td>
  </tr>
  <tr>
	<td class="row1">{L_CAT_PARENT}<br><span class="gensmall">{L_CAT_PARENT_INFO}</span></td>
	<td class="row2"><select name="cat_parent" class="forminput">{S_CAT_LIST}</select></td>
  </tr>
  <tr>
	<td class="row1">{L_CAT_ALLOWFILE}<br><span class="gensmall">{L_CAT_ALLOWFILE_INFO}</span></td>
	<td class="row2">
	<input type="radio" name="cat_allow_file" value="1" {CHECKED_YES}>{L_YES}&nbsp;
	<input type="radio" name="cat_allow_file" value="0" {CHECKED_NO}>{L_NO}&nbsp;
	</td>
  </tr>
	<tr>
		<!-- TITLE ------------------------------------------------------------------------------------------- -->
	  	<th class="thHead" colspan="2">&nbsp;{L_COMMENTS_TITLE}</th>
	</tr>
	<tr>
		<td class="row1" width="50%">{L_USE_COMMENTS}<br /><span class="gensmall">{L_USE_COMMENTS_EXPLAIN}</span></td>
		<td class="row2" width="50%"><input type="radio" name="cat_allow_comments" value="-1" {S_USE_COMMENTS_DEFAULT} /> {L_DEFAULT}&nbsp;&nbsp;<input type="radio" name="cat_allow_comments" value="1" {S_USE_COMMENTS_YES} /> {L_YES}&nbsp;&nbsp;<input type="radio" name="cat_allow_comments" value="0" {S_USE_COMMENTS_NO} /> {L_NO}</td>
	</tr>
	<tr>
		<td class="row1" width="50%">{L_INTERNAL_COMMENTS}<br /><span class="gensmall">{L_INTERNAL_COMMENTS_EXPLAIN}</span></td>
		<td class="row2" width="50%"><input type="radio" name="internal_comments" value="-1" {S_INTERNAL_COMMENTS_DEFAULT} /> {L_DEFAULT}&nbsp;&nbsp;<input type="radio" name="internal_comments" value="1" {S_INTERNAL_COMMENTS_INTERNAL} /> {L_INTERNAL_COMMENTS_INTERNAL}&nbsp;&nbsp;<input type="radio" name="internal_comments" value="0" {S_INTERNAL_COMMENTS_PHPBB} /> {L_INTERNAL_COMMENTS_PHPBB}</td>
	</tr>
    <tr>
		<td class="row1" width="50%">{L_FORUM_ID}<br /><span class="gensmall">{L_FORUM_ID_EXPLAIN}</span></td>
		<td class="row2" width="50%">{FORUM_LIST}</td>
	</tr>
	<tr>
        <td class="row1" width="50%">{L_AUTOGENERATE_COMMENTS}<br /><span class="gensmall">{L_AUTOGENERATE_COMMENTS_EXPLAIN}</span></td>
        <td class="row2" width="50%"><input type="radio" name="autogenerate_comments" value="-1" {S_AUTOGENERATE_COMMENTS_DEFAULT} /> {L_DEFAULT}&nbsp;&nbsp;<input type="radio" name="autogenerate_comments" value="1" {S_AUTOGENERATE_COMMENTS_YES} /> {L_YES}&nbsp;&nbsp;<input type="radio" name="autogenerate_comments" value="0" {S_AUTOGENERATE_COMMENTS_NO} /> {L_NO}</td>
    </tr>
	<tr>
		<!-- TITLE ------------------------------------------------------------------------------------------- -->
	  	<th class="thHead" colspan="2">&nbsp;{L_RATINGS_TITLE}</th>
	</tr>
	<tr>
		<td class="row1" width="50%">{L_USE_RATINGS}<br /><span class="gensmall">{L_USE_RATINGS_EXPLAIN}</span></td>
		<td class="row2" width="50%"><input type="radio" name="cat_allow_ratings" value="-1" {S_USE_RATINGS_DEFAULT} /> {L_DEFAULT}&nbsp;&nbsp;<input type="radio" name="cat_allow_ratings" value="1" {S_USE_RATINGS_YES} /> {L_YES}&nbsp;&nbsp;<input type="radio" name="cat_allow_ratings" value="0" {S_USE_RATINGS_NO} /> {L_NO}</td>
	</tr>
	<tr>
		<!-- TITLE ------------------------------------------------------------------------------------------- -->
	  	<th class="thHead" colspan="2">&nbsp;{L_INSTRUCTIONS_TITLE}</th>
	</tr>
	<tr>
		<td class="row1" width="50%">{L_PRE_TEXT_NAME}<br /><span class="gensmall">{L_PRE_TEXT_EXPLAIN}</span></td>
		<td class="row2" width="50%"><input type="radio" name="show_pretext" value="-1" {S_DEFAULT_PRETEXT} /> {L_DEFAULT}&nbsp;&nbsp;<input type="radio" name="show_pretext" value="1" {S_SHOW_PRETEXT} /> {L_SHOW}&nbsp;&nbsp;<input type="radio" name="show_pretext" value="0" {S_HIDE_PRETEXT} /> {L_HIDE}</td>
	</tr>
	<tr>
		<!-- TITLE ------------------------------------------------------------------------------------------- -->
	  	<th class="thHead" colspan="2">&nbsp;{L_NOTIFICATIONS_TITLE}</th>
	</tr>
	<tr>
		<td class="row1" width="50%">{L_NOTIFY}<br /><span class="gensmall">{L_NOTIFY_EXPLAIN}</span></td>
		<td class="row2" width="50%"><input type="radio" name="notify" value="-1" {S_NOTIFY_DEFAULT} />{L_DEFAULT}&nbsp;&nbsp;<input type="radio" name="notify" value="0" {S_NOTIFY_NONE} />{L_NONE}&nbsp;&nbsp;<input type="radio" name="notify" value="2" {S_NOTIFY_EMAIL} />{L_EMAIL}&nbsp; &nbsp;<input type="radio" name="notify" value="1" {S_NOTIFY_PM} />{L_PM}</td>
	</tr>
	<tr>
		<td class="row1" width="50%">{L_NOTIFY_GROUP}<br /><span class="gensmall">{L_NOTIFY_GROUP_EXPLAIN}</span></td>
		<td class="row2" width="50%">{NOTIFY_GROUP}</td>
	</tr>
  <tr>
	<td align="center" class="cat" colspan="2">
	{S_HIDDEN_FIELDS}
	<input class="liteoption" type="submit" value="{L_CAT_TITLE}" name="submit">
  </tr>
</table>
</form>
