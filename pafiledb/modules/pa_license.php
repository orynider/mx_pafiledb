<?php
/** ------------------------------------------------------------------------
 *		Subject				: mxBB - a fully modular portal and CMS (for phpBB) 
 *		Author				: Jon Ohlsson and the mxBB Team
 *		Credits				: The phpBB Group & Marc Morisette, Mohd Basri & paFileDB 3.0 �2001/2002 PHP Arena
 *		Copyright          	: (C) 2002-2005 mxBB Portal
 *		Email             	: jon@mxbb-portal.com
 *		Project site		: www.mxbb-portal.com
 * -------------------------------------------------------------------------
 * 
 *    $Id: pa_license.php,v 1.13 2005/12/08 15:15:13 jonohlsson Exp $
 */

/**
 * This program is free software; you can redistribute it and/or modify
 *    it under the terms of the GNU General Public License as published by
 *    the Free Software Foundation; either version 2 of the License, or
 *    (at your option) any later version.
 */
 
/*
  paFileDB 3.0
  �2001/2002 PHP Arena
  Written by Todd
  todd@phparena.net
  http://www.phparena.net
  Keep all copyright links on the script visible
  Please read the license included with this script for more information.
*/

class pafiledb_license extends pafiledb_public
{
	function main( $action )
	{
		global $pafiledb_template, $lang, $board_config, $phpEx, $pafiledb_config, $db, $images, $userdata;
		global $_REQUEST, $phpbb_root_path; 
		global $mx_root_path, $module_root_path, $is_block, $page_id, $phpEx;

		if ( isset( $_REQUEST['license_id'] ) )
		{
			$license_id = intval( $_REQUEST['license_id'] );
		}
		else
		{
			mx_message_die( GENERAL_MESSAGE, $lang['License_not_exist'] );
		}

		if ( isset( $_REQUEST['file_id'] ) )
		{
			$file_id = intval( $_REQUEST['file_id'] );
		}
		else
		{
			mx_message_die( GENERAL_MESSAGE, $lang['File_not_exist'] );
		}

		$sql = 'SELECT file_catid, file_name
			FROM ' . PA_FILES_TABLE . " 
			WHERE file_id = $file_id";

		if ( !( $result = $db->sql_query( $sql ) ) )
		{
			mx_message_die( GENERAL_ERROR, 'Couldnt Query file info', '', __LINE__, __FILE__, $sql );
		}

		if ( !$file_data = $db->sql_fetchrow( $result ) )
		{
			mx_message_die( GENERAL_MESSAGE, $lang['File_not_exist'] );
		}

		$db->sql_freeresult( $result );

		if ( ( !$this->auth[$file_data['file_catid']]['auth_download'] ) )
		{
			if ( !$userdata['session_logged_in'] )
			{
				// mx_redirect(append_sid($mx_root_path . 'login.'.$phpEx.'?redirect='.pa_this_mxurl('action=license&license_id=' . $license_id . '&file_id=' . $file_id), true));
			}

			$message = sprintf( $lang['Sorry_auth_download'], $this->auth[$file_data['file_catid']]['auth_download_type'] );
			mx_message_die( GENERAL_MESSAGE, $message );
		}

		$sql = 'SELECT * 
			FROM ' . PA_LICENSE_TABLE . " 
			WHERE license_id = $license_id";

		if ( !( $result = $db->sql_query( $sql ) ) )
		{
			mx_message_die( GENERAL_ERROR, 'Couldnt Query license info for this file', '', __LINE__, __FILE__, $sql );
		}

		if ( !$license = $db->sql_fetchrow( $result ) )
		{
			mx_message_die( GENERAL_MESSAGE, $lang['License_not_exist'] );
		}

		$db->sql_freeresult( $result );

		$pafiledb_template->assign_vars( array( 
			'L_INDEX' => "<<",
			'L_LICENSE' => $lang['License'],
			'L_LEWARN' => $lang['Licensewarn'],
			'L_AGREE' => $lang['Iagree'],
			'L_NOT_AGREE' => $lang['Dontagree'],

			'U_INDEX' => append_sid( $mx_root_path . 'index.' . $phpEx ),
			'U_DOWNLOAD_HOME' => append_sid( pa_this_mxurl() ),
			'U_FILE_NAME' => append_sid( pa_this_mxurl( 'action=file&file_id=' . $file_id ) ),
			'U_DOWNLOAD' => append_sid( pa_this_mxurl( 'action=download&file_id=' . $file_id, 1 ) ),

			'LE_NAME' => $license['license_name'],
			'FILE_NAME' => $file_data['file_name'],
			'LE_TEXT' => nl2br( $license['license_text'] ),
			'DOWNLOAD' => $pafiledb_config['module_name'] ) 
		);
			
		// ===================================================
		// assign var for navigation
		// ===================================================
		$this->generate_navigation( $file_data['file_catid'] );			

		$this->display( $lang['Download'], 'pa_license_body.tpl' );
	}
}

?>