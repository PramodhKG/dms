<script type="text/javascript" src="functions.js"></script>

<!-- file upload formu using ENCTYPE -->
<form id="addeditform" name="main" class="display dataTable" action="{$smarty.server.PHP_SELF}" method="POST" enctype="multipart/form-data" onsubmit="return checksec(); ">
    <input type="hidden" id="db_prefix" value="{$db_prefix}" />
<table border="0" cellspacing="5" cellpadding="5">
{assign var='i' value='0'}    
{foreach from=$t_name item=name name='loop1'}
    <input type="hidden" id="secondary{$i}" name="secondary{$i}" value="" /> <!-- CHM hidden and onsubmit added-->
    <input type="hidden" id="tablename{$i}" name="tablename{$i}" value="{$name}" /> <!-- CHM hidden and onsubmit added-->
    {assign var='i' value=$i+1}
{/foreach}
    <input type="hidden" id="id" name="id" value="{$file_id}" />
    <input id="i_value" type="hidden" name="i_value" value="{$i}" /> <!-- CHM hidden and onsubmit added-->
    <tr>
		<td>{$g_lang_label_name}</td>
		<td colspan="3"><b>{$realname}</b></td>
    </tr>
    
{if $is_admin == true }
    <tr>

        <td>
            {$g_lang_editpage_assign_owner}
        </td>
        <td>
            <select name="file_owner">
            {foreach from=$avail_users item=user}
                <option value="{$user.id}" {if $pre_selected_owner eq $user.id}selected='selected'{/if}>{$user.last_name}, {$user.first_name}</option>
            {/foreach}
            </select>
        </td>
    </tr>
    <tr>
        <td>
            {$g_lang_editpage_assign_department}
        </td>
        <td>
               
            <select name="file_department">
            {foreach from=$avail_depts item=dept}
                <option value="{$dept.id}" {if $pre_selected_department eq $dept.id}selected='selected'{/if}>{$dept.name}</option>
            {/foreach}
            </select>
        </td>
    </tr>
{/if}    
    <tr>
        <td>
            <a class="body" href="help.html#Add_File_-_Category"  onClick="return popup(this, 'Help')" style="text-decoration:none">{$g_lang_category}</a>
        </td>
        <td colspan=3>
            <select tabindex=2 name="category" >
            {foreach from=$cats_array item=cat}
                <option value="{$cat.id}" {if $pre_selected_category eq $cat.id}selected='selected'{/if}>{$cat.name}</option>
            {/foreach}
            </select>
        </td>
    </tr>
    <!-- Set Department rights on the file -->
    <tr id="departmentSelect">
        <td>
            <a class="body" href="help.html#Add_File_-_Department" onClick="return popup(this, 'Help')" style="text-decoration:none">{$g_lang_addpage_permissions}</a>
        </td>
        <td colspan=3>
            <hr />
            {include file='../../templates/common/_filePermissions.tpl'}
            <hr />
        </td>
    </tr>
    <tr>
        <td>
            <a class="body" href="help.html#Add_File_-_Description" onClick="return popup(this, 'Help')" style="text-decoration:none">{$g_lang_label_description}</a>
        </td>
        <td colspan="3"><input tabindex="5" type="Text" name="description" size="50" value="{$description}"/></td>
    </tr>

    <tr>
        <td>
            <a class="body" href="help.html#Add_File_-_Comment" onClick="return popup(this, 'Help')" style="text-decoration:none">{$g_lang_label_comment}</a>
        </td>
        <td colspan="3"><textarea tabindex="6" name="comment" rows="4" onchange="this.value=enforceLength(this.value, 255);">{$comment}</textarea></td>
    </tr>