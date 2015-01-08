-- phpMyAdmin SQL Dump
-- version 4.2.8.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jan 08, 2015 at 08:40 AM
-- Server version: 5.5.40-36.1-log
-- PHP Version: 5.4.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Database: `etechni1_moodle`
--

-- --------------------------------------------------------

--
-- Table structure for table `mdl_assign`
--

CREATE TABLE IF NOT EXISTS `mdl_assign` (
`id` bigint(10) NOT NULL,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `intro` longtext NOT NULL,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `alwaysshowdescription` tinyint(2) NOT NULL DEFAULT '0',
  `nosubmissions` tinyint(2) NOT NULL DEFAULT '0',
  `submissiondrafts` tinyint(2) NOT NULL DEFAULT '0',
  `sendnotifications` tinyint(2) NOT NULL DEFAULT '0',
  `sendlatenotifications` tinyint(2) NOT NULL DEFAULT '0',
  `duedate` bigint(10) NOT NULL DEFAULT '0',
  `allowsubmissionsfromdate` bigint(10) NOT NULL DEFAULT '0',
  `grade` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `requiresubmissionstatement` tinyint(2) NOT NULL DEFAULT '0',
  `completionsubmit` tinyint(2) NOT NULL DEFAULT '0',
  `cutoffdate` bigint(10) NOT NULL DEFAULT '0',
  `teamsubmission` tinyint(2) NOT NULL DEFAULT '0',
  `requireallteammemberssubmit` tinyint(2) NOT NULL DEFAULT '0',
  `teamsubmissiongroupingid` bigint(10) NOT NULL DEFAULT '0',
  `blindmarking` tinyint(2) NOT NULL DEFAULT '0',
  `revealidentities` tinyint(2) NOT NULL DEFAULT '0',
  `attemptreopenmethod` varchar(10) NOT NULL DEFAULT 'none',
  `maxattempts` mediumint(6) NOT NULL DEFAULT '-1',
  `markingworkflow` tinyint(2) NOT NULL DEFAULT '0',
  `markingallocation` tinyint(2) NOT NULL DEFAULT '0',
  `sendstudentnotifications` tinyint(2) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='This table saves information about an instance of mod_assign';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_assignfeedback_comments`
--

CREATE TABLE IF NOT EXISTS `mdl_assignfeedback_comments` (
`id` bigint(10) NOT NULL,
  `assignment` bigint(10) NOT NULL DEFAULT '0',
  `grade` bigint(10) NOT NULL DEFAULT '0',
  `commenttext` longtext,
  `commentformat` smallint(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Text feedback for submitted assignments';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_assignfeedback_editpdf_annot`
--

CREATE TABLE IF NOT EXISTS `mdl_assignfeedback_editpdf_annot` (
`id` bigint(10) NOT NULL,
  `gradeid` bigint(10) NOT NULL DEFAULT '0',
  `pageno` bigint(10) NOT NULL DEFAULT '0',
  `x` bigint(10) DEFAULT '0',
  `y` bigint(10) DEFAULT '0',
  `endx` bigint(10) DEFAULT '0',
  `endy` bigint(10) DEFAULT '0',
  `path` longtext,
  `type` varchar(10) DEFAULT 'line',
  `colour` varchar(10) DEFAULT 'black',
  `draft` tinyint(2) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='stores annotations added to pdfs submitted by students';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_assignfeedback_editpdf_cmnt`
--

CREATE TABLE IF NOT EXISTS `mdl_assignfeedback_editpdf_cmnt` (
`id` bigint(10) NOT NULL,
  `gradeid` bigint(10) NOT NULL DEFAULT '0',
  `x` bigint(10) DEFAULT '0',
  `y` bigint(10) DEFAULT '0',
  `width` bigint(10) DEFAULT '120',
  `rawtext` longtext,
  `pageno` bigint(10) NOT NULL DEFAULT '0',
  `colour` varchar(10) DEFAULT 'black',
  `draft` tinyint(2) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores comments added to pdfs';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_assignfeedback_editpdf_quick`
--

CREATE TABLE IF NOT EXISTS `mdl_assignfeedback_editpdf_quick` (
`id` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `rawtext` longtext NOT NULL,
  `width` bigint(10) NOT NULL DEFAULT '120',
  `colour` varchar(10) DEFAULT 'yellow'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores teacher specified quicklist comments';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_assignfeedback_file`
--

CREATE TABLE IF NOT EXISTS `mdl_assignfeedback_file` (
`id` bigint(10) NOT NULL,
  `assignment` bigint(10) NOT NULL DEFAULT '0',
  `grade` bigint(10) NOT NULL DEFAULT '0',
  `numfiles` bigint(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores info about the number of files submitted by a student';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_assignment`
--

CREATE TABLE IF NOT EXISTS `mdl_assignment` (
`id` bigint(10) NOT NULL,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `intro` longtext NOT NULL,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `assignmenttype` varchar(50) NOT NULL DEFAULT '',
  `resubmit` tinyint(2) NOT NULL DEFAULT '0',
  `preventlate` tinyint(2) NOT NULL DEFAULT '0',
  `emailteachers` tinyint(2) NOT NULL DEFAULT '0',
  `var1` bigint(10) DEFAULT '0',
  `var2` bigint(10) DEFAULT '0',
  `var3` bigint(10) DEFAULT '0',
  `var4` bigint(10) DEFAULT '0',
  `var5` bigint(10) DEFAULT '0',
  `maxbytes` bigint(10) NOT NULL DEFAULT '100000',
  `timedue` bigint(10) NOT NULL DEFAULT '0',
  `timeavailable` bigint(10) NOT NULL DEFAULT '0',
  `grade` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Defines assignments';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_assignment_submissions`
--

CREATE TABLE IF NOT EXISTS `mdl_assignment_submissions` (
`id` bigint(10) NOT NULL,
  `assignment` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `numfiles` bigint(10) NOT NULL DEFAULT '0',
  `data1` longtext,
  `data2` longtext,
  `grade` bigint(11) NOT NULL DEFAULT '0',
  `submissioncomment` longtext NOT NULL,
  `format` smallint(4) NOT NULL DEFAULT '0',
  `teacher` bigint(10) NOT NULL DEFAULT '0',
  `timemarked` bigint(10) NOT NULL DEFAULT '0',
  `mailed` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Info about submitted assignments';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_assignment_upgrade`
--

CREATE TABLE IF NOT EXISTS `mdl_assignment_upgrade` (
`id` bigint(10) NOT NULL,
  `oldcmid` bigint(10) NOT NULL DEFAULT '0',
  `oldinstance` bigint(10) NOT NULL DEFAULT '0',
  `newcmid` bigint(10) NOT NULL DEFAULT '0',
  `newinstance` bigint(10) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Info about upgraded assignments';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_assignsubmission_file`
--

CREATE TABLE IF NOT EXISTS `mdl_assignsubmission_file` (
`id` bigint(10) NOT NULL,
  `assignment` bigint(10) NOT NULL DEFAULT '0',
  `submission` bigint(10) NOT NULL DEFAULT '0',
  `numfiles` bigint(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Info about file submissions for assignments';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_assignsubmission_onlinetext`
--

CREATE TABLE IF NOT EXISTS `mdl_assignsubmission_onlinetext` (
`id` bigint(10) NOT NULL,
  `assignment` bigint(10) NOT NULL DEFAULT '0',
  `submission` bigint(10) NOT NULL DEFAULT '0',
  `onlinetext` longtext,
  `onlineformat` smallint(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Info about onlinetext submission';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_assign_grades`
--

CREATE TABLE IF NOT EXISTS `mdl_assign_grades` (
`id` bigint(10) NOT NULL,
  `assignment` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `grader` bigint(10) NOT NULL DEFAULT '0',
  `grade` decimal(10,5) DEFAULT '0.00000',
  `attemptnumber` bigint(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Grading information about a single assignment submission.';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_assign_plugin_config`
--

CREATE TABLE IF NOT EXISTS `mdl_assign_plugin_config` (
`id` bigint(10) NOT NULL,
  `assignment` bigint(10) NOT NULL DEFAULT '0',
  `plugin` varchar(28) NOT NULL DEFAULT '',
  `subtype` varchar(28) NOT NULL DEFAULT '',
  `name` varchar(28) NOT NULL DEFAULT '',
  `value` longtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Config data for an instance of a plugin in an assignment.';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_assign_submission`
--

CREATE TABLE IF NOT EXISTS `mdl_assign_submission` (
`id` bigint(10) NOT NULL,
  `assignment` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `status` varchar(10) DEFAULT NULL,
  `groupid` bigint(10) NOT NULL DEFAULT '0',
  `attemptnumber` bigint(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='This table keeps information about student interactions with';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_assign_user_flags`
--

CREATE TABLE IF NOT EXISTS `mdl_assign_user_flags` (
`id` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `assignment` bigint(10) NOT NULL DEFAULT '0',
  `locked` bigint(10) NOT NULL DEFAULT '0',
  `mailed` smallint(4) NOT NULL DEFAULT '0',
  `extensionduedate` bigint(10) NOT NULL DEFAULT '0',
  `workflowstate` varchar(20) DEFAULT NULL,
  `allocatedmarker` bigint(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='List of flags that can be set for a single user in a single ';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_assign_user_mapping`
--

CREATE TABLE IF NOT EXISTS `mdl_assign_user_mapping` (
`id` bigint(10) NOT NULL,
  `assignment` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Map an assignment specific id number to a user';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_backup_controllers`
--

CREATE TABLE IF NOT EXISTS `mdl_backup_controllers` (
`id` bigint(10) NOT NULL,
  `backupid` varchar(32) NOT NULL DEFAULT '',
  `operation` varchar(20) NOT NULL DEFAULT 'backup',
  `type` varchar(10) NOT NULL DEFAULT '',
  `itemid` bigint(10) NOT NULL,
  `format` varchar(20) NOT NULL DEFAULT '',
  `interactive` smallint(4) NOT NULL,
  `purpose` smallint(4) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `status` smallint(4) NOT NULL,
  `execution` smallint(4) NOT NULL,
  `executiontime` bigint(10) NOT NULL,
  `checksum` varchar(32) NOT NULL DEFAULT '',
  `timecreated` bigint(10) NOT NULL,
  `timemodified` bigint(10) NOT NULL,
  `controller` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='To store the backup_controllers as they are used';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_backup_courses`
--

CREATE TABLE IF NOT EXISTS `mdl_backup_courses` (
`id` bigint(10) NOT NULL,
  `courseid` bigint(10) NOT NULL DEFAULT '0',
  `laststarttime` bigint(10) NOT NULL DEFAULT '0',
  `lastendtime` bigint(10) NOT NULL DEFAULT '0',
  `laststatus` varchar(1) NOT NULL DEFAULT '5',
  `nextstarttime` bigint(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='To store every course backup status';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_backup_logs`
--

CREATE TABLE IF NOT EXISTS `mdl_backup_logs` (
`id` bigint(10) NOT NULL,
  `backupid` varchar(32) NOT NULL DEFAULT '',
  `loglevel` smallint(4) NOT NULL,
  `message` longtext NOT NULL,
  `timecreated` bigint(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='To store all the logs from backup and restore operations (by';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_badge`
--

CREATE TABLE IF NOT EXISTS `mdl_badge` (
`id` bigint(10) NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `description` longtext,
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `usercreated` bigint(10) NOT NULL,
  `usermodified` bigint(10) NOT NULL,
  `issuername` varchar(255) NOT NULL DEFAULT '',
  `issuerurl` varchar(255) NOT NULL DEFAULT '',
  `issuercontact` varchar(255) DEFAULT NULL,
  `expiredate` bigint(10) DEFAULT NULL,
  `expireperiod` bigint(10) DEFAULT NULL,
  `type` tinyint(1) NOT NULL DEFAULT '1',
  `courseid` bigint(10) DEFAULT NULL,
  `message` longtext NOT NULL,
  `messagesubject` longtext NOT NULL,
  `attachment` tinyint(1) NOT NULL DEFAULT '1',
  `notification` tinyint(1) NOT NULL DEFAULT '1',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `nextcron` bigint(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Defines badge';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_badge_backpack`
--

CREATE TABLE IF NOT EXISTS `mdl_badge_backpack` (
`id` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `email` varchar(100) NOT NULL DEFAULT '',
  `backpackurl` varchar(255) NOT NULL DEFAULT '',
  `backpackuid` bigint(10) NOT NULL,
  `autosync` tinyint(1) NOT NULL DEFAULT '0',
  `password` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Defines settings for connecting external backpack';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_badge_criteria`
--

CREATE TABLE IF NOT EXISTS `mdl_badge_criteria` (
`id` bigint(10) NOT NULL,
  `badgeid` bigint(10) NOT NULL DEFAULT '0',
  `criteriatype` bigint(10) DEFAULT NULL,
  `method` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Defines criteria for issuing badges';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_badge_criteria_met`
--

CREATE TABLE IF NOT EXISTS `mdl_badge_criteria_met` (
`id` bigint(10) NOT NULL,
  `issuedid` bigint(10) DEFAULT NULL,
  `critid` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `datemet` bigint(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Defines criteria that were met for an issued badge';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_badge_criteria_param`
--

CREATE TABLE IF NOT EXISTS `mdl_badge_criteria_param` (
`id` bigint(10) NOT NULL,
  `critid` bigint(10) NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `value` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Defines parameters for badges criteria';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_badge_external`
--

CREATE TABLE IF NOT EXISTS `mdl_badge_external` (
`id` bigint(10) NOT NULL,
  `backpackid` bigint(10) NOT NULL,
  `collectionid` bigint(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Setting for external badges display';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_badge_issued`
--

CREATE TABLE IF NOT EXISTS `mdl_badge_issued` (
`id` bigint(10) NOT NULL,
  `badgeid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `uniquehash` longtext NOT NULL,
  `dateissued` bigint(10) NOT NULL DEFAULT '0',
  `dateexpire` bigint(10) DEFAULT NULL,
  `visible` tinyint(1) NOT NULL DEFAULT '0',
  `issuernotified` bigint(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Defines issued badges';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_badge_manual_award`
--

CREATE TABLE IF NOT EXISTS `mdl_badge_manual_award` (
`id` bigint(10) NOT NULL,
  `badgeid` bigint(10) NOT NULL,
  `recipientid` bigint(10) NOT NULL,
  `issuerid` bigint(10) NOT NULL,
  `issuerrole` bigint(10) NOT NULL,
  `datemet` bigint(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Track manual award criteria for badges';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_block`
--

CREATE TABLE IF NOT EXISTS `mdl_block` (
`id` bigint(10) NOT NULL,
  `name` varchar(40) NOT NULL DEFAULT '',
  `cron` bigint(10) NOT NULL DEFAULT '0',
  `lastcron` bigint(10) NOT NULL DEFAULT '0',
  `visible` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8 COMMENT='contains all installed blocks';

--
-- Dumping data for table `mdl_block`
--

INSERT INTO `mdl_block` (`id`, `name`, `cron`, `lastcron`, `visible`) VALUES
(1, 'activity_modules', 0, 0, 1),
(2, 'admin_bookmarks', 0, 0, 1),
(3, 'badges', 0, 0, 1),
(4, 'blog_menu', 0, 0, 1),
(5, 'blog_recent', 0, 0, 1),
(6, 'blog_tags', 0, 0, 1),
(7, 'calendar_month', 0, 0, 1),
(8, 'calendar_upcoming', 0, 0, 1),
(9, 'comments', 0, 0, 1),
(10, 'community', 0, 0, 1),
(11, 'completionstatus', 0, 0, 1),
(12, 'course_list', 0, 0, 1),
(13, 'course_overview', 0, 0, 1),
(14, 'course_summary', 0, 0, 1),
(15, 'feedback', 0, 0, 0),
(16, 'glossary_random', 0, 0, 1),
(17, 'html', 0, 0, 1),
(18, 'login', 0, 0, 1),
(19, 'mentees', 0, 0, 1),
(20, 'messages', 0, 0, 1),
(21, 'mnet_hosts', 0, 0, 1),
(22, 'myprofile', 0, 0, 1),
(23, 'navigation', 0, 0, 1),
(24, 'news_items', 0, 0, 1),
(25, 'online_users', 0, 0, 1),
(26, 'participants', 0, 0, 1),
(27, 'private_files', 0, 0, 1),
(28, 'quiz_results', 0, 0, 1),
(29, 'recent_activity', 86400, 0, 1),
(30, 'rss_client', 300, 1415196025, 1),
(31, 'search_forums', 0, 0, 1),
(32, 'section_links', 0, 0, 1),
(33, 'selfcompletion', 0, 0, 1),
(34, 'settings', 0, 0, 1),
(35, 'site_main_menu', 0, 0, 1),
(36, 'social_activities', 0, 0, 1),
(37, 'tag_flickr', 0, 0, 1),
(38, 'tag_youtube', 0, 0, 1),
(39, 'tags', 0, 0, 1),
(40, 'quickmail', 0, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_block_community`
--

CREATE TABLE IF NOT EXISTS `mdl_block_community` (
`id` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `coursename` varchar(255) NOT NULL DEFAULT '',
  `coursedescription` longtext,
  `courseurl` varchar(255) NOT NULL DEFAULT '',
  `imageurl` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Community block';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_block_instances`
--

CREATE TABLE IF NOT EXISTS `mdl_block_instances` (
`id` bigint(10) NOT NULL,
  `blockname` varchar(40) NOT NULL DEFAULT '',
  `parentcontextid` bigint(10) NOT NULL,
  `showinsubcontexts` smallint(4) NOT NULL,
  `pagetypepattern` varchar(64) NOT NULL DEFAULT '',
  `subpagepattern` varchar(16) DEFAULT NULL,
  `defaultregion` varchar(16) NOT NULL DEFAULT '',
  `defaultweight` bigint(10) NOT NULL,
  `configdata` longtext
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COMMENT='This table stores block instances. The type of block this is';

--
-- Dumping data for table `mdl_block_instances`
--

INSERT INTO `mdl_block_instances` (`id`, `blockname`, `parentcontextid`, `showinsubcontexts`, `pagetypepattern`, `subpagepattern`, `defaultregion`, `defaultweight`, `configdata`) VALUES
(1, 'site_main_menu', 2, 0, 'site-index', NULL, 'side-pre', 0, ''),
(2, 'course_summary', 2, 0, 'site-index', NULL, 'side-post', 0, ''),
(3, 'calendar_month', 2, 0, 'site-index', NULL, 'side-post', 1, ''),
(4, 'navigation', 1, 1, '*', NULL, 'side-pre', 0, ''),
(5, 'settings', 1, 1, '*', NULL, 'side-pre', 1, ''),
(6, 'admin_bookmarks', 1, 0, 'admin-*', NULL, 'side-pre', 0, ''),
(7, 'private_files', 1, 0, 'my-index', '2', 'side-post', 0, ''),
(8, 'online_users', 1, 0, 'my-index', '2', 'side-post', 1, ''),
(9, 'course_overview', 1, 0, 'my-index', '2', 'content', 0, ''),
(10, 'search_forums', 16, 0, 'course-view-*', NULL, 'side-post', 0, ''),
(11, 'news_items', 16, 0, 'course-view-*', NULL, 'side-post', 1, ''),
(12, 'calendar_upcoming', 16, 0, 'course-view-*', NULL, 'side-post', 2, ''),
(13, 'recent_activity', 16, 0, 'course-view-*', NULL, 'side-post', 3, '');

-- --------------------------------------------------------

--
-- Table structure for table `mdl_block_positions`
--

CREATE TABLE IF NOT EXISTS `mdl_block_positions` (
`id` bigint(10) NOT NULL,
  `blockinstanceid` bigint(10) NOT NULL,
  `contextid` bigint(10) NOT NULL,
  `pagetype` varchar(64) NOT NULL DEFAULT '',
  `subpage` varchar(16) NOT NULL DEFAULT '',
  `visible` smallint(4) NOT NULL,
  `region` varchar(16) NOT NULL DEFAULT '',
  `weight` bigint(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores the position of a sticky block_instance on a another ';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_block_quickmail_alternate`
--

CREATE TABLE IF NOT EXISTS `mdl_block_quickmail_alternate` (
`id` bigint(10) NOT NULL,
  `courseid` bigint(10) NOT NULL,
  `address` varchar(100) NOT NULL DEFAULT '',
  `valid` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores alternate email sources for users.';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_block_quickmail_config`
--

CREATE TABLE IF NOT EXISTS `mdl_block_quickmail_config` (
`id` bigint(10) NOT NULL,
  `coursesid` bigint(11) NOT NULL,
  `name` varchar(25) NOT NULL DEFAULT '',
  `value` varchar(125) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores config info for teachers, per instance basis.';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_block_quickmail_drafts`
--

CREATE TABLE IF NOT EXISTS `mdl_block_quickmail_drafts` (
`id` bigint(10) NOT NULL,
  `courseid` bigint(11) NOT NULL DEFAULT '0',
  `userid` bigint(11) NOT NULL DEFAULT '0',
  `alternateid` bigint(10) DEFAULT NULL,
  `mailto` longtext,
  `subject` longtext,
  `message` longtext,
  `attachment` longtext NOT NULL,
  `format` smallint(3) NOT NULL DEFAULT '1',
  `time` bigint(10) DEFAULT NULL,
  `additional_emails` longtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores drafts for users';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_block_quickmail_log`
--

CREATE TABLE IF NOT EXISTS `mdl_block_quickmail_log` (
`id` bigint(10) NOT NULL,
  `courseid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `alternateid` bigint(10) DEFAULT NULL,
  `mailto` longtext NOT NULL,
  `subject` varchar(255) NOT NULL DEFAULT '',
  `message` longtext NOT NULL,
  `attachment` longtext NOT NULL,
  `format` smallint(3) NOT NULL DEFAULT '1',
  `time` bigint(10) NOT NULL DEFAULT '0',
  `failuserids` longtext,
  `additional_emails` longtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores the email history for the quickmail block';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_block_quickmail_signatures`
--

CREATE TABLE IF NOT EXISTS `mdl_block_quickmail_signatures` (
`id` bigint(10) NOT NULL,
  `userid` bigint(11) NOT NULL DEFAULT '0',
  `title` varchar(125) DEFAULT NULL,
  `signature` longtext,
  `default_flag` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores signatures for users';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_block_recent_activity`
--

CREATE TABLE IF NOT EXISTS `mdl_block_recent_activity` (
`id` bigint(10) NOT NULL,
  `courseid` bigint(10) NOT NULL,
  `cmid` bigint(10) NOT NULL,
  `timecreated` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `action` tinyint(1) NOT NULL,
  `modname` varchar(20) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='Recent activity block';

--
-- Dumping data for table `mdl_block_recent_activity`
--

INSERT INTO `mdl_block_recent_activity` (`id`, `courseid`, `cmid`, `timecreated`, `userid`, `action`, `modname`) VALUES
(1, 2, 2, 1418230163, 2, 0, NULL),
(2, 2, 2, 1418230206, 2, 2, 'lesson'),
(3, 2, 3, 1419704462, 2, 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_block_rss_client`
--

CREATE TABLE IF NOT EXISTS `mdl_block_rss_client` (
`id` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `title` longtext NOT NULL,
  `preferredtitle` varchar(64) NOT NULL DEFAULT '',
  `description` longtext NOT NULL,
  `shared` tinyint(2) NOT NULL DEFAULT '0',
  `url` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Remote news feed information. Contains the news feed id, the';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_blog_association`
--

CREATE TABLE IF NOT EXISTS `mdl_blog_association` (
`id` bigint(10) NOT NULL,
  `contextid` bigint(10) NOT NULL,
  `blogid` bigint(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Associations of blog entries with courses and module instanc';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_blog_external`
--

CREATE TABLE IF NOT EXISTS `mdl_blog_external` (
`id` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `description` longtext,
  `url` longtext NOT NULL,
  `filtertags` varchar(255) DEFAULT NULL,
  `failedlastsync` tinyint(1) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) DEFAULT NULL,
  `timefetched` bigint(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='External blog links used for RSS copying of blog entries to ';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_book`
--

CREATE TABLE IF NOT EXISTS `mdl_book` (
`id` bigint(10) NOT NULL,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `intro` longtext,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `numbering` smallint(4) NOT NULL DEFAULT '0',
  `customtitles` tinyint(2) NOT NULL DEFAULT '0',
  `revision` bigint(10) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Defines book';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_book_chapters`
--

CREATE TABLE IF NOT EXISTS `mdl_book_chapters` (
`id` bigint(10) NOT NULL,
  `bookid` bigint(10) NOT NULL DEFAULT '0',
  `pagenum` bigint(10) NOT NULL DEFAULT '0',
  `subchapter` bigint(10) NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL DEFAULT '',
  `content` longtext NOT NULL,
  `contentformat` smallint(4) NOT NULL DEFAULT '0',
  `hidden` tinyint(2) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `importsrc` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Defines book_chapters';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_cache_filters`
--

CREATE TABLE IF NOT EXISTS `mdl_cache_filters` (
`id` bigint(10) NOT NULL,
  `filter` varchar(32) NOT NULL DEFAULT '',
  `version` bigint(10) NOT NULL DEFAULT '0',
  `md5key` varchar(32) NOT NULL DEFAULT '',
  `rawtext` longtext NOT NULL,
  `timemodified` bigint(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='For keeping information about cached data';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_cache_flags`
--

CREATE TABLE IF NOT EXISTS `mdl_cache_flags` (
`id` bigint(10) NOT NULL,
  `flagtype` varchar(255) NOT NULL DEFAULT '',
  `name` varchar(255) NOT NULL DEFAULT '',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `value` longtext NOT NULL,
  `expiry` bigint(10) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='Cache of time-sensitive flags';

--
-- Dumping data for table `mdl_cache_flags`
--

INSERT INTO `mdl_cache_flags` (`id`, `flagtype`, `name`, `timemodified`, `value`, `expiry`) VALUES
(1, 'userpreferenceschanged', '2', 1420730790, '1', 1420737990),
(2, 'accesslib/dirtycontexts', '/1', 1418233258, '1', 1418240458),
(3, 'accesslib/dirtycontexts', '/1/15', 1415372547, '1', 1415379747),
(4, 'accesslib/dirtycontexts', '/1/15/16', 1415917274, '1', 1415924474),
(5, 'userpreferenceschanged', '3', 1418231448, '1', 1418238648),
(6, 'userpreferenceschanged', '4', 1418232961, '1', 1418240161),
(7, 'userpreferenceschanged', '5', 1417667259, '1', 1417674459),
(8, 'accesslib/dirtycontexts', '/1/15/16/25', 1418230206, '1', 1418237406);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_capabilities`
--

CREATE TABLE IF NOT EXISTS `mdl_capabilities` (
`id` bigint(10) NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `captype` varchar(50) NOT NULL DEFAULT '',
  `contextlevel` bigint(10) NOT NULL DEFAULT '0',
  `component` varchar(100) NOT NULL DEFAULT '',
  `riskbitmask` bigint(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=516 DEFAULT CHARSET=utf8 COMMENT='this defines all capabilities';

--
-- Dumping data for table `mdl_capabilities`
--

INSERT INTO `mdl_capabilities` (`id`, `name`, `captype`, `contextlevel`, `component`, `riskbitmask`) VALUES
(1, 'moodle/site:config', 'write', 10, 'moodle', 62),
(2, 'moodle/site:readallmessages', 'read', 10, 'moodle', 8),
(3, 'moodle/site:sendmessage', 'write', 10, 'moodle', 16),
(4, 'moodle/site:approvecourse', 'write', 10, 'moodle', 4),
(5, 'moodle/backup:backupcourse', 'write', 50, 'moodle', 28),
(6, 'moodle/backup:backupsection', 'write', 50, 'moodle', 28),
(7, 'moodle/backup:backupactivity', 'write', 70, 'moodle', 28),
(8, 'moodle/backup:backuptargethub', 'write', 50, 'moodle', 28),
(9, 'moodle/backup:backuptargetimport', 'write', 50, 'moodle', 28),
(10, 'moodle/backup:downloadfile', 'write', 50, 'moodle', 28),
(11, 'moodle/backup:configure', 'write', 50, 'moodle', 28),
(12, 'moodle/backup:userinfo', 'read', 50, 'moodle', 8),
(13, 'moodle/backup:anonymise', 'read', 50, 'moodle', 8),
(14, 'moodle/restore:restorecourse', 'write', 50, 'moodle', 28),
(15, 'moodle/restore:restoresection', 'write', 50, 'moodle', 28),
(16, 'moodle/restore:restoreactivity', 'write', 50, 'moodle', 28),
(17, 'moodle/restore:viewautomatedfilearea', 'write', 50, 'moodle', 28),
(18, 'moodle/restore:restoretargethub', 'write', 50, 'moodle', 28),
(19, 'moodle/restore:restoretargetimport', 'write', 50, 'moodle', 28),
(20, 'moodle/restore:uploadfile', 'write', 50, 'moodle', 28),
(21, 'moodle/restore:configure', 'write', 50, 'moodle', 28),
(22, 'moodle/restore:rolldates', 'write', 50, 'moodle', 0),
(23, 'moodle/restore:userinfo', 'write', 50, 'moodle', 30),
(24, 'moodle/restore:createuser', 'write', 10, 'moodle', 24),
(25, 'moodle/site:manageblocks', 'write', 80, 'moodle', 20),
(26, 'moodle/site:accessallgroups', 'read', 50, 'moodle', 0),
(27, 'moodle/site:viewfullnames', 'read', 50, 'moodle', 0),
(28, 'moodle/site:viewuseridentity', 'read', 50, 'moodle', 0),
(29, 'moodle/site:viewreports', 'read', 50, 'moodle', 8),
(30, 'moodle/site:trustcontent', 'write', 50, 'moodle', 4),
(31, 'moodle/site:uploadusers', 'write', 10, 'moodle', 24),
(32, 'moodle/filter:manage', 'write', 50, 'moodle', 0),
(33, 'moodle/user:create', 'write', 10, 'moodle', 24),
(34, 'moodle/user:delete', 'write', 10, 'moodle', 8),
(35, 'moodle/user:update', 'write', 10, 'moodle', 24),
(36, 'moodle/user:viewdetails', 'read', 50, 'moodle', 0),
(37, 'moodle/user:viewalldetails', 'read', 30, 'moodle', 8),
(38, 'moodle/user:viewlastip', 'read', 30, 'moodle', 8),
(39, 'moodle/user:viewhiddendetails', 'read', 50, 'moodle', 8),
(40, 'moodle/user:loginas', 'write', 50, 'moodle', 30),
(41, 'moodle/user:managesyspages', 'write', 10, 'moodle', 0),
(42, 'moodle/user:manageblocks', 'write', 30, 'moodle', 0),
(43, 'moodle/user:manageownblocks', 'write', 10, 'moodle', 0),
(44, 'moodle/user:manageownfiles', 'write', 10, 'moodle', 0),
(45, 'moodle/user:ignoreuserquota', 'write', 10, 'moodle', 0),
(46, 'moodle/my:configsyspages', 'write', 10, 'moodle', 0),
(47, 'moodle/role:assign', 'write', 50, 'moodle', 28),
(48, 'moodle/role:review', 'read', 50, 'moodle', 8),
(49, 'moodle/role:override', 'write', 50, 'moodle', 28),
(50, 'moodle/role:safeoverride', 'write', 50, 'moodle', 16),
(51, 'moodle/role:manage', 'write', 10, 'moodle', 28),
(52, 'moodle/role:switchroles', 'read', 50, 'moodle', 12),
(53, 'moodle/category:manage', 'write', 40, 'moodle', 4),
(54, 'moodle/category:viewhiddencategories', 'read', 40, 'moodle', 0),
(55, 'moodle/cohort:manage', 'write', 40, 'moodle', 0),
(56, 'moodle/cohort:assign', 'write', 40, 'moodle', 0),
(57, 'moodle/cohort:view', 'read', 50, 'moodle', 0),
(58, 'moodle/course:create', 'write', 40, 'moodle', 4),
(59, 'moodle/course:request', 'write', 10, 'moodle', 0),
(60, 'moodle/course:delete', 'write', 50, 'moodle', 32),
(61, 'moodle/course:update', 'write', 50, 'moodle', 4),
(62, 'moodle/course:view', 'read', 50, 'moodle', 0),
(63, 'moodle/course:enrolreview', 'read', 50, 'moodle', 8),
(64, 'moodle/course:enrolconfig', 'write', 50, 'moodle', 8),
(65, 'moodle/course:reviewotherusers', 'read', 50, 'moodle', 0),
(66, 'moodle/course:bulkmessaging', 'write', 50, 'moodle', 16),
(67, 'moodle/course:viewhiddenuserfields', 'read', 50, 'moodle', 8),
(68, 'moodle/course:viewhiddencourses', 'read', 50, 'moodle', 0),
(69, 'moodle/course:visibility', 'write', 50, 'moodle', 0),
(70, 'moodle/course:managefiles', 'write', 50, 'moodle', 4),
(71, 'moodle/course:ignorefilesizelimits', 'write', 50, 'moodle', 0),
(72, 'moodle/course:manageactivities', 'write', 70, 'moodle', 4),
(73, 'moodle/course:activityvisibility', 'write', 70, 'moodle', 0),
(74, 'moodle/course:viewhiddenactivities', 'write', 70, 'moodle', 0),
(75, 'moodle/course:viewparticipants', 'read', 50, 'moodle', 0),
(76, 'moodle/course:changefullname', 'write', 50, 'moodle', 4),
(77, 'moodle/course:changeshortname', 'write', 50, 'moodle', 4),
(78, 'moodle/course:changeidnumber', 'write', 50, 'moodle', 4),
(79, 'moodle/course:changecategory', 'write', 50, 'moodle', 4),
(80, 'moodle/course:changesummary', 'write', 50, 'moodle', 4),
(81, 'moodle/site:viewparticipants', 'read', 10, 'moodle', 0),
(82, 'moodle/course:isincompletionreports', 'read', 50, 'moodle', 0),
(83, 'moodle/course:viewscales', 'read', 50, 'moodle', 0),
(84, 'moodle/course:managescales', 'write', 50, 'moodle', 0),
(85, 'moodle/course:managegroups', 'write', 50, 'moodle', 0),
(86, 'moodle/course:reset', 'write', 50, 'moodle', 32),
(87, 'moodle/course:viewsuspendedusers', 'read', 10, 'moodle', 0),
(88, 'moodle/blog:view', 'read', 10, 'moodle', 0),
(89, 'moodle/blog:search', 'read', 10, 'moodle', 0),
(90, 'moodle/blog:viewdrafts', 'read', 10, 'moodle', 8),
(91, 'moodle/blog:create', 'write', 10, 'moodle', 16),
(92, 'moodle/blog:manageentries', 'write', 10, 'moodle', 16),
(93, 'moodle/blog:manageexternal', 'write', 10, 'moodle', 16),
(94, 'moodle/blog:associatecourse', 'write', 50, 'moodle', 0),
(95, 'moodle/blog:associatemodule', 'write', 70, 'moodle', 0),
(96, 'moodle/calendar:manageownentries', 'write', 50, 'moodle', 16),
(97, 'moodle/calendar:managegroupentries', 'write', 50, 'moodle', 16),
(98, 'moodle/calendar:manageentries', 'write', 50, 'moodle', 16),
(99, 'moodle/user:editprofile', 'write', 30, 'moodle', 24),
(100, 'moodle/user:editownprofile', 'write', 10, 'moodle', 16),
(101, 'moodle/user:changeownpassword', 'write', 10, 'moodle', 0),
(102, 'moodle/user:readuserposts', 'read', 30, 'moodle', 0),
(103, 'moodle/user:readuserblogs', 'read', 30, 'moodle', 0),
(104, 'moodle/user:viewuseractivitiesreport', 'read', 30, 'moodle', 8),
(105, 'moodle/user:editmessageprofile', 'write', 30, 'moodle', 16),
(106, 'moodle/user:editownmessageprofile', 'write', 10, 'moodle', 0),
(107, 'moodle/question:managecategory', 'write', 50, 'moodle', 20),
(108, 'moodle/question:add', 'write', 50, 'moodle', 20),
(109, 'moodle/question:editmine', 'write', 50, 'moodle', 20),
(110, 'moodle/question:editall', 'write', 50, 'moodle', 20),
(111, 'moodle/question:viewmine', 'read', 50, 'moodle', 0),
(112, 'moodle/question:viewall', 'read', 50, 'moodle', 0),
(113, 'moodle/question:usemine', 'read', 50, 'moodle', 0),
(114, 'moodle/question:useall', 'read', 50, 'moodle', 0),
(115, 'moodle/question:movemine', 'write', 50, 'moodle', 0),
(116, 'moodle/question:moveall', 'write', 50, 'moodle', 0),
(117, 'moodle/question:config', 'write', 10, 'moodle', 2),
(118, 'moodle/question:flag', 'write', 50, 'moodle', 0),
(119, 'moodle/site:doclinks', 'read', 10, 'moodle', 0),
(120, 'moodle/course:sectionvisibility', 'write', 50, 'moodle', 0),
(121, 'moodle/course:useremail', 'write', 50, 'moodle', 0),
(122, 'moodle/course:viewhiddensections', 'write', 50, 'moodle', 0),
(123, 'moodle/course:setcurrentsection', 'write', 50, 'moodle', 0),
(124, 'moodle/course:movesections', 'write', 50, 'moodle', 0),
(125, 'moodle/site:mnetlogintoremote', 'read', 10, 'moodle', 0),
(126, 'moodle/grade:viewall', 'read', 50, 'moodle', 8),
(127, 'moodle/grade:view', 'read', 50, 'moodle', 0),
(128, 'moodle/grade:viewhidden', 'read', 50, 'moodle', 8),
(129, 'moodle/grade:import', 'write', 50, 'moodle', 12),
(130, 'moodle/grade:export', 'read', 50, 'moodle', 8),
(131, 'moodle/grade:manage', 'write', 50, 'moodle', 12),
(132, 'moodle/grade:edit', 'write', 50, 'moodle', 12),
(133, 'moodle/grade:managegradingforms', 'write', 50, 'moodle', 12),
(134, 'moodle/grade:sharegradingforms', 'write', 10, 'moodle', 4),
(135, 'moodle/grade:managesharedforms', 'write', 10, 'moodle', 4),
(136, 'moodle/grade:manageoutcomes', 'write', 50, 'moodle', 0),
(137, 'moodle/grade:manageletters', 'write', 50, 'moodle', 0),
(138, 'moodle/grade:hide', 'write', 50, 'moodle', 0),
(139, 'moodle/grade:lock', 'write', 50, 'moodle', 0),
(140, 'moodle/grade:unlock', 'write', 50, 'moodle', 0),
(141, 'moodle/my:manageblocks', 'write', 10, 'moodle', 0),
(142, 'moodle/notes:view', 'read', 50, 'moodle', 0),
(143, 'moodle/notes:manage', 'write', 50, 'moodle', 16),
(144, 'moodle/tag:manage', 'write', 10, 'moodle', 16),
(145, 'moodle/tag:create', 'write', 10, 'moodle', 16),
(146, 'moodle/tag:edit', 'write', 10, 'moodle', 16),
(147, 'moodle/tag:flag', 'write', 10, 'moodle', 16),
(148, 'moodle/tag:editblocks', 'write', 10, 'moodle', 0),
(149, 'moodle/block:view', 'read', 80, 'moodle', 0),
(150, 'moodle/block:edit', 'write', 80, 'moodle', 20),
(151, 'moodle/portfolio:export', 'read', 10, 'moodle', 0),
(152, 'moodle/comment:view', 'read', 50, 'moodle', 0),
(153, 'moodle/comment:post', 'write', 50, 'moodle', 24),
(154, 'moodle/comment:delete', 'write', 50, 'moodle', 32),
(155, 'moodle/webservice:createtoken', 'write', 10, 'moodle', 62),
(156, 'moodle/webservice:createmobiletoken', 'write', 10, 'moodle', 24),
(157, 'moodle/rating:view', 'read', 50, 'moodle', 0),
(158, 'moodle/rating:viewany', 'read', 50, 'moodle', 8),
(159, 'moodle/rating:viewall', 'read', 50, 'moodle', 8),
(160, 'moodle/rating:rate', 'write', 50, 'moodle', 0),
(161, 'moodle/course:publish', 'write', 10, 'moodle', 24),
(162, 'moodle/course:markcomplete', 'write', 50, 'moodle', 0),
(163, 'moodle/community:add', 'write', 10, 'moodle', 0),
(164, 'moodle/community:download', 'write', 10, 'moodle', 0),
(165, 'moodle/badges:manageglobalsettings', 'write', 10, 'moodle', 34),
(166, 'moodle/badges:viewbadges', 'read', 50, 'moodle', 0),
(167, 'moodle/badges:manageownbadges', 'write', 30, 'moodle', 0),
(168, 'moodle/badges:viewotherbadges', 'read', 30, 'moodle', 0),
(169, 'moodle/badges:earnbadge', 'write', 50, 'moodle', 0),
(170, 'moodle/badges:createbadge', 'write', 50, 'moodle', 16),
(171, 'moodle/badges:deletebadge', 'write', 50, 'moodle', 32),
(172, 'moodle/badges:configuredetails', 'write', 50, 'moodle', 16),
(173, 'moodle/badges:configurecriteria', 'write', 50, 'moodle', 0),
(174, 'moodle/badges:configuremessages', 'write', 50, 'moodle', 16),
(175, 'moodle/badges:awardbadge', 'write', 50, 'moodle', 16),
(176, 'moodle/badges:viewawarded', 'read', 50, 'moodle', 8),
(177, 'moodle/site:forcelanguage', 'read', 10, 'moodle', 0),
(178, 'mod/assign:view', 'read', 70, 'mod_assign', 0),
(179, 'mod/assign:submit', 'write', 70, 'mod_assign', 0),
(180, 'mod/assign:grade', 'write', 70, 'mod_assign', 4),
(181, 'mod/assign:exportownsubmission', 'read', 70, 'mod_assign', 0),
(182, 'mod/assign:addinstance', 'write', 50, 'mod_assign', 4),
(183, 'mod/assign:editothersubmission', 'write', 70, 'mod_assign', 41),
(184, 'mod/assign:grantextension', 'write', 70, 'mod_assign', 0),
(185, 'mod/assign:revealidentities', 'write', 70, 'mod_assign', 0),
(186, 'mod/assign:reviewgrades', 'write', 70, 'mod_assign', 0),
(187, 'mod/assign:releasegrades', 'write', 70, 'mod_assign', 0),
(188, 'mod/assign:managegrades', 'write', 70, 'mod_assign', 0),
(189, 'mod/assign:manageallocations', 'write', 70, 'mod_assign', 0),
(190, 'mod/assign:viewgrades', 'read', 70, 'mod_assign', 0),
(191, 'mod/assignment:view', 'read', 70, 'mod_assignment', 0),
(192, 'mod/assignment:addinstance', 'write', 50, 'mod_assignment', 4),
(193, 'mod/assignment:submit', 'write', 70, 'mod_assignment', 0),
(194, 'mod/assignment:grade', 'write', 70, 'mod_assignment', 4),
(195, 'mod/assignment:exportownsubmission', 'read', 70, 'mod_assignment', 0),
(196, 'mod/book:addinstance', 'write', 50, 'mod_book', 4),
(197, 'mod/book:read', 'read', 70, 'mod_book', 0),
(198, 'mod/book:viewhiddenchapters', 'read', 70, 'mod_book', 0),
(199, 'mod/book:edit', 'write', 70, 'mod_book', 4),
(200, 'mod/chat:addinstance', 'write', 50, 'mod_chat', 4),
(201, 'mod/chat:chat', 'write', 70, 'mod_chat', 16),
(202, 'mod/chat:readlog', 'read', 70, 'mod_chat', 0),
(203, 'mod/chat:deletelog', 'write', 70, 'mod_chat', 0),
(204, 'mod/chat:exportparticipatedsession', 'read', 70, 'mod_chat', 8),
(205, 'mod/chat:exportsession', 'read', 70, 'mod_chat', 8),
(206, 'mod/choice:addinstance', 'write', 50, 'mod_choice', 4),
(207, 'mod/choice:choose', 'write', 70, 'mod_choice', 0),
(208, 'mod/choice:readresponses', 'read', 70, 'mod_choice', 0),
(209, 'mod/choice:deleteresponses', 'write', 70, 'mod_choice', 0),
(210, 'mod/choice:downloadresponses', 'read', 70, 'mod_choice', 0),
(211, 'mod/data:addinstance', 'write', 50, 'mod_data', 4),
(212, 'mod/data:viewentry', 'read', 70, 'mod_data', 0),
(213, 'mod/data:writeentry', 'write', 70, 'mod_data', 16),
(214, 'mod/data:comment', 'write', 70, 'mod_data', 16),
(215, 'mod/data:rate', 'write', 70, 'mod_data', 0),
(216, 'mod/data:viewrating', 'read', 70, 'mod_data', 0),
(217, 'mod/data:viewanyrating', 'read', 70, 'mod_data', 8),
(218, 'mod/data:viewallratings', 'read', 70, 'mod_data', 8),
(219, 'mod/data:approve', 'write', 70, 'mod_data', 16),
(220, 'mod/data:manageentries', 'write', 70, 'mod_data', 16),
(221, 'mod/data:managecomments', 'write', 70, 'mod_data', 16),
(222, 'mod/data:managetemplates', 'write', 70, 'mod_data', 20),
(223, 'mod/data:viewalluserpresets', 'read', 70, 'mod_data', 0),
(224, 'mod/data:manageuserpresets', 'write', 70, 'mod_data', 20),
(225, 'mod/data:exportentry', 'read', 70, 'mod_data', 8),
(226, 'mod/data:exportownentry', 'read', 70, 'mod_data', 0),
(227, 'mod/data:exportallentries', 'read', 70, 'mod_data', 8),
(228, 'mod/data:exportuserinfo', 'read', 70, 'mod_data', 8),
(229, 'mod/feedback:addinstance', 'write', 50, 'mod_feedback', 4),
(230, 'mod/feedback:view', 'read', 70, 'mod_feedback', 0),
(231, 'mod/feedback:complete', 'write', 70, 'mod_feedback', 16),
(232, 'mod/feedback:viewanalysepage', 'read', 70, 'mod_feedback', 8),
(233, 'mod/feedback:deletesubmissions', 'write', 70, 'mod_feedback', 0),
(234, 'mod/feedback:mapcourse', 'write', 70, 'mod_feedback', 0),
(235, 'mod/feedback:edititems', 'write', 70, 'mod_feedback', 20),
(236, 'mod/feedback:createprivatetemplate', 'write', 70, 'mod_feedback', 16),
(237, 'mod/feedback:createpublictemplate', 'write', 70, 'mod_feedback', 16),
(238, 'mod/feedback:deletetemplate', 'write', 70, 'mod_feedback', 0),
(239, 'mod/feedback:viewreports', 'read', 70, 'mod_feedback', 8),
(240, 'mod/feedback:receivemail', 'read', 70, 'mod_feedback', 8),
(241, 'mod/folder:addinstance', 'write', 50, 'mod_folder', 4),
(242, 'mod/folder:view', 'read', 70, 'mod_folder', 0),
(243, 'mod/folder:managefiles', 'write', 70, 'mod_folder', 16),
(244, 'mod/forum:addinstance', 'write', 50, 'mod_forum', 4),
(245, 'mod/forum:viewdiscussion', 'read', 70, 'mod_forum', 0),
(246, 'mod/forum:viewhiddentimedposts', 'read', 70, 'mod_forum', 0),
(247, 'mod/forum:startdiscussion', 'write', 70, 'mod_forum', 16),
(248, 'mod/forum:replypost', 'write', 70, 'mod_forum', 16),
(249, 'mod/forum:addnews', 'write', 70, 'mod_forum', 16),
(250, 'mod/forum:replynews', 'write', 70, 'mod_forum', 16),
(251, 'mod/forum:viewrating', 'read', 70, 'mod_forum', 0),
(252, 'mod/forum:viewanyrating', 'read', 70, 'mod_forum', 8),
(253, 'mod/forum:viewallratings', 'read', 70, 'mod_forum', 8),
(254, 'mod/forum:rate', 'write', 70, 'mod_forum', 0),
(255, 'mod/forum:createattachment', 'write', 70, 'mod_forum', 16),
(256, 'mod/forum:deleteownpost', 'read', 70, 'mod_forum', 0),
(257, 'mod/forum:deleteanypost', 'read', 70, 'mod_forum', 0),
(258, 'mod/forum:splitdiscussions', 'read', 70, 'mod_forum', 0),
(259, 'mod/forum:movediscussions', 'read', 70, 'mod_forum', 0),
(260, 'mod/forum:editanypost', 'write', 70, 'mod_forum', 16),
(261, 'mod/forum:viewqandawithoutposting', 'read', 70, 'mod_forum', 0),
(262, 'mod/forum:viewsubscribers', 'read', 70, 'mod_forum', 0),
(263, 'mod/forum:managesubscriptions', 'read', 70, 'mod_forum', 16),
(264, 'mod/forum:postwithoutthrottling', 'write', 70, 'mod_forum', 16),
(265, 'mod/forum:exportdiscussion', 'read', 70, 'mod_forum', 8),
(266, 'mod/forum:exportpost', 'read', 70, 'mod_forum', 8),
(267, 'mod/forum:exportownpost', 'read', 70, 'mod_forum', 8),
(268, 'mod/forum:addquestion', 'write', 70, 'mod_forum', 16),
(269, 'mod/forum:allowforcesubscribe', 'read', 70, 'mod_forum', 0),
(270, 'mod/glossary:addinstance', 'write', 50, 'mod_glossary', 4),
(271, 'mod/glossary:view', 'read', 70, 'mod_glossary', 0),
(272, 'mod/glossary:write', 'write', 70, 'mod_glossary', 16),
(273, 'mod/glossary:manageentries', 'write', 70, 'mod_glossary', 16),
(274, 'mod/glossary:managecategories', 'write', 70, 'mod_glossary', 16),
(275, 'mod/glossary:comment', 'write', 70, 'mod_glossary', 16),
(276, 'mod/glossary:managecomments', 'write', 70, 'mod_glossary', 16),
(277, 'mod/glossary:import', 'write', 70, 'mod_glossary', 16),
(278, 'mod/glossary:export', 'read', 70, 'mod_glossary', 0),
(279, 'mod/glossary:approve', 'write', 70, 'mod_glossary', 16),
(280, 'mod/glossary:rate', 'write', 70, 'mod_glossary', 0),
(281, 'mod/glossary:viewrating', 'read', 70, 'mod_glossary', 0),
(282, 'mod/glossary:viewanyrating', 'read', 70, 'mod_glossary', 8),
(283, 'mod/glossary:viewallratings', 'read', 70, 'mod_glossary', 8),
(284, 'mod/glossary:exportentry', 'read', 70, 'mod_glossary', 8),
(285, 'mod/glossary:exportownentry', 'read', 70, 'mod_glossary', 0),
(286, 'mod/imscp:view', 'read', 70, 'mod_imscp', 0),
(287, 'mod/imscp:addinstance', 'write', 50, 'mod_imscp', 4),
(288, 'mod/label:addinstance', 'write', 50, 'mod_label', 4),
(289, 'mod/lesson:addinstance', 'write', 50, 'mod_lesson', 4),
(290, 'mod/lesson:edit', 'write', 70, 'mod_lesson', 4),
(291, 'mod/lesson:manage', 'write', 70, 'mod_lesson', 0),
(292, 'mod/lti:view', 'read', 70, 'mod_lti', 0),
(293, 'mod/lti:addinstance', 'write', 50, 'mod_lti', 4),
(294, 'mod/lti:grade', 'write', 70, 'mod_lti', 8),
(295, 'mod/lti:manage', 'write', 70, 'mod_lti', 8),
(296, 'mod/lti:addcoursetool', 'write', 50, 'mod_lti', 0),
(297, 'mod/lti:requesttooladd', 'write', 50, 'mod_lti', 0),
(298, 'mod/page:view', 'read', 70, 'mod_page', 0),
(299, 'mod/page:addinstance', 'write', 50, 'mod_page', 4),
(300, 'mod/quiz:view', 'read', 70, 'mod_quiz', 0),
(301, 'mod/quiz:addinstance', 'write', 50, 'mod_quiz', 4),
(302, 'mod/quiz:attempt', 'write', 70, 'mod_quiz', 16),
(303, 'mod/quiz:reviewmyattempts', 'read', 70, 'mod_quiz', 0),
(304, 'mod/quiz:manage', 'write', 70, 'mod_quiz', 16),
(305, 'mod/quiz:manageoverrides', 'write', 70, 'mod_quiz', 0),
(306, 'mod/quiz:preview', 'write', 70, 'mod_quiz', 0),
(307, 'mod/quiz:grade', 'write', 70, 'mod_quiz', 16),
(308, 'mod/quiz:regrade', 'write', 70, 'mod_quiz', 16),
(309, 'mod/quiz:viewreports', 'read', 70, 'mod_quiz', 8),
(310, 'mod/quiz:deleteattempts', 'write', 70, 'mod_quiz', 32),
(311, 'mod/quiz:ignoretimelimits', 'read', 70, 'mod_quiz', 0),
(312, 'mod/quiz:emailconfirmsubmission', 'read', 70, 'mod_quiz', 0),
(313, 'mod/quiz:emailnotifysubmission', 'read', 70, 'mod_quiz', 0),
(314, 'mod/quiz:emailwarnoverdue', 'read', 70, 'mod_quiz', 0),
(315, 'mod/resource:view', 'read', 70, 'mod_resource', 0),
(316, 'mod/resource:addinstance', 'write', 50, 'mod_resource', 4),
(317, 'mod/scorm:addinstance', 'write', 50, 'mod_scorm', 4),
(318, 'mod/scorm:viewreport', 'read', 70, 'mod_scorm', 0),
(319, 'mod/scorm:skipview', 'write', 70, 'mod_scorm', 0),
(320, 'mod/scorm:savetrack', 'write', 70, 'mod_scorm', 0),
(321, 'mod/scorm:viewscores', 'read', 70, 'mod_scorm', 0),
(322, 'mod/scorm:deleteresponses', 'read', 70, 'mod_scorm', 0),
(323, 'mod/scorm:deleteownresponses', 'write', 70, 'mod_scorm', 0),
(324, 'mod/survey:addinstance', 'write', 50, 'mod_survey', 4),
(325, 'mod/survey:participate', 'read', 70, 'mod_survey', 0),
(326, 'mod/survey:readresponses', 'read', 70, 'mod_survey', 0),
(327, 'mod/survey:download', 'read', 70, 'mod_survey', 0),
(328, 'mod/url:view', 'read', 70, 'mod_url', 0),
(329, 'mod/url:addinstance', 'write', 50, 'mod_url', 4),
(330, 'mod/wiki:addinstance', 'write', 50, 'mod_wiki', 4),
(331, 'mod/wiki:viewpage', 'read', 70, 'mod_wiki', 0),
(332, 'mod/wiki:editpage', 'write', 70, 'mod_wiki', 16),
(333, 'mod/wiki:createpage', 'write', 70, 'mod_wiki', 16),
(334, 'mod/wiki:viewcomment', 'read', 70, 'mod_wiki', 0),
(335, 'mod/wiki:editcomment', 'write', 70, 'mod_wiki', 16),
(336, 'mod/wiki:managecomment', 'write', 70, 'mod_wiki', 0),
(337, 'mod/wiki:managefiles', 'write', 70, 'mod_wiki', 0),
(338, 'mod/wiki:overridelock', 'write', 70, 'mod_wiki', 0),
(339, 'mod/wiki:managewiki', 'write', 70, 'mod_wiki', 0),
(340, 'mod/workshop:view', 'read', 70, 'mod_workshop', 0),
(341, 'mod/workshop:addinstance', 'write', 50, 'mod_workshop', 4),
(342, 'mod/workshop:switchphase', 'write', 70, 'mod_workshop', 0),
(343, 'mod/workshop:editdimensions', 'write', 70, 'mod_workshop', 4),
(344, 'mod/workshop:submit', 'write', 70, 'mod_workshop', 0),
(345, 'mod/workshop:peerassess', 'write', 70, 'mod_workshop', 0),
(346, 'mod/workshop:manageexamples', 'write', 70, 'mod_workshop', 0),
(347, 'mod/workshop:allocate', 'write', 70, 'mod_workshop', 0),
(348, 'mod/workshop:publishsubmissions', 'write', 70, 'mod_workshop', 0),
(349, 'mod/workshop:viewauthornames', 'read', 70, 'mod_workshop', 0),
(350, 'mod/workshop:viewreviewernames', 'read', 70, 'mod_workshop', 0),
(351, 'mod/workshop:viewallsubmissions', 'read', 70, 'mod_workshop', 0),
(352, 'mod/workshop:viewpublishedsubmissions', 'read', 70, 'mod_workshop', 0),
(353, 'mod/workshop:viewauthorpublished', 'read', 70, 'mod_workshop', 0),
(354, 'mod/workshop:viewallassessments', 'read', 70, 'mod_workshop', 0),
(355, 'mod/workshop:overridegrades', 'write', 70, 'mod_workshop', 0),
(356, 'mod/workshop:ignoredeadlines', 'write', 70, 'mod_workshop', 0),
(357, 'enrol/category:synchronised', 'write', 10, 'enrol_category', 0),
(358, 'enrol/cohort:config', 'write', 50, 'enrol_cohort', 0),
(359, 'enrol/cohort:unenrol', 'write', 50, 'enrol_cohort', 0),
(360, 'enrol/database:unenrol', 'write', 50, 'enrol_database', 0),
(361, 'enrol/flatfile:manage', 'write', 50, 'enrol_flatfile', 0),
(362, 'enrol/flatfile:unenrol', 'write', 50, 'enrol_flatfile', 0),
(363, 'enrol/guest:config', 'write', 50, 'enrol_guest', 0),
(364, 'enrol/ldap:manage', 'write', 50, 'enrol_ldap', 0),
(365, 'enrol/manual:config', 'write', 50, 'enrol_manual', 0),
(366, 'enrol/manual:enrol', 'write', 50, 'enrol_manual', 0),
(367, 'enrol/manual:manage', 'write', 50, 'enrol_manual', 0),
(368, 'enrol/manual:unenrol', 'write', 50, 'enrol_manual', 0),
(369, 'enrol/manual:unenrolself', 'write', 50, 'enrol_manual', 0),
(370, 'enrol/meta:config', 'write', 50, 'enrol_meta', 0),
(371, 'enrol/meta:selectaslinked', 'read', 50, 'enrol_meta', 0),
(372, 'enrol/meta:unenrol', 'write', 50, 'enrol_meta', 0),
(373, 'enrol/paypal:config', 'write', 50, 'enrol_paypal', 0),
(374, 'enrol/paypal:manage', 'write', 50, 'enrol_paypal', 0),
(375, 'enrol/paypal:unenrol', 'write', 50, 'enrol_paypal', 0),
(376, 'enrol/paypal:unenrolself', 'write', 50, 'enrol_paypal', 0),
(377, 'enrol/self:config', 'write', 50, 'enrol_self', 0),
(378, 'enrol/self:manage', 'write', 50, 'enrol_self', 0),
(379, 'enrol/self:unenrolself', 'write', 50, 'enrol_self', 0),
(380, 'enrol/self:unenrol', 'write', 50, 'enrol_self', 0),
(381, 'message/airnotifier:managedevice', 'write', 10, 'message_airnotifier', 0),
(382, 'block/activity_modules:addinstance', 'write', 80, 'block_activity_modules', 20),
(383, 'block/admin_bookmarks:myaddinstance', 'write', 10, 'block_admin_bookmarks', 0),
(384, 'block/admin_bookmarks:addinstance', 'write', 80, 'block_admin_bookmarks', 20),
(385, 'block/badges:addinstance', 'read', 80, 'block_badges', 0),
(386, 'block/badges:myaddinstance', 'read', 10, 'block_badges', 8),
(387, 'block/blog_menu:addinstance', 'write', 80, 'block_blog_menu', 20),
(388, 'block/blog_recent:addinstance', 'write', 80, 'block_blog_recent', 20),
(389, 'block/blog_tags:addinstance', 'write', 80, 'block_blog_tags', 20),
(390, 'block/calendar_month:myaddinstance', 'write', 10, 'block_calendar_month', 0),
(391, 'block/calendar_month:addinstance', 'write', 80, 'block_calendar_month', 20),
(392, 'block/calendar_upcoming:myaddinstance', 'write', 10, 'block_calendar_upcoming', 0),
(393, 'block/calendar_upcoming:addinstance', 'write', 80, 'block_calendar_upcoming', 20),
(394, 'block/comments:myaddinstance', 'write', 10, 'block_comments', 0),
(395, 'block/comments:addinstance', 'write', 80, 'block_comments', 20),
(396, 'block/community:myaddinstance', 'write', 10, 'block_community', 0),
(397, 'block/community:addinstance', 'write', 80, 'block_community', 20),
(398, 'block/completionstatus:addinstance', 'write', 80, 'block_completionstatus', 20),
(399, 'block/course_list:myaddinstance', 'write', 10, 'block_course_list', 0),
(400, 'block/course_list:addinstance', 'write', 80, 'block_course_list', 20),
(401, 'block/course_overview:myaddinstance', 'write', 10, 'block_course_overview', 0),
(402, 'block/course_overview:addinstance', 'write', 80, 'block_course_overview', 20),
(403, 'block/course_summary:addinstance', 'write', 80, 'block_course_summary', 20),
(404, 'block/feedback:addinstance', 'write', 80, 'block_feedback', 20),
(405, 'block/glossary_random:myaddinstance', 'write', 10, 'block_glossary_random', 0),
(406, 'block/glossary_random:addinstance', 'write', 80, 'block_glossary_random', 20),
(407, 'block/html:myaddinstance', 'write', 10, 'block_html', 0),
(408, 'block/html:addinstance', 'write', 80, 'block_html', 20),
(409, 'block/login:addinstance', 'write', 80, 'block_login', 20),
(410, 'block/mentees:myaddinstance', 'write', 10, 'block_mentees', 0),
(411, 'block/mentees:addinstance', 'write', 80, 'block_mentees', 20),
(412, 'block/messages:myaddinstance', 'write', 10, 'block_messages', 0),
(413, 'block/messages:addinstance', 'write', 80, 'block_messages', 20),
(414, 'block/mnet_hosts:myaddinstance', 'write', 10, 'block_mnet_hosts', 0),
(415, 'block/mnet_hosts:addinstance', 'write', 80, 'block_mnet_hosts', 20),
(416, 'block/myprofile:myaddinstance', 'write', 10, 'block_myprofile', 0),
(417, 'block/myprofile:addinstance', 'write', 80, 'block_myprofile', 20),
(418, 'block/navigation:myaddinstance', 'write', 10, 'block_navigation', 0),
(419, 'block/navigation:addinstance', 'write', 80, 'block_navigation', 20),
(420, 'block/news_items:myaddinstance', 'write', 10, 'block_news_items', 0),
(421, 'block/news_items:addinstance', 'write', 80, 'block_news_items', 20),
(422, 'block/online_users:myaddinstance', 'write', 10, 'block_online_users', 0),
(423, 'block/online_users:addinstance', 'write', 80, 'block_online_users', 20),
(424, 'block/online_users:viewlist', 'read', 80, 'block_online_users', 0),
(425, 'block/participants:addinstance', 'write', 80, 'block_participants', 20),
(426, 'block/private_files:myaddinstance', 'write', 10, 'block_private_files', 0),
(427, 'block/private_files:addinstance', 'write', 80, 'block_private_files', 20),
(428, 'block/quiz_results:addinstance', 'write', 80, 'block_quiz_results', 20),
(429, 'block/recent_activity:addinstance', 'write', 80, 'block_recent_activity', 20),
(430, 'block/recent_activity:viewaddupdatemodule', 'read', 50, 'block_recent_activity', 0),
(431, 'block/recent_activity:viewdeletemodule', 'read', 50, 'block_recent_activity', 0),
(432, 'block/rss_client:myaddinstance', 'write', 10, 'block_rss_client', 0),
(433, 'block/rss_client:addinstance', 'write', 80, 'block_rss_client', 20),
(434, 'block/rss_client:manageownfeeds', 'write', 80, 'block_rss_client', 0),
(435, 'block/rss_client:manageanyfeeds', 'write', 80, 'block_rss_client', 16),
(436, 'block/search_forums:addinstance', 'write', 80, 'block_search_forums', 20),
(437, 'block/section_links:addinstance', 'write', 80, 'block_section_links', 20),
(438, 'block/selfcompletion:addinstance', 'write', 80, 'block_selfcompletion', 20),
(439, 'block/settings:myaddinstance', 'write', 10, 'block_settings', 0),
(440, 'block/settings:addinstance', 'write', 80, 'block_settings', 20),
(441, 'block/site_main_menu:addinstance', 'write', 80, 'block_site_main_menu', 20),
(442, 'block/social_activities:addinstance', 'write', 80, 'block_social_activities', 20),
(443, 'block/tag_flickr:addinstance', 'write', 80, 'block_tag_flickr', 20),
(444, 'block/tag_youtube:addinstance', 'write', 80, 'block_tag_youtube', 20),
(445, 'block/tags:myaddinstance', 'write', 10, 'block_tags', 0),
(446, 'block/tags:addinstance', 'write', 80, 'block_tags', 20),
(447, 'report/completion:view', 'read', 50, 'report_completion', 8),
(448, 'report/courseoverview:view', 'read', 10, 'report_courseoverview', 8),
(449, 'report/log:view', 'read', 50, 'report_log', 8),
(450, 'report/log:viewtoday', 'read', 50, 'report_log', 8),
(451, 'report/loglive:view', 'read', 50, 'report_loglive', 8),
(452, 'report/outline:view', 'read', 50, 'report_outline', 8),
(453, 'report/participation:view', 'read', 50, 'report_participation', 8),
(454, 'report/performance:view', 'read', 10, 'report_performance', 2),
(455, 'report/progress:view', 'read', 50, 'report_progress', 8),
(456, 'report/questioninstances:view', 'read', 10, 'report_questioninstances', 0),
(457, 'report/security:view', 'read', 10, 'report_security', 2),
(458, 'report/stats:view', 'read', 50, 'report_stats', 8),
(459, 'gradeexport/ods:view', 'read', 50, 'gradeexport_ods', 8),
(460, 'gradeexport/ods:publish', 'read', 50, 'gradeexport_ods', 8),
(461, 'gradeexport/txt:view', 'read', 50, 'gradeexport_txt', 8),
(462, 'gradeexport/txt:publish', 'read', 50, 'gradeexport_txt', 8),
(463, 'gradeexport/xls:view', 'read', 50, 'gradeexport_xls', 8),
(464, 'gradeexport/xls:publish', 'read', 50, 'gradeexport_xls', 8),
(465, 'gradeexport/xml:view', 'read', 50, 'gradeexport_xml', 8),
(466, 'gradeexport/xml:publish', 'read', 50, 'gradeexport_xml', 8),
(467, 'gradeimport/csv:view', 'write', 50, 'gradeimport_csv', 0),
(468, 'gradeimport/xml:view', 'write', 50, 'gradeimport_xml', 0),
(469, 'gradeimport/xml:publish', 'write', 50, 'gradeimport_xml', 0),
(470, 'gradereport/grader:view', 'read', 50, 'gradereport_grader', 8),
(471, 'gradereport/outcomes:view', 'read', 50, 'gradereport_outcomes', 8),
(472, 'gradereport/overview:view', 'read', 50, 'gradereport_overview', 8),
(473, 'gradereport/user:view', 'read', 50, 'gradereport_user', 8),
(474, 'webservice/amf:use', 'read', 50, 'webservice_amf', 62),
(475, 'webservice/rest:use', 'read', 50, 'webservice_rest', 62),
(476, 'webservice/soap:use', 'read', 50, 'webservice_soap', 62),
(477, 'webservice/xmlrpc:use', 'read', 50, 'webservice_xmlrpc', 62),
(478, 'repository/alfresco:view', 'read', 70, 'repository_alfresco', 0),
(479, 'repository/areafiles:view', 'read', 70, 'repository_areafiles', 0),
(480, 'repository/boxnet:view', 'read', 70, 'repository_boxnet', 0),
(481, 'repository/coursefiles:view', 'read', 70, 'repository_coursefiles', 0),
(482, 'repository/dropbox:view', 'read', 70, 'repository_dropbox', 0),
(483, 'repository/equella:view', 'read', 70, 'repository_equella', 0),
(484, 'repository/filesystem:view', 'read', 70, 'repository_filesystem', 0),
(485, 'repository/flickr:view', 'read', 70, 'repository_flickr', 0),
(486, 'repository/flickr_public:view', 'read', 70, 'repository_flickr_public', 0),
(487, 'repository/googledocs:view', 'read', 70, 'repository_googledocs', 0),
(488, 'repository/local:view', 'read', 70, 'repository_local', 0),
(489, 'repository/merlot:view', 'read', 70, 'repository_merlot', 0),
(490, 'repository/picasa:view', 'read', 70, 'repository_picasa', 0),
(491, 'repository/recent:view', 'read', 70, 'repository_recent', 0),
(492, 'repository/s3:view', 'read', 70, 'repository_s3', 0),
(493, 'repository/skydrive:view', 'read', 70, 'repository_skydrive', 0),
(494, 'repository/upload:view', 'read', 70, 'repository_upload', 0),
(495, 'repository/url:view', 'read', 70, 'repository_url', 0),
(496, 'repository/user:view', 'read', 70, 'repository_user', 0),
(497, 'repository/webdav:view', 'read', 70, 'repository_webdav', 0),
(498, 'repository/wikimedia:view', 'read', 70, 'repository_wikimedia', 0),
(499, 'repository/youtube:view', 'read', 70, 'repository_youtube', 0),
(500, 'tool/customlang:view', 'read', 10, 'tool_customlang', 2),
(501, 'tool/customlang:edit', 'write', 10, 'tool_customlang', 6),
(502, 'tool/uploaduser:uploaduserpictures', 'write', 10, 'tool_uploaduser', 16),
(503, 'booktool/exportimscp:export', 'read', 70, 'booktool_exportimscp', 0),
(504, 'booktool/importhtml:import', 'write', 70, 'booktool_importhtml', 4),
(505, 'booktool/print:print', 'read', 70, 'booktool_print', 0),
(506, 'quiz/grading:viewstudentnames', 'read', 70, 'quiz_grading', 0),
(507, 'quiz/grading:viewidnumber', 'read', 70, 'quiz_grading', 0),
(508, 'quiz/statistics:view', 'read', 70, 'quiz_statistics', 0),
(509, 'block/quickmail:myaddinstance', 'write', 10, 'block_quickmail', 16),
(510, 'block/quickmail:addinstance', 'write', 80, 'block_quickmail', 16),
(511, 'block/quickmail:cansend', 'write', 50, 'block_quickmail', 0),
(512, 'block/quickmail:allowalternate', 'write', 50, 'block_quickmail', 0),
(513, 'block/quickmail:canconfig', 'write', 50, 'block_quickmail', 0),
(514, 'block/quickmail:canimpersonate', 'write', 50, 'block_quickmail', 0),
(515, 'block/quickmail:candelete', 'write', 50, 'block_quickmail', 0);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_chat`
--

CREATE TABLE IF NOT EXISTS `mdl_chat` (
`id` bigint(10) NOT NULL,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `intro` longtext NOT NULL,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `keepdays` bigint(11) NOT NULL DEFAULT '0',
  `studentlogs` smallint(4) NOT NULL DEFAULT '0',
  `chattime` bigint(10) NOT NULL DEFAULT '0',
  `schedule` smallint(4) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Each of these is a chat room';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_chat_messages`
--

CREATE TABLE IF NOT EXISTS `mdl_chat_messages` (
`id` bigint(10) NOT NULL,
  `chatid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `groupid` bigint(10) NOT NULL DEFAULT '0',
  `system` tinyint(1) NOT NULL DEFAULT '0',
  `message` longtext NOT NULL,
  `timestamp` bigint(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores all the actual chat messages';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_chat_messages_current`
--

CREATE TABLE IF NOT EXISTS `mdl_chat_messages_current` (
`id` bigint(10) NOT NULL,
  `chatid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `groupid` bigint(10) NOT NULL DEFAULT '0',
  `system` tinyint(1) NOT NULL DEFAULT '0',
  `message` longtext NOT NULL,
  `timestamp` bigint(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores current session';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_chat_users`
--

CREATE TABLE IF NOT EXISTS `mdl_chat_users` (
`id` bigint(10) NOT NULL,
  `chatid` bigint(11) NOT NULL DEFAULT '0',
  `userid` bigint(11) NOT NULL DEFAULT '0',
  `groupid` bigint(11) NOT NULL DEFAULT '0',
  `version` varchar(16) NOT NULL DEFAULT '',
  `ip` varchar(45) NOT NULL DEFAULT '',
  `firstping` bigint(10) NOT NULL DEFAULT '0',
  `lastping` bigint(10) NOT NULL DEFAULT '0',
  `lastmessageping` bigint(10) NOT NULL DEFAULT '0',
  `sid` varchar(32) NOT NULL DEFAULT '',
  `course` bigint(10) NOT NULL DEFAULT '0',
  `lang` varchar(30) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Keeps track of which users are in which chat rooms';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_choice`
--

CREATE TABLE IF NOT EXISTS `mdl_choice` (
`id` bigint(10) NOT NULL,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `intro` longtext NOT NULL,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `publish` tinyint(2) NOT NULL DEFAULT '0',
  `showresults` tinyint(2) NOT NULL DEFAULT '0',
  `display` smallint(4) NOT NULL DEFAULT '0',
  `allowupdate` tinyint(2) NOT NULL DEFAULT '0',
  `showunanswered` tinyint(2) NOT NULL DEFAULT '0',
  `limitanswers` tinyint(2) NOT NULL DEFAULT '0',
  `timeopen` bigint(10) NOT NULL DEFAULT '0',
  `timeclose` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `completionsubmit` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Available choices are stored here';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_choice_answers`
--

CREATE TABLE IF NOT EXISTS `mdl_choice_answers` (
`id` bigint(10) NOT NULL,
  `choiceid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `optionid` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='choices performed by users';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_choice_options`
--

CREATE TABLE IF NOT EXISTS `mdl_choice_options` (
`id` bigint(10) NOT NULL,
  `choiceid` bigint(10) NOT NULL DEFAULT '0',
  `text` longtext,
  `maxanswers` bigint(10) DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='available options to choice';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_cohort`
--

CREATE TABLE IF NOT EXISTS `mdl_cohort` (
`id` bigint(10) NOT NULL,
  `contextid` bigint(10) NOT NULL,
  `name` varchar(254) NOT NULL DEFAULT '',
  `idnumber` varchar(100) DEFAULT NULL,
  `description` longtext,
  `descriptionformat` tinyint(2) NOT NULL,
  `component` varchar(100) NOT NULL DEFAULT '',
  `timecreated` bigint(10) NOT NULL,
  `timemodified` bigint(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Each record represents one cohort (aka site-wide group).';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_cohort_members`
--

CREATE TABLE IF NOT EXISTS `mdl_cohort_members` (
`id` bigint(10) NOT NULL,
  `cohortid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `timeadded` bigint(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Link a user to a cohort.';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_comments`
--

CREATE TABLE IF NOT EXISTS `mdl_comments` (
`id` bigint(10) NOT NULL,
  `contextid` bigint(10) NOT NULL,
  `commentarea` varchar(255) NOT NULL DEFAULT '',
  `itemid` bigint(10) NOT NULL,
  `content` longtext NOT NULL,
  `format` tinyint(2) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL,
  `timecreated` bigint(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='moodle comments module';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_config`
--

CREATE TABLE IF NOT EXISTS `mdl_config` (
`id` bigint(10) NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `value` longtext NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=456 DEFAULT CHARSET=utf8 COMMENT='Moodle configuration variables';

--
-- Dumping data for table `mdl_config`
--

INSERT INTO `mdl_config` (`id`, `name`, `value`) VALUES
(2, 'rolesactive', '1'),
(3, 'auth', 'email'),
(4, 'auth_pop3mailbox', 'INBOX'),
(5, 'enrol_plugins_enabled', 'manual,guest,self,cohort'),
(6, 'theme', 'clean'),
(7, 'filter_multilang_converted', '1'),
(8, 'siteidentifier', 'X2BgKIQyUj7EWa69cyjo0dmjQSnwmYrblocalhost'),
(9, 'backup_version', '2008111700'),
(10, 'backup_release', '2.0 dev'),
(11, 'mnet_dispatcher_mode', 'off'),
(12, 'sessiontimeout', '7200'),
(13, 'stringfilters', ''),
(14, 'filterall', '0'),
(15, 'texteditors', 'atto,tinymce,textarea'),
(16, 'mnet_localhost_id', '1'),
(17, 'mnet_all_hosts_id', '2'),
(18, 'siteguest', '1'),
(19, 'siteadmins', '2'),
(20, 'themerev', '1418102365'),
(21, 'jsrev', '1417664311'),
(22, 'gdversion', '2'),
(23, 'licenses', 'unknown,allrightsreserved,public,cc,cc-nd,cc-nc-nd,cc-nc,cc-nc-sa,cc-sa'),
(24, 'version', '2014051202'),
(25, 'enableoutcomes', '0'),
(26, 'usecomments', '1'),
(27, 'usetags', '1'),
(28, 'enablenotes', '1'),
(29, 'enableportfolios', '0'),
(30, 'enablewebservices', '0'),
(31, 'messaging', '1'),
(32, 'messaginghidereadnotifications', '0'),
(33, 'messagingdeletereadnotificationsdelay', '604800'),
(34, 'messagingallowemailoverride', '0'),
(35, 'enablestats', '0'),
(36, 'enablerssfeeds', '0'),
(37, 'enableblogs', '1'),
(38, 'enablecompletion', '0'),
(39, 'completiondefault', '1'),
(40, 'enableavailability', '0'),
(41, 'enableplagiarism', '0'),
(42, 'enablebadges', '0'),
(43, 'autologinguests', '0'),
(44, 'hiddenuserfields', ''),
(45, 'showuseridentity', 'email'),
(46, 'fullnamedisplay', 'language'),
(47, 'maxusersperpage', '100'),
(48, 'enablegravatar', '0'),
(49, 'gravatardefaulturl', 'mm'),
(50, 'enablecourserequests', '0'),
(51, 'defaultrequestcategory', '1'),
(52, 'requestcategoryselection', '0'),
(53, 'courserequestnotify', ''),
(54, 'grade_profilereport', 'user'),
(55, 'grade_aggregationposition', '1'),
(56, 'grade_includescalesinaggregation', '1'),
(57, 'grade_hiddenasdate', '0'),
(58, 'gradepublishing', '0'),
(59, 'grade_export_displaytype', '1'),
(60, 'grade_export_decimalpoints', '2'),
(61, 'grade_navmethod', '0'),
(62, 'grade_export_userprofilefields', 'firstname,lastname,idnumber,institution,department,email'),
(63, 'grade_export_customprofilefields', ''),
(64, 'recovergradesdefault', '0'),
(65, 'gradeexport', ''),
(66, 'unlimitedgrades', '0'),
(67, 'gradepointmax', '100'),
(68, 'gradepointdefault', '100'),
(69, 'grade_hideforcedsettings', '1'),
(70, 'grade_aggregation', '11'),
(71, 'grade_aggregation_flag', '0'),
(72, 'grade_aggregations_visible', '0,10,11,12,2,4,6,8,13'),
(73, 'grade_aggregateonlygraded', '1'),
(74, 'grade_aggregateonlygraded_flag', '2'),
(75, 'grade_aggregateoutcomes', '0'),
(76, 'grade_aggregateoutcomes_flag', '2'),
(77, 'grade_aggregatesubcats', '0'),
(78, 'grade_aggregatesubcats_flag', '2'),
(79, 'grade_keephigh', '0'),
(80, 'grade_keephigh_flag', '3'),
(81, 'grade_droplow', '0'),
(82, 'grade_droplow_flag', '2'),
(83, 'grade_displaytype', '1'),
(84, 'grade_decimalpoints', '2'),
(85, 'grade_item_advanced', 'iteminfo,idnumber,gradepass,plusfactor,multfactor,display,decimals,hiddenuntil,locktime'),
(86, 'grade_report_studentsperpage', '100'),
(87, 'grade_report_showonlyactiveenrol', '1'),
(88, 'grade_report_quickgrading', '1'),
(89, 'grade_report_showquickfeedback', '0'),
(90, 'grade_report_fixedstudents', '0'),
(91, 'grade_report_meanselection', '1'),
(92, 'grade_report_enableajax', '0'),
(93, 'grade_report_showcalculations', '0'),
(94, 'grade_report_showeyecons', '0'),
(95, 'grade_report_showaverages', '1'),
(96, 'grade_report_showlocks', '0'),
(97, 'grade_report_showranges', '0'),
(98, 'grade_report_showanalysisicon', '1'),
(99, 'grade_report_showuserimage', '1'),
(100, 'grade_report_showactivityicons', '1'),
(101, 'grade_report_shownumberofgrades', '0'),
(102, 'grade_report_averagesdisplaytype', 'inherit'),
(103, 'grade_report_rangesdisplaytype', 'inherit'),
(104, 'grade_report_averagesdecimalpoints', 'inherit'),
(105, 'grade_report_rangesdecimalpoints', 'inherit'),
(106, 'grade_report_overview_showrank', '0'),
(107, 'grade_report_overview_showtotalsifcontainhidden', '0'),
(108, 'grade_report_user_showrank', '0'),
(109, 'grade_report_user_showpercentage', '1'),
(110, 'grade_report_user_showgrade', '1'),
(111, 'grade_report_user_showfeedback', '1'),
(112, 'grade_report_user_showrange', '1'),
(113, 'grade_report_user_showweight', '0'),
(114, 'grade_report_user_showaverage', '0'),
(115, 'grade_report_user_showlettergrade', '0'),
(116, 'grade_report_user_rangedecimals', '0'),
(117, 'grade_report_user_showhiddenitems', '1'),
(118, 'grade_report_user_showtotalsifcontainhidden', '0'),
(119, 'badges_defaultissuername', ''),
(120, 'badges_defaultissuercontact', ''),
(121, 'badges_badgesalt', 'badges1415060944'),
(122, 'badges_allowexternalbackpack', '1'),
(123, 'badges_allowcoursebadges', '1'),
(124, 'timezone', '99'),
(125, 'forcetimezone', '99'),
(126, 'country', '0'),
(127, 'defaultcity', ''),
(128, 'geoipfile', '/Applications/MAMP/moodledata/geoip/GeoLiteCity.dat'),
(129, 'googlemapkey3', ''),
(130, 'allcountrycodes', ''),
(131, 'autolang', '0'),
(132, 'lang', 'es'),
(133, 'langmenu', '1'),
(134, 'langlist', ''),
(135, 'langrev', '1417664311'),
(136, 'langcache', '1'),
(137, 'langstringcache', '1'),
(138, 'locale', ''),
(139, 'latinexcelexport', '0'),
(141, 'authloginviaemail', '0'),
(142, 'authpreventaccountcreation', '0'),
(143, 'loginpageautofocus', '0'),
(144, 'guestloginbutton', '0'),
(145, 'alternateloginurl', ''),
(146, 'forgottenpasswordurl', ''),
(147, 'auth_instructions', ''),
(148, 'allowemailaddresses', ''),
(149, 'denyemailaddresses', ''),
(150, 'verifychangedemail', '1'),
(151, 'recaptchapublickey', ''),
(152, 'recaptchaprivatekey', ''),
(153, 'filteruploadedfiles', '0'),
(154, 'filtermatchoneperpage', '0'),
(155, 'filtermatchonepertext', '0'),
(156, 'sitedefaultlicense', 'allrightsreserved'),
(157, 'portfolio_moderate_filesize_threshold', '1048576'),
(158, 'portfolio_high_filesize_threshold', '5242880'),
(159, 'portfolio_moderate_db_threshold', '20'),
(160, 'portfolio_high_db_threshold', '50'),
(161, 'repositorycacheexpire', '120'),
(162, 'repositorygetfiletimeout', '30'),
(163, 'repositorysyncfiletimeout', '1'),
(164, 'repositorysyncimagetimeout', '3'),
(165, 'repositoryallowexternallinks', '1'),
(166, 'legacyfilesinnewcourses', '0'),
(167, 'legacyfilesaddallowed', '1'),
(168, 'mobilecssurl', ''),
(169, 'enablewsdocumentation', '0'),
(170, 'allowbeforeblock', '0'),
(171, 'allowedip', ''),
(172, 'blockedip', ''),
(173, 'protectusernames', '1'),
(174, 'forcelogin', '1'),
(175, 'forceloginforprofiles', '1'),
(176, 'forceloginforprofileimage', '0'),
(177, 'opentogoogle', '0'),
(178, 'maxbytes', '0'),
(179, 'userquota', '104857600'),
(180, 'allowobjectembed', '0'),
(181, 'enabletrusttext', '0'),
(182, 'maxeditingtime', '1800'),
(183, 'extendedusernamechars', '0'),
(184, 'sitepolicy', ''),
(185, 'sitepolicyguest', ''),
(186, 'keeptagnamecase', '1'),
(187, 'profilesforenrolledusersonly', '1'),
(188, 'cronclionly', '0'),
(189, 'cronremotepassword', ''),
(190, 'lockoutthreshold', '0'),
(191, 'lockoutwindow', '1800'),
(192, 'lockoutduration', '1800'),
(193, 'passwordpolicy', '1'),
(194, 'minpasswordlength', '8'),
(195, 'minpassworddigits', '1'),
(196, 'minpasswordlower', '1'),
(197, 'minpasswordupper', '1'),
(198, 'minpasswordnonalphanum', '1'),
(199, 'maxconsecutiveidentchars', '0'),
(200, 'pwresettime', '1800'),
(201, 'groupenrolmentkeypolicy', '1'),
(202, 'disableuserimages', '0'),
(203, 'emailchangeconfirmation', '1'),
(204, 'rememberusername', '2'),
(205, 'strictformsrequired', '0'),
(206, 'loginhttps', '0'),
(207, 'cookiesecure', '0'),
(208, 'cookiehttponly', '0'),
(209, 'allowframembedding', '0'),
(210, 'loginpasswordautocomplete', '0'),
(211, 'displayloginfailures', '0'),
(212, 'notifyloginfailures', ''),
(213, 'notifyloginthreshold', '10'),
(214, 'runclamonupload', '0'),
(215, 'pathtoclam', ''),
(216, 'quarantinedir', ''),
(217, 'clamfailureonupload', 'donothing'),
(218, 'themelist', ''),
(219, 'themedesignermode', '0'),
(220, 'allowuserthemes', '0'),
(221, 'allowcoursethemes', '0'),
(222, 'allowcategorythemes', '0'),
(223, 'allowthemechangeonurl', '0'),
(224, 'allowuserblockhiding', '1'),
(225, 'allowblockstodock', '1'),
(226, 'custommenuitems', ''),
(227, 'enabledevicedetection', '1'),
(228, 'devicedetectregex', '[]'),
(229, 'calendartype', 'gregorian'),
(230, 'calendar_adminseesall', '0'),
(231, 'calendar_site_timeformat', '0'),
(232, 'calendar_startwday', '0'),
(233, 'calendar_weekend', '65'),
(234, 'calendar_lookahead', '21'),
(235, 'calendar_maxevents', '10'),
(236, 'enablecalendarexport', '1'),
(237, 'calendar_customexport', '1'),
(238, 'calendar_exportlookahead', '365'),
(239, 'calendar_exportlookback', '5'),
(240, 'calendar_exportsalt', 'xQ4zBHrELIrwEfqui4OFIrX7CP3wpsR2UPaz9Mlt8XEzo7XkU4nPrLP9e7lJ'),
(241, 'calendar_showicalsource', '1'),
(242, 'useblogassociations', '1'),
(243, 'bloglevel', '1'),
(244, 'useexternalblogs', '0'),
(245, 'externalblogcrontime', '86400'),
(246, 'maxexternalblogsperuser', '1'),
(247, 'blogusecomments', '1'),
(248, 'blogshowcommentscount', '1'),
(249, 'defaulthomepage', '0'),
(250, 'allowguestmymoodle', '1'),
(251, 'navshowfullcoursenames', '0'),
(252, 'navshowcategories', '1'),
(253, 'navshowmycoursecategories', '0'),
(254, 'navshowallcourses', '0'),
(255, 'navsortmycoursessort', 'sortorder'),
(256, 'navcourselimit', '20'),
(257, 'usesitenameforsitepages', '0'),
(258, 'linkadmincategories', '0'),
(259, 'navshowfrontpagemods', '1'),
(260, 'navadduserpostslinks', '1'),
(261, 'formatstringstriptags', '1'),
(262, 'emoticons', '[{"text":":-)","imagename":"s\\/smiley","imagecomponent":"core","altidentifier":"smiley","altcomponent":"core_pix"},{"text":":)","imagename":"s\\/smiley","imagecomponent":"core","altidentifier":"smiley","altcomponent":"core_pix"},{"text":":-D","imagename":"s\\/biggrin","imagecomponent":"core","altidentifier":"biggrin","altcomponent":"core_pix"},{"text":";-)","imagename":"s\\/wink","imagecomponent":"core","altidentifier":"wink","altcomponent":"core_pix"},{"text":":-\\/","imagename":"s\\/mixed","imagecomponent":"core","altidentifier":"mixed","altcomponent":"core_pix"},{"text":"V-.","imagename":"s\\/thoughtful","imagecomponent":"core","altidentifier":"thoughtful","altcomponent":"core_pix"},{"text":":-P","imagename":"s\\/tongueout","imagecomponent":"core","altidentifier":"tongueout","altcomponent":"core_pix"},{"text":":-p","imagename":"s\\/tongueout","imagecomponent":"core","altidentifier":"tongueout","altcomponent":"core_pix"},{"text":"B-)","imagename":"s\\/cool","imagecomponent":"core","altidentifier":"cool","altcomponent":"core_pix"},{"text":"^-)","imagename":"s\\/approve","imagecomponent":"core","altidentifier":"approve","altcomponent":"core_pix"},{"text":"8-)","imagename":"s\\/wideeyes","imagecomponent":"core","altidentifier":"wideeyes","altcomponent":"core_pix"},{"text":":o)","imagename":"s\\/clown","imagecomponent":"core","altidentifier":"clown","altcomponent":"core_pix"},{"text":":-(","imagename":"s\\/sad","imagecomponent":"core","altidentifier":"sad","altcomponent":"core_pix"},{"text":":(","imagename":"s\\/sad","imagecomponent":"core","altidentifier":"sad","altcomponent":"core_pix"},{"text":"8-.","imagename":"s\\/shy","imagecomponent":"core","altidentifier":"shy","altcomponent":"core_pix"},{"text":":-I","imagename":"s\\/blush","imagecomponent":"core","altidentifier":"blush","altcomponent":"core_pix"},{"text":":-X","imagename":"s\\/kiss","imagecomponent":"core","altidentifier":"kiss","altcomponent":"core_pix"},{"text":"8-o","imagename":"s\\/surprise","imagecomponent":"core","altidentifier":"surprise","altcomponent":"core_pix"},{"text":"P-|","imagename":"s\\/blackeye","imagecomponent":"core","altidentifier":"blackeye","altcomponent":"core_pix"},{"text":"8-[","imagename":"s\\/angry","imagecomponent":"core","altidentifier":"angry","altcomponent":"core_pix"},{"text":"(grr)","imagename":"s\\/angry","imagecomponent":"core","altidentifier":"angry","altcomponent":"core_pix"},{"text":"xx-P","imagename":"s\\/dead","imagecomponent":"core","altidentifier":"dead","altcomponent":"core_pix"},{"text":"|-.","imagename":"s\\/sleepy","imagecomponent":"core","altidentifier":"sleepy","altcomponent":"core_pix"},{"text":"}-]","imagename":"s\\/evil","imagecomponent":"core","altidentifier":"evil","altcomponent":"core_pix"},{"text":"(h)","imagename":"s\\/heart","imagecomponent":"core","altidentifier":"heart","altcomponent":"core_pix"},{"text":"(heart)","imagename":"s\\/heart","imagecomponent":"core","altidentifier":"heart","altcomponent":"core_pix"},{"text":"(y)","imagename":"s\\/yes","imagecomponent":"core","altidentifier":"yes","altcomponent":"core"},{"text":"(n)","imagename":"s\\/no","imagecomponent":"core","altidentifier":"no","altcomponent":"core"},{"text":"(martin)","imagename":"s\\/martin","imagecomponent":"core","altidentifier":"martin","altcomponent":"core_pix"},{"text":"( )","imagename":"s\\/egg","imagecomponent":"core","altidentifier":"egg","altcomponent":"core_pix"}]'),
(263, 'core_media_enable_youtube', '1'),
(264, 'core_media_enable_vimeo', '0'),
(265, 'core_media_enable_mp3', '1'),
(266, 'core_media_enable_flv', '1'),
(267, 'core_media_enable_swf', '1'),
(268, 'core_media_enable_html5audio', '1'),
(269, 'core_media_enable_html5video', '1'),
(270, 'core_media_enable_qt', '1'),
(271, 'core_media_enable_wmp', '1'),
(272, 'core_media_enable_rm', '1'),
(273, 'docroot', 'http://docs.moodle.org'),
(274, 'doclang', ''),
(275, 'doctonewwindow', '0'),
(276, 'courselistshortnames', '0'),
(277, 'coursesperpage', '20'),
(278, 'courseswithsummarieslimit', '10'),
(279, 'courseoverviewfileslimit', '1'),
(280, 'courseoverviewfilesext', '.jpg,.gif,.png'),
(281, 'useexternalyui', '0'),
(282, 'yuicomboloading', '1'),
(283, 'cachejs', '1'),
(284, 'modchooserdefault', '1'),
(285, 'modeditingmenu', '1'),
(286, 'blockeditingmenu', '1'),
(287, 'additionalhtmlhead', ''),
(288, 'additionalhtmltopofbody', ''),
(289, 'additionalhtmlfooter', ''),
(290, 'pathtodu', ''),
(291, 'aspellpath', ''),
(292, 'pathtodot', ''),
(293, 'supportpage', ''),
(294, 'dbsessions', '0'),
(295, 'sessioncookie', ''),
(296, 'sessioncookiepath', ''),
(297, 'sessioncookiedomain', ''),
(298, 'statsfirstrun', 'none'),
(299, 'statsmaxruntime', '0'),
(300, 'statsruntimedays', '31'),
(301, 'statsruntimestarthour', '0'),
(302, 'statsruntimestartminute', '0'),
(303, 'statsuserthreshold', '0'),
(304, 'slasharguments', '1'),
(305, 'getremoteaddrconf', '0'),
(306, 'proxyhost', ''),
(307, 'proxyport', '0'),
(308, 'proxytype', 'HTTP'),
(309, 'proxyuser', ''),
(310, 'proxypassword', ''),
(311, 'proxybypass', 'localhost, 127.0.0.1'),
(312, 'maintenance_enabled', '0'),
(313, 'maintenance_message', ''),
(314, 'deleteunconfirmed', '168'),
(315, 'deleteincompleteusers', '0'),
(316, 'disablegradehistory', '0'),
(317, 'gradehistorylifetime', '0'),
(318, 'extramemorylimit', '512M'),
(319, 'maxtimelimit', '0'),
(320, 'curlcache', '120'),
(321, 'curltimeoutkbitrate', '56'),
(322, 'updateautocheck', '1'),
(323, 'updateautodeploy', '0'),
(324, 'updateminmaturity', '200'),
(325, 'updatenotifybuilds', '0'),
(326, 'enablesafebrowserintegration', '0'),
(327, 'enablegroupmembersonly', '0'),
(328, 'dndallowtextandlinks', '0'),
(329, 'enablecssoptimiser', '0'),
(330, 'enabletgzbackups', '0'),
(331, 'debug', '0'),
(332, 'debugdisplay', '0'),
(333, 'debugsmtp', '0'),
(334, 'perfdebug', '7'),
(335, 'debugstringids', '0'),
(336, 'debugvalidators', '0'),
(337, 'debugpageinfo', '0'),
(338, 'profilingenabled', '0'),
(339, 'profilingincluded', ''),
(340, 'profilingexcluded', ''),
(341, 'profilingautofrec', '0'),
(342, 'profilingallowme', '0'),
(343, 'profilingallowall', '0'),
(344, 'profilinglifetime', '1440'),
(345, 'profilingimportprefix', '(I)'),
(346, 'release', '2.7.2 (Build: 20140908)'),
(347, 'branch', '27'),
(348, 'localcachedirpurged', '1417664311'),
(349, 'scheduledtaskreset', '1417664311'),
(350, 'allversionshash', '4c0ef311b33b47618807ee9846f9ed6cb37df593'),
(352, 'notloggedinroleid', '6'),
(353, 'guestroleid', '6'),
(354, 'defaultuserroleid', '7'),
(355, 'creatornewroleid', '3'),
(356, 'restorernewroleid', '3'),
(357, 'gradebookroles', '5'),
(358, 'chat_method', 'ajax'),
(359, 'chat_refresh_userlist', '10'),
(360, 'chat_old_ping', '35'),
(361, 'chat_refresh_room', '5'),
(362, 'chat_normal_updatemode', 'jsupdate'),
(363, 'chat_serverhost', 'localhost'),
(364, 'chat_serverip', '127.0.0.1'),
(365, 'chat_serverport', '9111'),
(366, 'chat_servermax', '100'),
(367, 'data_enablerssfeeds', '0'),
(368, 'feedback_allowfullanonymous', '0'),
(369, 'forum_displaymode', '3'),
(370, 'forum_replytouser', '1'),
(371, 'forum_shortpost', '300'),
(372, 'forum_longpost', '600'),
(373, 'forum_manydiscussions', '100'),
(374, 'forum_maxbytes', '512000'),
(375, 'forum_maxattachments', '9'),
(376, 'forum_trackingtype', '1'),
(377, 'forum_trackreadposts', '1'),
(378, 'forum_allowforcedreadtracking', '0'),
(379, 'forum_oldpostdays', '14'),
(380, 'forum_usermarksread', '0'),
(381, 'forum_cleanreadtime', '2'),
(382, 'digestmailtime', '17'),
(383, 'forum_enablerssfeeds', '0'),
(384, 'forum_enabletimedposts', '0'),
(385, 'glossary_entbypage', '10'),
(386, 'glossary_dupentries', '0'),
(387, 'glossary_allowcomments', '0'),
(388, 'glossary_linkbydefault', '1'),
(389, 'glossary_defaultapproval', '1'),
(390, 'glossary_enablerssfeeds', '0'),
(391, 'glossary_linkentries', '0'),
(392, 'glossary_casesensitive', '0'),
(393, 'glossary_fullmatch', '0'),
(394, 'lesson_slideshowwidth', '640'),
(395, 'lesson_slideshowheight', '480'),
(396, 'lesson_slideshowbgcolor', '#FFFFFF'),
(397, 'lesson_mediawidth', '640'),
(398, 'lesson_mediaheight', '480'),
(399, 'lesson_mediaclose', '0'),
(400, 'lesson_maxhighscores', '10'),
(401, 'lesson_maxanswers', '4'),
(402, 'lesson_defaultnextpage', '0'),
(403, 'block_course_list_adminview', 'all'),
(404, 'block_course_list_hideallcourseslink', '0'),
(405, 'block_html_allowcssclasses', '0'),
(406, 'block_online_users_timetosee', '5'),
(407, 'block_rss_client_num_entries', '5'),
(408, 'block_rss_client_timeout', '30'),
(409, 'block_tags_showcoursetags', '0'),
(410, 'filter_censor_badwords', ''),
(411, 'filter_multilang_force_old', '0'),
(412, 'logguests', '1'),
(413, 'loglifetime', '0'),
(414, 'airnotifierurl', 'https://messages.moodle.net'),
(415, 'airnotifierport', '443'),
(416, 'airnotifiermobileappname', 'com.moodle.moodlemobile'),
(417, 'airnotifierappname', 'commoodlemoodlemobile'),
(418, 'airnotifieraccesskey', ''),
(419, 'smtphosts', 'mail.capacita.co'),
(420, 'smtpsecure', ''),
(421, 'smtpuser', 'soporte@capacita.co'),
(422, 'smtppass', 'SOP0Capa2014$'),
(423, 'smtpmaxbulk', '1'),
(424, 'noreplyaddress', 'noreply@localhost'),
(425, 'emailonlyfromnoreplyaddress', '0'),
(426, 'sitemailcharset', '0'),
(427, 'allowusermailcharset', '0'),
(428, 'allowattachments', '1'),
(429, 'mailnewline', 'LF'),
(430, 'jabberhost', ''),
(431, 'jabberserver', ''),
(432, 'jabberusername', ''),
(433, 'jabberpassword', ''),
(434, 'jabberport', '5222'),
(435, 'profileroles', '3,4,5'),
(436, 'coursecontact', '3'),
(437, 'frontpage', ''),
(438, 'frontpageloggedin', '5'),
(439, 'maxcategorydepth', '2'),
(440, 'frontpagecourselimit', '200'),
(441, 'commentsperpage', '15'),
(442, 'defaultfrontpageroleid', '8'),
(443, 'supportname', 'Admin User'),
(444, 'supportemail', 'dom_2789@yahoo.com'),
(445, 'registerauth', ''),
(446, 'scorm_updatetimelast', '1415196027'),
(447, 'fileslastcleanup', '1415196030'),
(448, 'digestmailtimelast', '0'),
(449, 'forum_lastreadclean', '1415196030'),
(451, 'block_quickmail_allowstudents', '0'),
(452, 'block_quickmail_roleselection', '1,2,3,4'),
(453, 'block_quickmail_receipt', '0'),
(454, 'block_quickmail_prepend_class', 'shortname'),
(455, 'block_quickmail_ferpa', 'strictferpa');

-- --------------------------------------------------------

--
-- Table structure for table `mdl_config_log`
--

CREATE TABLE IF NOT EXISTS `mdl_config_log` (
`id` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `timemodified` bigint(10) NOT NULL,
  `plugin` varchar(100) DEFAULT NULL,
  `name` varchar(100) NOT NULL DEFAULT '',
  `value` longtext,
  `oldvalue` longtext
) ENGINE=InnoDB AUTO_INCREMENT=955 DEFAULT CHARSET=utf8 COMMENT='Changes done in server configuration through admin UI';

--
-- Dumping data for table `mdl_config_log`
--

INSERT INTO `mdl_config_log` (`id`, `userid`, `timemodified`, `plugin`, `name`, `value`, `oldvalue`) VALUES
(1, 0, 1415060954, NULL, 'enableoutcomes', '0', NULL),
(2, 0, 1415060954, NULL, 'usecomments', '1', NULL),
(3, 0, 1415060954, NULL, 'usetags', '1', NULL),
(4, 0, 1415060954, NULL, 'enablenotes', '1', NULL),
(5, 0, 1415060954, NULL, 'enableportfolios', '0', NULL),
(6, 0, 1415060954, NULL, 'enablewebservices', '0', NULL),
(7, 0, 1415060954, NULL, 'messaging', '1', NULL),
(8, 0, 1415060954, NULL, 'messaginghidereadnotifications', '0', NULL),
(9, 0, 1415060954, NULL, 'messagingdeletereadnotificationsdelay', '604800', NULL),
(10, 0, 1415060954, NULL, 'messagingallowemailoverride', '0', NULL),
(11, 0, 1415060954, NULL, 'enablestats', '0', NULL),
(12, 0, 1415060954, NULL, 'enablerssfeeds', '0', NULL),
(13, 0, 1415060954, NULL, 'enableblogs', '1', NULL),
(14, 0, 1415060954, NULL, 'enablecompletion', '0', NULL),
(15, 0, 1415060954, NULL, 'completiondefault', '1', NULL),
(16, 0, 1415060954, NULL, 'enableavailability', '0', NULL),
(17, 0, 1415060954, NULL, 'enableplagiarism', '0', NULL),
(18, 0, 1415060954, NULL, 'enablebadges', '1', NULL),
(19, 0, 1415060954, NULL, 'autologinguests', '0', NULL),
(20, 0, 1415060954, NULL, 'hiddenuserfields', '', NULL),
(21, 0, 1415060954, NULL, 'showuseridentity', 'email', NULL),
(22, 0, 1415060954, NULL, 'fullnamedisplay', 'language', NULL),
(23, 0, 1415060954, NULL, 'maxusersperpage', '100', NULL),
(24, 0, 1415060954, NULL, 'enablegravatar', '0', NULL),
(25, 0, 1415060954, NULL, 'gravatardefaulturl', 'mm', NULL),
(26, 0, 1415060954, 'moodlecourse', 'visible', '1', NULL),
(27, 0, 1415060954, 'moodlecourse', 'format', 'weeks', NULL),
(28, 0, 1415060954, 'moodlecourse', 'maxsections', '52', NULL),
(29, 0, 1415060954, 'moodlecourse', 'numsections', '10', NULL),
(30, 0, 1415060954, 'moodlecourse', 'hiddensections', '0', NULL),
(31, 0, 1415060955, 'moodlecourse', 'coursedisplay', '0', NULL),
(32, 0, 1415060955, 'moodlecourse', 'lang', '', NULL),
(33, 0, 1415060955, 'moodlecourse', 'newsitems', '5', NULL),
(34, 0, 1415060955, 'moodlecourse', 'showgrades', '1', NULL),
(35, 0, 1415060955, 'moodlecourse', 'showreports', '0', NULL),
(36, 0, 1415060955, 'moodlecourse', 'maxbytes', '0', NULL),
(37, 0, 1415060955, 'moodlecourse', 'enablecompletion', '0', NULL),
(38, 0, 1415060955, 'moodlecourse', 'groupmode', '0', NULL),
(39, 0, 1415060955, 'moodlecourse', 'groupmodeforce', '0', NULL),
(40, 0, 1415060955, NULL, 'enablecourserequests', '0', NULL),
(41, 0, 1415060955, NULL, 'defaultrequestcategory', '1', NULL),
(42, 0, 1415060955, NULL, 'requestcategoryselection', '0', NULL),
(43, 0, 1415060955, NULL, 'courserequestnotify', '', NULL),
(44, 0, 1415060955, 'backup', 'loglifetime', '30', NULL),
(45, 0, 1415060955, 'backup', 'backup_general_users', '1', NULL),
(46, 0, 1415060955, 'backup', 'backup_general_users_locked', '', NULL),
(47, 0, 1415060955, 'backup', 'backup_general_anonymize', '0', NULL),
(48, 0, 1415060955, 'backup', 'backup_general_anonymize_locked', '', NULL),
(49, 0, 1415060955, 'backup', 'backup_general_role_assignments', '1', NULL),
(50, 0, 1415060955, 'backup', 'backup_general_role_assignments_locked', '', NULL),
(51, 0, 1415060955, 'backup', 'backup_general_activities', '1', NULL),
(52, 0, 1415060955, 'backup', 'backup_general_activities_locked', '', NULL),
(53, 0, 1415060955, 'backup', 'backup_general_blocks', '1', NULL),
(54, 0, 1415060955, 'backup', 'backup_general_blocks_locked', '', NULL),
(55, 0, 1415060955, 'backup', 'backup_general_filters', '1', NULL),
(56, 0, 1415060955, 'backup', 'backup_general_filters_locked', '', NULL),
(57, 0, 1415060955, 'backup', 'backup_general_comments', '1', NULL),
(58, 0, 1415060955, 'backup', 'backup_general_comments_locked', '', NULL),
(59, 0, 1415060955, 'backup', 'backup_general_badges', '1', NULL),
(60, 0, 1415060955, 'backup', 'backup_general_badges_locked', '', NULL),
(61, 0, 1415060955, 'backup', 'backup_general_userscompletion', '1', NULL),
(62, 0, 1415060955, 'backup', 'backup_general_userscompletion_locked', '', NULL),
(63, 0, 1415060955, 'backup', 'backup_general_logs', '0', NULL),
(64, 0, 1415060955, 'backup', 'backup_general_logs_locked', '', NULL),
(65, 0, 1415060955, 'backup', 'backup_general_histories', '0', NULL),
(66, 0, 1415060955, 'backup', 'backup_general_histories_locked', '', NULL),
(67, 0, 1415060955, 'backup', 'backup_general_questionbank', '1', NULL),
(68, 0, 1415060955, 'backup', 'backup_general_questionbank_locked', '', NULL),
(69, 0, 1415060955, 'backup', 'import_general_maxresults', '10', NULL),
(70, 0, 1415060955, 'backup', 'backup_auto_active', '0', NULL),
(71, 0, 1415060955, 'backup', 'backup_auto_weekdays', '0000000', NULL),
(72, 0, 1415060955, 'backup', 'backup_auto_hour', '0', NULL),
(73, 0, 1415060955, 'backup', 'backup_auto_minute', '0', NULL),
(74, 0, 1415060955, 'backup', 'backup_auto_storage', '0', NULL),
(75, 0, 1415060955, 'backup', 'backup_auto_destination', '', NULL),
(76, 0, 1415060955, 'backup', 'backup_auto_keep', '1', NULL),
(77, 0, 1415060955, 'backup', 'backup_shortname', '0', NULL),
(78, 0, 1415060955, 'backup', 'backup_auto_skip_hidden', '1', NULL),
(79, 0, 1415060955, 'backup', 'backup_auto_skip_modif_days', '30', NULL),
(80, 0, 1415060955, 'backup', 'backup_auto_skip_modif_prev', '0', NULL),
(81, 0, 1415060956, 'backup', 'backup_auto_users', '1', NULL),
(82, 0, 1415060956, 'backup', 'backup_auto_role_assignments', '1', NULL),
(83, 0, 1415060956, 'backup', 'backup_auto_activities', '1', NULL),
(84, 0, 1415060956, 'backup', 'backup_auto_blocks', '1', NULL),
(85, 0, 1415060956, 'backup', 'backup_auto_filters', '1', NULL),
(86, 0, 1415060956, 'backup', 'backup_auto_comments', '1', NULL),
(87, 0, 1415060956, 'backup', 'backup_auto_badges', '1', NULL),
(88, 0, 1415060956, 'backup', 'backup_auto_userscompletion', '1', NULL),
(89, 0, 1415060956, 'backup', 'backup_auto_logs', '0', NULL),
(90, 0, 1415060956, 'backup', 'backup_auto_histories', '0', NULL),
(91, 0, 1415060956, 'backup', 'backup_auto_questionbank', '1', NULL),
(92, 0, 1415060956, NULL, 'grade_profilereport', 'user', NULL),
(93, 0, 1415060956, NULL, 'grade_aggregationposition', '1', NULL),
(94, 0, 1415060956, NULL, 'grade_includescalesinaggregation', '1', NULL),
(95, 0, 1415060956, NULL, 'grade_hiddenasdate', '0', NULL),
(96, 0, 1415060956, NULL, 'gradepublishing', '0', NULL),
(97, 0, 1415060956, NULL, 'grade_export_displaytype', '1', NULL),
(98, 0, 1415060956, NULL, 'grade_export_decimalpoints', '2', NULL),
(99, 0, 1415060956, NULL, 'grade_navmethod', '0', NULL),
(100, 0, 1415060956, NULL, 'grade_export_userprofilefields', 'firstname,lastname,idnumber,institution,department,email', NULL),
(101, 0, 1415060956, NULL, 'grade_export_customprofilefields', '', NULL),
(102, 0, 1415060956, NULL, 'recovergradesdefault', '0', NULL),
(103, 0, 1415060956, NULL, 'gradeexport', '', NULL),
(104, 0, 1415060956, NULL, 'unlimitedgrades', '0', NULL),
(105, 0, 1415060956, NULL, 'gradepointmax', '100', NULL),
(106, 0, 1415060956, NULL, 'gradepointdefault', '100', NULL),
(107, 0, 1415060956, NULL, 'grade_hideforcedsettings', '1', NULL),
(108, 0, 1415060956, NULL, 'grade_aggregation', '11', NULL),
(109, 0, 1415060956, NULL, 'grade_aggregation_flag', '0', NULL),
(110, 0, 1415060956, NULL, 'grade_aggregations_visible', '0,10,11,12,2,4,6,8,13', NULL),
(111, 0, 1415060956, NULL, 'grade_aggregateonlygraded', '1', NULL),
(112, 0, 1415060956, NULL, 'grade_aggregateonlygraded_flag', '2', NULL),
(113, 0, 1415060956, NULL, 'grade_aggregateoutcomes', '0', NULL),
(114, 0, 1415060956, NULL, 'grade_aggregateoutcomes_flag', '2', NULL),
(115, 0, 1415060956, NULL, 'grade_aggregatesubcats', '0', NULL),
(116, 0, 1415060956, NULL, 'grade_aggregatesubcats_flag', '2', NULL),
(117, 0, 1415060956, NULL, 'grade_keephigh', '0', NULL),
(118, 0, 1415060956, NULL, 'grade_keephigh_flag', '3', NULL),
(119, 0, 1415060956, NULL, 'grade_droplow', '0', NULL),
(120, 0, 1415060956, NULL, 'grade_droplow_flag', '2', NULL),
(121, 0, 1415060956, NULL, 'grade_displaytype', '1', NULL),
(122, 0, 1415060956, NULL, 'grade_decimalpoints', '2', NULL),
(123, 0, 1415060956, NULL, 'grade_item_advanced', 'iteminfo,idnumber,gradepass,plusfactor,multfactor,display,decimals,hiddenuntil,locktime', NULL),
(124, 0, 1415060956, NULL, 'grade_report_studentsperpage', '100', NULL),
(125, 0, 1415060956, NULL, 'grade_report_showonlyactiveenrol', '1', NULL),
(126, 0, 1415060956, NULL, 'grade_report_quickgrading', '1', NULL),
(127, 0, 1415060956, NULL, 'grade_report_showquickfeedback', '0', NULL),
(128, 0, 1415060956, NULL, 'grade_report_fixedstudents', '0', NULL),
(129, 0, 1415060956, NULL, 'grade_report_meanselection', '1', NULL),
(130, 0, 1415060957, NULL, 'grade_report_enableajax', '0', NULL),
(131, 0, 1415060957, NULL, 'grade_report_showcalculations', '0', NULL),
(132, 0, 1415060957, NULL, 'grade_report_showeyecons', '0', NULL),
(133, 0, 1415060957, NULL, 'grade_report_showaverages', '1', NULL),
(134, 0, 1415060957, NULL, 'grade_report_showlocks', '0', NULL),
(135, 0, 1415060957, NULL, 'grade_report_showranges', '0', NULL),
(136, 0, 1415060957, NULL, 'grade_report_showanalysisicon', '1', NULL),
(137, 0, 1415060957, NULL, 'grade_report_showuserimage', '1', NULL),
(138, 0, 1415060957, NULL, 'grade_report_showactivityicons', '1', NULL),
(139, 0, 1415060957, NULL, 'grade_report_shownumberofgrades', '0', NULL),
(140, 0, 1415060957, NULL, 'grade_report_averagesdisplaytype', 'inherit', NULL),
(141, 0, 1415060957, NULL, 'grade_report_rangesdisplaytype', 'inherit', NULL),
(142, 0, 1415060957, NULL, 'grade_report_averagesdecimalpoints', 'inherit', NULL),
(143, 0, 1415060957, NULL, 'grade_report_rangesdecimalpoints', 'inherit', NULL),
(144, 0, 1415060957, NULL, 'grade_report_overview_showrank', '0', NULL),
(145, 0, 1415060957, NULL, 'grade_report_overview_showtotalsifcontainhidden', '0', NULL),
(146, 0, 1415060957, NULL, 'grade_report_user_showrank', '0', NULL),
(147, 0, 1415060957, NULL, 'grade_report_user_showpercentage', '1', NULL),
(148, 0, 1415060957, NULL, 'grade_report_user_showgrade', '1', NULL),
(149, 0, 1415060957, NULL, 'grade_report_user_showfeedback', '1', NULL),
(150, 0, 1415060957, NULL, 'grade_report_user_showrange', '1', NULL),
(151, 0, 1415060957, NULL, 'grade_report_user_showweight', '0', NULL),
(152, 0, 1415060957, NULL, 'grade_report_user_showaverage', '0', NULL),
(153, 0, 1415060957, NULL, 'grade_report_user_showlettergrade', '0', NULL),
(154, 0, 1415060957, NULL, 'grade_report_user_rangedecimals', '0', NULL),
(155, 0, 1415060957, NULL, 'grade_report_user_showhiddenitems', '1', NULL),
(156, 0, 1415060957, NULL, 'grade_report_user_showtotalsifcontainhidden', '0', NULL),
(157, 0, 1415060957, NULL, 'badges_defaultissuername', '', NULL),
(158, 0, 1415060957, NULL, 'badges_defaultissuercontact', '', NULL),
(159, 0, 1415060957, NULL, 'badges_badgesalt', 'badges1415060944', NULL),
(160, 0, 1415060957, NULL, 'badges_allowexternalbackpack', '1', NULL),
(161, 0, 1415060957, NULL, 'badges_allowcoursebadges', '1', NULL),
(162, 0, 1415060957, NULL, 'timezone', '99', NULL),
(163, 0, 1415060957, NULL, 'forcetimezone', '99', NULL),
(164, 0, 1415060957, NULL, 'country', '0', NULL),
(165, 0, 1415060957, NULL, 'defaultcity', '', NULL),
(166, 0, 1415060957, NULL, 'geoipfile', '/Applications/MAMP/moodledata/geoip/GeoLiteCity.dat', NULL),
(167, 0, 1415060957, NULL, 'googlemapkey3', '', NULL),
(168, 0, 1415060958, NULL, 'allcountrycodes', '', NULL),
(169, 0, 1415060958, NULL, 'autolang', '1', NULL),
(170, 0, 1415060958, NULL, 'lang', 'en', NULL),
(171, 0, 1415060958, NULL, 'langmenu', '1', NULL),
(172, 0, 1415060958, NULL, 'langlist', '', NULL),
(173, 0, 1415060958, NULL, 'langcache', '1', NULL),
(174, 0, 1415060958, NULL, 'langstringcache', '1', NULL),
(175, 0, 1415060958, NULL, 'locale', '', NULL),
(176, 0, 1415060958, NULL, 'latinexcelexport', '0', NULL),
(177, 0, 1415060958, NULL, 'registerauth', '', NULL),
(178, 0, 1415060958, NULL, 'authloginviaemail', '0', NULL),
(179, 0, 1415060958, NULL, 'authpreventaccountcreation', '0', NULL),
(180, 0, 1415060958, NULL, 'loginpageautofocus', '0', NULL),
(181, 0, 1415060958, NULL, 'guestloginbutton', '1', NULL),
(182, 0, 1415060958, NULL, 'alternateloginurl', '', NULL),
(183, 0, 1415060958, NULL, 'forgottenpasswordurl', '', NULL),
(184, 0, 1415060958, NULL, 'auth_instructions', '', NULL),
(185, 0, 1415060958, NULL, 'allowemailaddresses', '', NULL),
(186, 0, 1415060958, NULL, 'denyemailaddresses', '', NULL),
(187, 0, 1415060958, NULL, 'verifychangedemail', '1', NULL),
(188, 0, 1415060958, NULL, 'recaptchapublickey', '', NULL),
(189, 0, 1415060958, NULL, 'recaptchaprivatekey', '', NULL),
(190, 0, 1415060958, 'cachestore_memcache', 'testservers', '', NULL),
(191, 0, 1415060958, 'cachestore_memcached', 'testservers', '', NULL),
(192, 0, 1415060958, 'cachestore_mongodb', 'testserver', '', NULL),
(193, 0, 1415060958, NULL, 'filteruploadedfiles', '0', NULL),
(194, 0, 1415060958, NULL, 'filtermatchoneperpage', '0', NULL),
(195, 0, 1415060958, NULL, 'filtermatchonepertext', '0', NULL),
(196, 0, 1415060958, NULL, 'sitedefaultlicense', 'allrightsreserved', NULL),
(197, 0, 1415060958, NULL, 'portfolio_moderate_filesize_threshold', '1048576', NULL),
(198, 0, 1415060958, NULL, 'portfolio_high_filesize_threshold', '5242880', NULL),
(199, 0, 1415060958, NULL, 'portfolio_moderate_db_threshold', '20', NULL),
(200, 0, 1415060958, NULL, 'portfolio_high_db_threshold', '50', NULL),
(201, 0, 1415060958, 'question_preview', 'behaviour', 'deferredfeedback', NULL),
(202, 0, 1415060958, 'question_preview', 'correctness', '1', NULL),
(203, 0, 1415060958, 'question_preview', 'marks', '1', NULL),
(204, 0, 1415060958, 'question_preview', 'markdp', '2', NULL),
(205, 0, 1415060958, 'question_preview', 'feedback', '1', NULL),
(206, 0, 1415060958, 'question_preview', 'generalfeedback', '1', NULL),
(207, 0, 1415060958, 'question_preview', 'rightanswer', '1', NULL),
(208, 0, 1415060958, 'question_preview', 'history', '0', NULL),
(209, 0, 1415060958, NULL, 'repositorycacheexpire', '120', NULL),
(210, 0, 1415060958, NULL, 'repositorygetfiletimeout', '30', NULL),
(211, 0, 1415060958, NULL, 'repositorysyncfiletimeout', '1', NULL),
(212, 0, 1415060958, NULL, 'repositorysyncimagetimeout', '3', NULL),
(213, 0, 1415060958, NULL, 'repositoryallowexternallinks', '1', NULL),
(214, 0, 1415060958, NULL, 'legacyfilesinnewcourses', '0', NULL),
(215, 0, 1415060958, NULL, 'legacyfilesaddallowed', '1', NULL),
(216, 0, 1415060958, NULL, 'mobilecssurl', '', NULL),
(217, 0, 1415060958, NULL, 'enablewsdocumentation', '0', NULL),
(218, 0, 1415060958, NULL, 'allowbeforeblock', '0', NULL),
(219, 0, 1415060958, NULL, 'allowedip', '', NULL),
(220, 0, 1415060958, NULL, 'blockedip', '', NULL),
(221, 0, 1415060958, NULL, 'protectusernames', '1', NULL),
(222, 0, 1415060958, NULL, 'forcelogin', '0', NULL),
(223, 0, 1415060958, NULL, 'forceloginforprofiles', '1', NULL),
(224, 0, 1415060958, NULL, 'forceloginforprofileimage', '0', NULL),
(225, 0, 1415060958, NULL, 'opentogoogle', '0', NULL),
(226, 0, 1415060958, NULL, 'maxbytes', '0', NULL),
(227, 0, 1415060958, NULL, 'userquota', '104857600', NULL),
(228, 0, 1415060958, NULL, 'allowobjectembed', '0', NULL),
(229, 0, 1415060958, NULL, 'enabletrusttext', '0', NULL),
(230, 0, 1415060958, NULL, 'maxeditingtime', '1800', NULL),
(231, 0, 1415060958, NULL, 'extendedusernamechars', '0', NULL),
(232, 0, 1415060958, NULL, 'sitepolicy', '', NULL),
(233, 0, 1415060958, NULL, 'sitepolicyguest', '', NULL),
(234, 0, 1415060958, NULL, 'keeptagnamecase', '1', NULL),
(235, 0, 1415060958, NULL, 'profilesforenrolledusersonly', '1', NULL),
(236, 0, 1415060958, NULL, 'cronclionly', '0', NULL),
(237, 0, 1415060958, NULL, 'cronremotepassword', '', NULL),
(238, 0, 1415060958, NULL, 'lockoutthreshold', '0', NULL),
(239, 0, 1415060958, NULL, 'lockoutwindow', '1800', NULL),
(240, 0, 1415060958, NULL, 'lockoutduration', '1800', NULL),
(241, 0, 1415060959, NULL, 'passwordpolicy', '1', NULL),
(242, 0, 1415060959, NULL, 'minpasswordlength', '8', NULL),
(243, 0, 1415060959, NULL, 'minpassworddigits', '1', NULL),
(244, 0, 1415060959, NULL, 'minpasswordlower', '1', NULL),
(245, 0, 1415060959, NULL, 'minpasswordupper', '1', NULL),
(246, 0, 1415060959, NULL, 'minpasswordnonalphanum', '1', NULL),
(247, 0, 1415060959, NULL, 'maxconsecutiveidentchars', '0', NULL),
(248, 0, 1415060959, NULL, 'pwresettime', '1800', NULL),
(249, 0, 1415060959, NULL, 'groupenrolmentkeypolicy', '1', NULL),
(250, 0, 1415060959, NULL, 'disableuserimages', '0', NULL),
(251, 0, 1415060959, NULL, 'emailchangeconfirmation', '1', NULL),
(252, 0, 1415060959, NULL, 'rememberusername', '2', NULL),
(253, 0, 1415060959, NULL, 'strictformsrequired', '0', NULL),
(254, 0, 1415060959, NULL, 'loginhttps', '0', NULL),
(255, 0, 1415060959, NULL, 'cookiesecure', '0', NULL),
(256, 0, 1415060959, NULL, 'cookiehttponly', '0', NULL),
(257, 0, 1415060959, NULL, 'allowframembedding', '0', NULL),
(258, 0, 1415060959, NULL, 'loginpasswordautocomplete', '0', NULL),
(259, 0, 1415060959, NULL, 'displayloginfailures', '0', NULL),
(260, 0, 1415060959, NULL, 'notifyloginfailures', '', NULL),
(261, 0, 1415060959, NULL, 'notifyloginthreshold', '10', NULL),
(262, 0, 1415060959, NULL, 'runclamonupload', '0', NULL),
(263, 0, 1415060959, NULL, 'pathtoclam', '', NULL),
(264, 0, 1415060959, NULL, 'quarantinedir', '', NULL),
(265, 0, 1415060959, NULL, 'clamfailureonupload', 'donothing', NULL),
(266, 0, 1415060959, NULL, 'themelist', '', NULL),
(267, 0, 1415060959, NULL, 'themedesignermode', '0', NULL),
(268, 0, 1415060959, NULL, 'allowuserthemes', '0', NULL),
(269, 0, 1415060959, NULL, 'allowcoursethemes', '0', NULL),
(270, 0, 1415060959, NULL, 'allowcategorythemes', '0', NULL),
(271, 0, 1415060959, NULL, 'allowthemechangeonurl', '0', NULL),
(272, 0, 1415060959, NULL, 'allowuserblockhiding', '1', NULL),
(273, 0, 1415060959, NULL, 'allowblockstodock', '1', NULL),
(274, 0, 1415060959, NULL, 'custommenuitems', '', NULL),
(275, 0, 1415060959, NULL, 'enabledevicedetection', '1', NULL),
(276, 0, 1415060959, NULL, 'devicedetectregex', '[]', NULL),
(277, 0, 1415060959, 'theme_clean', 'invert', '0', NULL),
(278, 0, 1415060959, 'theme_clean', 'logo', '', NULL),
(279, 0, 1415060959, 'theme_clean', 'customcss', '', NULL),
(280, 0, 1415060959, 'theme_clean', 'footnote', '', NULL),
(281, 0, 1415060959, 'theme_more', 'textcolor', '#333366', NULL),
(282, 0, 1415060959, 'theme_more', 'linkcolor', '#FF6500', NULL),
(283, 0, 1415060959, 'theme_more', 'bodybackground', '', NULL),
(284, 0, 1415060959, 'theme_more', 'backgroundimage', '', NULL),
(285, 0, 1415060959, 'theme_more', 'backgroundrepeat', 'repeat', NULL),
(286, 0, 1415060959, 'theme_more', 'backgroundposition', '0', NULL),
(287, 0, 1415060959, 'theme_more', 'backgroundfixed', '0', NULL),
(288, 0, 1415060959, 'theme_more', 'contentbackground', '#FFFFFF', NULL),
(289, 0, 1415060959, 'theme_more', 'secondarybackground', '#FFFFFF', NULL),
(290, 0, 1415060959, 'theme_more', 'invert', '1', NULL),
(291, 0, 1415060960, 'theme_more', 'logo', '', NULL),
(292, 0, 1415060960, 'theme_more', 'customcss', '', NULL),
(293, 0, 1415060960, 'theme_more', 'footnote', '', NULL),
(294, 0, 1415060960, NULL, 'calendartype', 'gregorian', NULL),
(295, 0, 1415060960, NULL, 'calendar_adminseesall', '0', NULL),
(296, 0, 1415060960, NULL, 'calendar_site_timeformat', '0', NULL),
(297, 0, 1415060960, NULL, 'calendar_startwday', '0', NULL),
(298, 0, 1415060960, NULL, 'calendar_weekend', '65', NULL),
(299, 0, 1415060960, NULL, 'calendar_lookahead', '21', NULL),
(300, 0, 1415060960, NULL, 'calendar_maxevents', '10', NULL),
(301, 0, 1415060960, NULL, 'enablecalendarexport', '1', NULL),
(302, 0, 1415060960, NULL, 'calendar_customexport', '1', NULL),
(303, 0, 1415060960, NULL, 'calendar_exportlookahead', '365', NULL),
(304, 0, 1415060960, NULL, 'calendar_exportlookback', '5', NULL),
(305, 0, 1415060960, NULL, 'calendar_exportsalt', 'xQ4zBHrELIrwEfqui4OFIrX7CP3wpsR2UPaz9Mlt8XEzo7XkU4nPrLP9e7lJ', NULL),
(306, 0, 1415060960, NULL, 'calendar_showicalsource', '1', NULL),
(307, 0, 1415060960, NULL, 'useblogassociations', '1', NULL),
(308, 0, 1415060960, NULL, 'bloglevel', '4', NULL),
(309, 0, 1415060960, NULL, 'useexternalblogs', '1', NULL),
(310, 0, 1415060960, NULL, 'externalblogcrontime', '86400', NULL),
(311, 0, 1415060960, NULL, 'maxexternalblogsperuser', '1', NULL),
(312, 0, 1415060960, NULL, 'blogusecomments', '1', NULL),
(313, 0, 1415060960, NULL, 'blogshowcommentscount', '1', NULL),
(314, 0, 1415060960, NULL, 'defaulthomepage', '0', NULL),
(315, 0, 1415060960, NULL, 'allowguestmymoodle', '1', NULL),
(316, 0, 1415060960, NULL, 'navshowfullcoursenames', '0', NULL),
(317, 0, 1415060960, NULL, 'navshowcategories', '1', NULL),
(318, 0, 1415060960, NULL, 'navshowmycoursecategories', '0', NULL),
(319, 0, 1415060960, NULL, 'navshowallcourses', '0', NULL),
(320, 0, 1415060960, NULL, 'navsortmycoursessort', 'sortorder', NULL),
(321, 0, 1415060960, NULL, 'navcourselimit', '20', NULL),
(322, 0, 1415060960, NULL, 'usesitenameforsitepages', '0', NULL),
(323, 0, 1415060960, NULL, 'linkadmincategories', '0', NULL),
(324, 0, 1415060960, NULL, 'navshowfrontpagemods', '1', NULL),
(325, 0, 1415060960, NULL, 'navadduserpostslinks', '1', NULL),
(326, 0, 1415060960, NULL, 'formatstringstriptags', '1', NULL),
(327, 0, 1415060960, NULL, 'emoticons', '[{"text":":-)","imagename":"s\\/smiley","imagecomponent":"core","altidentifier":"smiley","altcomponent":"core_pix"},{"text":":)","imagename":"s\\/smiley","imagecomponent":"core","altidentifier":"smiley","altcomponent":"core_pix"},{"text":":-D","imagename":"s\\/biggrin","imagecomponent":"core","altidentifier":"biggrin","altcomponent":"core_pix"},{"text":";-)","imagename":"s\\/wink","imagecomponent":"core","altidentifier":"wink","altcomponent":"core_pix"},{"text":":-\\/","imagename":"s\\/mixed","imagecomponent":"core","altidentifier":"mixed","altcomponent":"core_pix"},{"text":"V-.","imagename":"s\\/thoughtful","imagecomponent":"core","altidentifier":"thoughtful","altcomponent":"core_pix"},{"text":":-P","imagename":"s\\/tongueout","imagecomponent":"core","altidentifier":"tongueout","altcomponent":"core_pix"},{"text":":-p","imagename":"s\\/tongueout","imagecomponent":"core","altidentifier":"tongueout","altcomponent":"core_pix"},{"text":"B-)","imagename":"s\\/cool","imagecomponent":"core","altidentifier":"cool","altcomponent":"core_pix"},{"text":"^-)","imagename":"s\\/approve","imagecomponent":"core","altidentifier":"approve","altcomponent":"core_pix"},{"text":"8-)","imagename":"s\\/wideeyes","imagecomponent":"core","altidentifier":"wideeyes","altcomponent":"core_pix"},{"text":":o)","imagename":"s\\/clown","imagecomponent":"core","altidentifier":"clown","altcomponent":"core_pix"},{"text":":-(","imagename":"s\\/sad","imagecomponent":"core","altidentifier":"sad","altcomponent":"core_pix"},{"text":":(","imagename":"s\\/sad","imagecomponent":"core","altidentifier":"sad","altcomponent":"core_pix"},{"text":"8-.","imagename":"s\\/shy","imagecomponent":"core","altidentifier":"shy","altcomponent":"core_pix"},{"text":":-I","imagename":"s\\/blush","imagecomponent":"core","altidentifier":"blush","altcomponent":"core_pix"},{"text":":-X","imagename":"s\\/kiss","imagecomponent":"core","altidentifier":"kiss","altcomponent":"core_pix"},{"text":"8-o","imagename":"s\\/surprise","imagecomponent":"core","altidentifier":"surprise","altcomponent":"core_pix"},{"text":"P-|","imagename":"s\\/blackeye","imagecomponent":"core","altidentifier":"blackeye","altcomponent":"core_pix"},{"text":"8-[","imagename":"s\\/angry","imagecomponent":"core","altidentifier":"angry","altcomponent":"core_pix"},{"text":"(grr)","imagename":"s\\/angry","imagecomponent":"core","altidentifier":"angry","altcomponent":"core_pix"},{"text":"xx-P","imagename":"s\\/dead","imagecomponent":"core","altidentifier":"dead","altcomponent":"core_pix"},{"text":"|-.","imagename":"s\\/sleepy","imagecomponent":"core","altidentifier":"sleepy","altcomponent":"core_pix"},{"text":"}-]","imagename":"s\\/evil","imagecomponent":"core","altidentifier":"evil","altcomponent":"core_pix"},{"text":"(h)","imagename":"s\\/heart","imagecomponent":"core","altidentifier":"heart","altcomponent":"core_pix"},{"text":"(heart)","imagename":"s\\/heart","imagecomponent":"core","altidentifier":"heart","altcomponent":"core_pix"},{"text":"(y)","imagename":"s\\/yes","imagecomponent":"core","altidentifier":"yes","altcomponent":"core"},{"text":"(n)","imagename":"s\\/no","imagecomponent":"core","altidentifier":"no","altcomponent":"core"},{"text":"(martin)","imagename":"s\\/martin","imagecomponent":"core","altidentifier":"martin","altcomponent":"core_pix"},{"text":"( )","imagename":"s\\/egg","imagecomponent":"core","altidentifier":"egg","altcomponent":"core_pix"}]', NULL),
(328, 0, 1415060960, NULL, 'core_media_enable_youtube', '1', NULL),
(329, 0, 1415060960, NULL, 'core_media_enable_vimeo', '0', NULL),
(330, 0, 1415060960, NULL, 'core_media_enable_mp3', '1', NULL),
(331, 0, 1415060960, NULL, 'core_media_enable_flv', '1', NULL),
(332, 0, 1415060960, NULL, 'core_media_enable_swf', '1', NULL),
(333, 0, 1415060960, NULL, 'core_media_enable_html5audio', '1', NULL),
(334, 0, 1415060960, NULL, 'core_media_enable_html5video', '1', NULL),
(335, 0, 1415060960, NULL, 'core_media_enable_qt', '1', NULL),
(336, 0, 1415060960, NULL, 'core_media_enable_wmp', '1', NULL),
(337, 0, 1415060960, NULL, 'core_media_enable_rm', '1', NULL),
(338, 0, 1415060960, NULL, 'docroot', 'http://docs.moodle.org', NULL),
(339, 0, 1415060960, NULL, 'doclang', '', NULL),
(340, 0, 1415060961, NULL, 'doctonewwindow', '0', NULL),
(341, 0, 1415060961, NULL, 'courselistshortnames', '0', NULL),
(342, 0, 1415060961, NULL, 'coursesperpage', '20', NULL),
(343, 0, 1415060961, NULL, 'courseswithsummarieslimit', '10', NULL),
(344, 0, 1415060961, NULL, 'courseoverviewfileslimit', '1', NULL),
(345, 0, 1415060961, NULL, 'courseoverviewfilesext', '.jpg,.gif,.png', NULL),
(346, 0, 1415060961, NULL, 'useexternalyui', '0', NULL),
(347, 0, 1415060961, NULL, 'yuicomboloading', '1', NULL),
(348, 0, 1415060961, NULL, 'cachejs', '1', NULL),
(349, 0, 1415060961, NULL, 'modchooserdefault', '1', NULL),
(350, 0, 1415060961, NULL, 'modeditingmenu', '1', NULL),
(351, 0, 1415060961, NULL, 'blockeditingmenu', '1', NULL),
(352, 0, 1415060961, NULL, 'additionalhtmlhead', '', NULL),
(353, 0, 1415060961, NULL, 'additionalhtmltopofbody', '', NULL),
(354, 0, 1415060961, NULL, 'additionalhtmlfooter', '', NULL),
(355, 0, 1415060961, NULL, 'pathtodu', '', NULL),
(356, 0, 1415060961, NULL, 'aspellpath', '', NULL),
(357, 0, 1415060961, NULL, 'pathtodot', '', NULL),
(358, 0, 1415060961, NULL, 'supportpage', '', NULL),
(359, 0, 1415060961, NULL, 'dbsessions', '0', NULL),
(360, 0, 1415060961, NULL, 'sessioncookie', '', NULL),
(361, 0, 1415060961, NULL, 'sessioncookiepath', '', NULL),
(362, 0, 1415060961, NULL, 'sessioncookiedomain', '', NULL),
(363, 0, 1415060961, NULL, 'statsfirstrun', 'none', NULL),
(364, 0, 1415060961, NULL, 'statsmaxruntime', '0', NULL),
(365, 0, 1415060961, NULL, 'statsruntimedays', '31', NULL),
(366, 0, 1415060961, NULL, 'statsruntimestarthour', '0', NULL),
(367, 0, 1415060961, NULL, 'statsruntimestartminute', '0', NULL),
(368, 0, 1415060961, NULL, 'statsuserthreshold', '0', NULL),
(369, 0, 1415060961, NULL, 'slasharguments', '1', NULL),
(370, 0, 1415060961, NULL, 'getremoteaddrconf', '0', NULL),
(371, 0, 1415060961, NULL, 'proxyhost', '', NULL),
(372, 0, 1415060961, NULL, 'proxyport', '0', NULL),
(373, 0, 1415060961, NULL, 'proxytype', 'HTTP', NULL),
(374, 0, 1415060961, NULL, 'proxyuser', '', NULL),
(375, 0, 1415060961, NULL, 'proxypassword', '', NULL),
(376, 0, 1415060961, NULL, 'proxybypass', 'localhost, 127.0.0.1', NULL),
(377, 0, 1415060961, NULL, 'maintenance_enabled', '0', NULL),
(378, 0, 1415060961, NULL, 'maintenance_message', '', NULL),
(379, 0, 1415060961, NULL, 'deleteunconfirmed', '168', NULL),
(380, 0, 1415060961, NULL, 'deleteincompleteusers', '0', NULL),
(381, 0, 1415060961, NULL, 'disablegradehistory', '0', NULL),
(382, 0, 1415060961, NULL, 'gradehistorylifetime', '0', NULL),
(383, 0, 1415060961, NULL, 'extramemorylimit', '512M', NULL),
(384, 0, 1415060961, NULL, 'maxtimelimit', '0', NULL),
(385, 0, 1415060961, NULL, 'curlcache', '120', NULL),
(386, 0, 1415060961, NULL, 'curltimeoutkbitrate', '56', NULL),
(387, 0, 1415060961, NULL, 'updateautocheck', '1', NULL),
(388, 0, 1415060961, NULL, 'updateautodeploy', '0', NULL),
(389, 0, 1415060961, NULL, 'updateminmaturity', '200', NULL),
(390, 0, 1415060961, NULL, 'updatenotifybuilds', '0', NULL),
(391, 0, 1415060961, NULL, 'enablesafebrowserintegration', '0', NULL),
(392, 0, 1415060961, NULL, 'enablegroupmembersonly', '0', NULL),
(393, 0, 1415060961, NULL, 'dndallowtextandlinks', '0', NULL),
(394, 0, 1415060961, NULL, 'enablecssoptimiser', '0', NULL),
(395, 0, 1415060961, NULL, 'enabletgzbackups', '0', NULL),
(396, 0, 1415060961, NULL, 'debug', '0', NULL),
(397, 0, 1415060961, NULL, 'debugdisplay', '0', NULL),
(398, 0, 1415060961, NULL, 'debugsmtp', '0', NULL),
(399, 0, 1415060961, NULL, 'perfdebug', '7', NULL),
(400, 0, 1415060961, NULL, 'debugstringids', '0', NULL),
(401, 0, 1415060961, NULL, 'debugvalidators', '0', NULL),
(402, 0, 1415060961, NULL, 'debugpageinfo', '0', NULL),
(403, 0, 1415060961, NULL, 'profilingenabled', '0', NULL),
(404, 0, 1415060961, NULL, 'profilingincluded', '', NULL),
(405, 0, 1415060961, NULL, 'profilingexcluded', '', NULL),
(406, 0, 1415060961, NULL, 'profilingautofrec', '0', NULL),
(407, 0, 1415060961, NULL, 'profilingallowme', '0', NULL),
(408, 0, 1415060961, NULL, 'profilingallowall', '0', NULL),
(409, 0, 1415060961, NULL, 'profilinglifetime', '1440', NULL),
(410, 0, 1415060962, NULL, 'profilingimportprefix', '(I)', NULL),
(411, 0, 1415061010, 'activitynames', 'filter_active', '1', ''),
(412, 0, 1415061010, 'mathjaxloader', 'filter_active', '1', ''),
(413, 0, 1415061010, 'mediaplugin', 'filter_active', '1', ''),
(414, 2, 1415061120, NULL, 'notloggedinroleid', '6', NULL),
(415, 2, 1415061120, NULL, 'guestroleid', '6', NULL),
(416, 2, 1415061120, NULL, 'defaultuserroleid', '7', NULL),
(417, 2, 1415061120, NULL, 'creatornewroleid', '3', NULL),
(418, 2, 1415061120, NULL, 'restorernewroleid', '3', NULL),
(419, 2, 1415061120, NULL, 'gradebookroles', '5', NULL),
(420, 2, 1415061120, 'assign', 'feedback_plugin_for_gradebook', 'assignfeedback_comments', NULL),
(421, 2, 1415061120, 'assign', 'showrecentsubmissions', '0', NULL),
(422, 2, 1415061120, 'assign', 'submissionreceipts', '1', NULL),
(423, 2, 1415061120, 'assign', 'submissionstatement', 'This assignment is my own work, except where I have acknowledged the use of the works of other people.', NULL),
(424, 2, 1415061120, 'assign', 'alwaysshowdescription', '1', NULL),
(425, 2, 1415061120, 'assign', 'alwaysshowdescription_adv', '', NULL),
(426, 2, 1415061120, 'assign', 'alwaysshowdescription_locked', '', NULL),
(427, 2, 1415061120, 'assign', 'allowsubmissionsfromdate', '0', NULL),
(428, 2, 1415061120, 'assign', 'allowsubmissionsfromdate_enabled', '1', NULL),
(429, 2, 1415061120, 'assign', 'allowsubmissionsfromdate_adv', '', NULL),
(430, 2, 1415061120, 'assign', 'duedate', '604800', NULL),
(431, 2, 1415061120, 'assign', 'duedate_enabled', '1', NULL),
(432, 2, 1415061120, 'assign', 'duedate_adv', '', NULL),
(433, 2, 1415061120, 'assign', 'cutoffdate', '1209600', NULL),
(434, 2, 1415061120, 'assign', 'cutoffdate_enabled', '', NULL),
(435, 2, 1415061120, 'assign', 'cutoffdate_adv', '', NULL),
(436, 2, 1415061120, 'assign', 'submissiondrafts', '0', NULL),
(437, 2, 1415061120, 'assign', 'submissiondrafts_adv', '', NULL),
(438, 2, 1415061120, 'assign', 'submissiondrafts_locked', '', NULL),
(439, 2, 1415061120, 'assign', 'requiresubmissionstatement', '0', NULL),
(440, 2, 1415061120, 'assign', 'requiresubmissionstatement_adv', '', NULL),
(441, 2, 1415061120, 'assign', 'requiresubmissionstatement_locked', '', NULL),
(442, 2, 1415061120, 'assign', 'attemptreopenmethod', 'none', NULL),
(443, 2, 1415061120, 'assign', 'attemptreopenmethod_adv', '', NULL),
(444, 2, 1415061120, 'assign', 'attemptreopenmethod_locked', '', NULL),
(445, 2, 1415061120, 'assign', 'maxattempts', '-1', NULL),
(446, 2, 1415061120, 'assign', 'maxattempts_adv', '', NULL),
(447, 2, 1415061120, 'assign', 'maxattempts_locked', '', NULL),
(448, 2, 1415061120, 'assign', 'teamsubmission', '0', NULL),
(449, 2, 1415061120, 'assign', 'teamsubmission_adv', '', NULL),
(450, 2, 1415061120, 'assign', 'teamsubmission_locked', '', NULL),
(451, 2, 1415061120, 'assign', 'requireallteammemberssubmit', '0', NULL),
(452, 2, 1415061120, 'assign', 'requireallteammemberssubmit_adv', '', NULL),
(453, 2, 1415061120, 'assign', 'requireallteammemberssubmit_locked', '', NULL),
(454, 2, 1415061120, 'assign', 'teamsubmissiongroupingid', '', NULL),
(455, 2, 1415061120, 'assign', 'teamsubmissiongroupingid_adv', '', NULL),
(456, 2, 1415061120, 'assign', 'sendnotifications', '0', NULL),
(457, 2, 1415061120, 'assign', 'sendnotifications_adv', '', NULL),
(458, 2, 1415061120, 'assign', 'sendnotifications_locked', '', NULL),
(459, 2, 1415061120, 'assign', 'sendlatenotifications', '0', NULL),
(460, 2, 1415061120, 'assign', 'sendlatenotifications_adv', '', NULL),
(461, 2, 1415061120, 'assign', 'sendlatenotifications_locked', '', NULL),
(462, 2, 1415061120, 'assign', 'sendstudentnotifications', '1', NULL),
(463, 2, 1415061120, 'assign', 'sendstudentnotifications_adv', '', NULL),
(464, 2, 1415061120, 'assign', 'sendstudentnotifications_locked', '', NULL),
(465, 2, 1415061120, 'assign', 'blindmarking', '0', NULL),
(466, 2, 1415061120, 'assign', 'blindmarking_adv', '', NULL),
(467, 2, 1415061120, 'assign', 'blindmarking_locked', '', NULL),
(468, 2, 1415061120, 'assign', 'markingworkflow', '0', NULL),
(469, 2, 1415061120, 'assign', 'markingworkflow_adv', '', NULL),
(470, 2, 1415061120, 'assign', 'markingworkflow_locked', '', NULL),
(471, 2, 1415061120, 'assign', 'markingallocation', '0', NULL),
(472, 2, 1415061120, 'assign', 'markingallocation_adv', '', NULL),
(473, 2, 1415061120, 'assign', 'markingallocation_locked', '', NULL),
(474, 2, 1415061120, 'assignsubmission_file', 'default', '1', NULL),
(475, 2, 1415061120, 'assignsubmission_file', 'maxbytes', '1048576', NULL),
(476, 2, 1415061120, 'assignsubmission_onlinetext', 'default', '0', NULL),
(477, 2, 1415061120, 'assignfeedback_comments', 'default', '1', NULL),
(478, 2, 1415061120, 'assignfeedback_comments', 'inline', '0', NULL),
(479, 2, 1415061120, 'assignfeedback_comments', 'inline_adv', '', NULL),
(480, 2, 1415061120, 'assignfeedback_comments', 'inline_locked', '', NULL),
(481, 2, 1415061120, 'assignfeedback_editpdf', 'stamps', '', NULL),
(482, 2, 1415061120, 'assignfeedback_editpdf', 'gspath', '/usr/bin/gs', NULL),
(483, 2, 1415061120, 'assignfeedback_file', 'default', '0', NULL),
(484, 2, 1415061120, 'assignfeedback_offline', 'default', '0', NULL),
(485, 2, 1415061120, 'book', 'requiremodintro', '1', NULL),
(486, 2, 1415061120, 'book', 'numberingoptions', '0,1,2,3', NULL),
(487, 2, 1415061120, 'book', 'numbering', '1', NULL),
(488, 2, 1415061120, NULL, 'chat_method', 'ajax', NULL),
(489, 2, 1415061120, NULL, 'chat_refresh_userlist', '10', NULL),
(490, 2, 1415061120, NULL, 'chat_old_ping', '35', NULL),
(491, 2, 1415061120, NULL, 'chat_refresh_room', '5', NULL),
(492, 2, 1415061120, NULL, 'chat_normal_updatemode', 'jsupdate', NULL),
(493, 2, 1415061120, NULL, 'chat_serverhost', 'localhost', NULL),
(494, 2, 1415061120, NULL, 'chat_serverip', '127.0.0.1', NULL),
(495, 2, 1415061120, NULL, 'chat_serverport', '9111', NULL),
(496, 2, 1415061120, NULL, 'chat_servermax', '100', NULL),
(497, 2, 1415061120, NULL, 'data_enablerssfeeds', '0', NULL),
(498, 2, 1415061120, NULL, 'feedback_allowfullanonymous', '0', NULL),
(499, 2, 1415061120, 'folder', 'requiremodintro', '1', NULL),
(500, 2, 1415061120, 'folder', 'showexpanded', '1', NULL),
(501, 2, 1415061120, NULL, 'forum_displaymode', '3', NULL),
(502, 2, 1415061120, NULL, 'forum_replytouser', '1', NULL),
(503, 2, 1415061120, NULL, 'forum_shortpost', '300', NULL),
(504, 2, 1415061120, NULL, 'forum_longpost', '600', NULL),
(505, 2, 1415061120, NULL, 'forum_manydiscussions', '100', NULL),
(506, 2, 1415061120, NULL, 'forum_maxbytes', '512000', NULL),
(507, 2, 1415061120, NULL, 'forum_maxattachments', '9', NULL),
(508, 2, 1415061120, NULL, 'forum_trackingtype', '1', NULL),
(509, 2, 1415061120, NULL, 'forum_trackreadposts', '1', NULL),
(510, 2, 1415061120, NULL, 'forum_allowforcedreadtracking', '0', NULL),
(511, 2, 1415061120, NULL, 'forum_oldpostdays', '14', NULL),
(512, 2, 1415061120, NULL, 'forum_usermarksread', '0', NULL),
(513, 2, 1415061120, NULL, 'forum_cleanreadtime', '2', NULL),
(514, 2, 1415061120, NULL, 'digestmailtime', '17', NULL),
(515, 2, 1415061120, NULL, 'forum_enablerssfeeds', '0', NULL),
(516, 2, 1415061120, NULL, 'forum_enabletimedposts', '0', NULL),
(517, 2, 1415061120, NULL, 'glossary_entbypage', '10', NULL),
(518, 2, 1415061120, NULL, 'glossary_dupentries', '0', NULL),
(519, 2, 1415061120, NULL, 'glossary_allowcomments', '0', NULL),
(520, 2, 1415061120, NULL, 'glossary_linkbydefault', '1', NULL),
(521, 2, 1415061120, NULL, 'glossary_defaultapproval', '1', NULL),
(522, 2, 1415061120, NULL, 'glossary_enablerssfeeds', '0', NULL),
(523, 2, 1415061120, NULL, 'glossary_linkentries', '0', NULL),
(524, 2, 1415061120, NULL, 'glossary_casesensitive', '0', NULL),
(525, 2, 1415061120, NULL, 'glossary_fullmatch', '0', NULL),
(526, 2, 1415061120, 'imscp', 'requiremodintro', '1', NULL),
(527, 2, 1415061120, 'imscp', 'keepold', '1', NULL),
(528, 2, 1415061120, 'imscp', 'keepold_adv', '', NULL),
(529, 2, 1415061120, 'label', 'dndmedia', '1', NULL),
(530, 2, 1415061120, 'label', 'dndresizewidth', '400', NULL),
(531, 2, 1415061120, 'label', 'dndresizeheight', '400', NULL),
(532, 2, 1415061120, NULL, 'lesson_slideshowwidth', '640', NULL),
(533, 2, 1415061120, NULL, 'lesson_slideshowheight', '480', NULL),
(534, 2, 1415061120, NULL, 'lesson_slideshowbgcolor', '#FFFFFF', NULL),
(535, 2, 1415061120, NULL, 'lesson_mediawidth', '640', NULL),
(536, 2, 1415061120, NULL, 'lesson_mediaheight', '480', NULL),
(537, 2, 1415061120, NULL, 'lesson_mediaclose', '0', NULL),
(538, 2, 1415061120, NULL, 'lesson_maxhighscores', '10', NULL),
(539, 2, 1415061120, NULL, 'lesson_maxanswers', '4', NULL),
(540, 2, 1415061120, NULL, 'lesson_defaultnextpage', '0', NULL),
(541, 2, 1415061120, 'page', 'requiremodintro', '1', NULL),
(542, 2, 1415061120, 'page', 'displayoptions', '5', NULL),
(543, 2, 1415061120, 'page', 'printheading', '1', NULL),
(544, 2, 1415061120, 'page', 'printintro', '0', NULL),
(545, 2, 1415061120, 'page', 'display', '5', NULL),
(546, 2, 1415061120, 'page', 'popupwidth', '620', NULL),
(547, 2, 1415061120, 'page', 'popupheight', '450', NULL),
(548, 2, 1415061120, 'quiz', 'timelimit', '0', NULL),
(549, 2, 1415061120, 'quiz', 'timelimit_adv', '', NULL),
(550, 2, 1415061120, 'quiz', 'overduehandling', 'autoabandon', NULL),
(551, 2, 1415061120, 'quiz', 'overduehandling_adv', '', NULL),
(552, 2, 1415061120, 'quiz', 'graceperiod', '86400', NULL),
(553, 2, 1415061120, 'quiz', 'graceperiod_adv', '', NULL),
(554, 2, 1415061120, 'quiz', 'graceperiodmin', '60', NULL),
(555, 2, 1415061120, 'quiz', 'attempts', '0', NULL),
(556, 2, 1415061120, 'quiz', 'attempts_adv', '', NULL),
(557, 2, 1415061120, 'quiz', 'grademethod', '1', NULL),
(558, 2, 1415061120, 'quiz', 'grademethod_adv', '', NULL),
(559, 2, 1415061120, 'quiz', 'maximumgrade', '10', NULL),
(560, 2, 1415061120, 'quiz', 'shufflequestions', '0', NULL),
(561, 2, 1415061120, 'quiz', 'shufflequestions_adv', '', NULL),
(562, 2, 1415061121, 'quiz', 'questionsperpage', '1', NULL),
(563, 2, 1415061121, 'quiz', 'questionsperpage_adv', '', NULL),
(564, 2, 1415061121, 'quiz', 'navmethod', 'free', NULL),
(565, 2, 1415061121, 'quiz', 'navmethod_adv', '1', NULL),
(566, 2, 1415061121, 'quiz', 'shuffleanswers', '1', NULL),
(567, 2, 1415061121, 'quiz', 'shuffleanswers_adv', '', NULL),
(568, 2, 1415061121, 'quiz', 'preferredbehaviour', 'deferredfeedback', NULL),
(569, 2, 1415061121, 'quiz', 'attemptonlast', '0', NULL),
(570, 2, 1415061121, 'quiz', 'attemptonlast_adv', '1', NULL),
(571, 2, 1415061121, 'quiz', 'reviewattempt', '69904', NULL),
(572, 2, 1415061121, 'quiz', 'reviewcorrectness', '69904', NULL),
(573, 2, 1415061121, 'quiz', 'reviewmarks', '69904', NULL),
(574, 2, 1415061121, 'quiz', 'reviewspecificfeedback', '69904', NULL),
(575, 2, 1415061121, 'quiz', 'reviewgeneralfeedback', '69904', NULL),
(576, 2, 1415061121, 'quiz', 'reviewrightanswer', '69904', NULL),
(577, 2, 1415061121, 'quiz', 'reviewoverallfeedback', '4368', NULL),
(578, 2, 1415061121, 'quiz', 'showuserpicture', '0', NULL),
(579, 2, 1415061121, 'quiz', 'showuserpicture_adv', '', NULL),
(580, 2, 1415061121, 'quiz', 'decimalpoints', '2', NULL),
(581, 2, 1415061121, 'quiz', 'decimalpoints_adv', '', NULL),
(582, 2, 1415061121, 'quiz', 'questiondecimalpoints', '-1', NULL),
(583, 2, 1415061121, 'quiz', 'questiondecimalpoints_adv', '1', NULL),
(584, 2, 1415061121, 'quiz', 'showblocks', '0', NULL),
(585, 2, 1415061121, 'quiz', 'showblocks_adv', '1', NULL),
(586, 2, 1415061121, 'quiz', 'password', '', NULL),
(587, 2, 1415061121, 'quiz', 'password_adv', '1', NULL),
(588, 2, 1415061121, 'quiz', 'subnet', '', NULL),
(589, 2, 1415061121, 'quiz', 'subnet_adv', '1', NULL),
(590, 2, 1415061121, 'quiz', 'delay1', '0', NULL),
(591, 2, 1415061121, 'quiz', 'delay1_adv', '1', NULL),
(592, 2, 1415061121, 'quiz', 'delay2', '0', NULL),
(593, 2, 1415061121, 'quiz', 'delay2_adv', '1', NULL),
(594, 2, 1415061121, 'quiz', 'browsersecurity', '-', NULL),
(595, 2, 1415061121, 'quiz', 'browsersecurity_adv', '1', NULL),
(596, 2, 1415061121, 'quiz', 'autosaveperiod', '0', NULL),
(597, 2, 1415061121, 'resource', 'framesize', '130', NULL),
(598, 2, 1415061121, 'resource', 'requiremodintro', '1', NULL),
(599, 2, 1415061121, 'resource', 'displayoptions', '0,1,4,5,6', NULL),
(600, 2, 1415061121, 'resource', 'printintro', '1', NULL),
(601, 2, 1415061121, 'resource', 'display', '0', NULL),
(602, 2, 1415061121, 'resource', 'showsize', '0', NULL),
(603, 2, 1415061121, 'resource', 'showtype', '0', NULL),
(604, 2, 1415061121, 'resource', 'popupwidth', '620', NULL),
(605, 2, 1415061121, 'resource', 'popupheight', '450', NULL),
(606, 2, 1415061121, 'resource', 'filterfiles', '0', NULL),
(607, 2, 1415061121, 'scorm', 'displaycoursestructure', '0', NULL),
(608, 2, 1415061121, 'scorm', 'displaycoursestructure_adv', '', NULL),
(609, 2, 1415061121, 'scorm', 'popup', '0', NULL),
(610, 2, 1415061121, 'scorm', 'popup_adv', '', NULL),
(611, 2, 1415061121, 'scorm', 'displayactivityname', '1', NULL),
(612, 2, 1415061121, 'scorm', 'framewidth', '100', NULL),
(613, 2, 1415061121, 'scorm', 'framewidth_adv', '1', NULL),
(614, 2, 1415061121, 'scorm', 'frameheight', '500', NULL),
(615, 2, 1415061121, 'scorm', 'frameheight_adv', '1', NULL),
(616, 2, 1415061121, 'scorm', 'winoptgrp_adv', '1', NULL),
(617, 2, 1415061121, 'scorm', 'scrollbars', '0', NULL),
(618, 2, 1415061121, 'scorm', 'directories', '0', NULL),
(619, 2, 1415061121, 'scorm', 'location', '0', NULL),
(620, 2, 1415061121, 'scorm', 'menubar', '0', NULL),
(621, 2, 1415061121, 'scorm', 'toolbar', '0', NULL),
(622, 2, 1415061121, 'scorm', 'status', '0', NULL),
(623, 2, 1415061121, 'scorm', 'skipview', '0', NULL),
(624, 2, 1415061121, 'scorm', 'skipview_adv', '1', NULL),
(625, 2, 1415061121, 'scorm', 'hidebrowse', '0', NULL),
(626, 2, 1415061121, 'scorm', 'hidebrowse_adv', '1', NULL),
(627, 2, 1415061121, 'scorm', 'hidetoc', '0', NULL),
(628, 2, 1415061121, 'scorm', 'hidetoc_adv', '1', NULL),
(629, 2, 1415061121, 'scorm', 'nav', '1', NULL),
(630, 2, 1415061121, 'scorm', 'nav_adv', '1', NULL),
(631, 2, 1415061121, 'scorm', 'navpositionleft', '-100', NULL),
(632, 2, 1415061121, 'scorm', 'navpositionleft_adv', '1', NULL),
(633, 2, 1415061121, 'scorm', 'navpositiontop', '-100', NULL),
(634, 2, 1415061121, 'scorm', 'navpositiontop_adv', '1', NULL),
(635, 2, 1415061121, 'scorm', 'collapsetocwinsize', '767', NULL),
(636, 2, 1415061121, 'scorm', 'collapsetocwinsize_adv', '1', NULL),
(637, 2, 1415061121, 'scorm', 'displayattemptstatus', '1', NULL),
(638, 2, 1415061121, 'scorm', 'displayattemptstatus_adv', '', NULL),
(639, 2, 1415061121, 'scorm', 'grademethod', '1', NULL),
(640, 2, 1415061121, 'scorm', 'maxgrade', '100', NULL),
(641, 2, 1415061121, 'scorm', 'maxattempt', '0', NULL),
(642, 2, 1415061121, 'scorm', 'whatgrade', '0', NULL),
(643, 2, 1415061121, 'scorm', 'forcecompleted', '0', NULL),
(644, 2, 1415061121, 'scorm', 'forcenewattempt', '0', NULL),
(645, 2, 1415061121, 'scorm', 'lastattemptlock', '0', NULL),
(646, 2, 1415061121, 'scorm', 'auto', '0', NULL),
(647, 2, 1415061121, 'scorm', 'updatefreq', '0', NULL),
(648, 2, 1415061121, 'scorm', 'scorm12standard', '1', NULL),
(649, 2, 1415061121, 'scorm', 'allowtypeexternal', '0', NULL),
(650, 2, 1415061121, 'scorm', 'allowtypelocalsync', '0', NULL),
(651, 2, 1415061121, 'scorm', 'allowtypeexternalaicc', '0', NULL),
(652, 2, 1415061121, 'scorm', 'allowaicchacp', '0', NULL),
(653, 2, 1415061121, 'scorm', 'aicchacptimeout', '30', NULL),
(654, 2, 1415061121, 'scorm', 'aicchacpkeepsessiondata', '1', NULL),
(655, 2, 1415061121, 'scorm', 'forcejavascript', '1', NULL),
(656, 2, 1415061121, 'scorm', 'allowapidebug', '0', NULL),
(657, 2, 1415061121, 'scorm', 'apidebugmask', '.*', NULL),
(658, 2, 1415061121, 'url', 'framesize', '130', NULL),
(659, 2, 1415061121, 'url', 'requiremodintro', '1', NULL),
(660, 2, 1415061121, 'url', 'secretphrase', '', NULL),
(661, 2, 1415061121, 'url', 'rolesinparams', '0', NULL),
(662, 2, 1415061121, 'url', 'displayoptions', '0,1,5,6', NULL),
(663, 2, 1415061121, 'url', 'printintro', '1', NULL),
(664, 2, 1415061121, 'url', 'display', '0', NULL),
(665, 2, 1415061121, 'url', 'popupwidth', '620', NULL),
(666, 2, 1415061121, 'url', 'popupheight', '450', NULL),
(667, 2, 1415061121, 'workshop', 'grade', '80', NULL),
(668, 2, 1415061121, 'workshop', 'gradinggrade', '20', NULL),
(669, 2, 1415061121, 'workshop', 'gradedecimals', '0', NULL),
(670, 2, 1415061121, 'workshop', 'maxbytes', '0', NULL),
(671, 2, 1415061121, 'workshop', 'strategy', 'accumulative', NULL),
(672, 2, 1415061121, 'workshop', 'examplesmode', '0', NULL),
(673, 2, 1415061121, 'workshopallocation_random', 'numofreviews', '5', NULL),
(674, 2, 1415061121, 'workshopform_numerrors', 'grade0', 'No', NULL),
(675, 2, 1415061121, 'workshopform_numerrors', 'grade1', 'Yes', NULL),
(676, 2, 1415061121, 'workshopeval_best', 'comparison', '5', NULL),
(677, 2, 1415061121, NULL, 'block_course_list_adminview', 'all', NULL),
(678, 2, 1415061121, NULL, 'block_course_list_hideallcourseslink', '0', NULL),
(679, 2, 1415061121, 'block_course_overview', 'defaultmaxcourses', '10', NULL),
(680, 2, 1415061121, 'block_course_overview', 'forcedefaultmaxcourses', '0', NULL),
(681, 2, 1415061121, 'block_course_overview', 'showchildren', '0', NULL),
(682, 2, 1415061121, 'block_course_overview', 'showwelcomearea', '0', NULL),
(683, 2, 1415061121, NULL, 'block_html_allowcssclasses', '0', NULL),
(684, 2, 1415061121, NULL, 'block_online_users_timetosee', '5', NULL),
(685, 2, 1415061121, NULL, 'block_rss_client_num_entries', '5', NULL),
(686, 2, 1415061121, NULL, 'block_rss_client_timeout', '30', NULL),
(687, 2, 1415061121, 'block_section_links', 'numsections1', '22', NULL),
(688, 2, 1415061121, 'block_section_links', 'incby1', '2', NULL),
(689, 2, 1415061121, 'block_section_links', 'numsections2', '40', NULL),
(690, 2, 1415061121, 'block_section_links', 'incby2', '5', NULL),
(691, 2, 1415061121, NULL, 'block_tags_showcoursetags', '0', NULL),
(692, 2, 1415061121, 'format_singleactivity', 'activitytype', 'forum', NULL),
(693, 2, 1415061121, 'enrol_cohort', 'roleid', '5', NULL),
(694, 2, 1415061121, 'enrol_cohort', 'unenrolaction', '0', NULL),
(695, 2, 1415061121, 'enrol_database', 'dbtype', '', NULL),
(696, 2, 1415061121, 'enrol_database', 'dbhost', 'localhost', NULL),
(697, 2, 1415061121, 'enrol_database', 'dbuser', '', NULL),
(698, 2, 1415061121, 'enrol_database', 'dbpass', '', NULL),
(699, 2, 1415061121, 'enrol_database', 'dbname', '', NULL),
(700, 2, 1415061121, 'enrol_database', 'dbencoding', 'utf-8', NULL),
(701, 2, 1415061121, 'enrol_database', 'dbsetupsql', '', NULL),
(702, 2, 1415061121, 'enrol_database', 'dbsybasequoting', '0', NULL),
(703, 2, 1415061121, 'enrol_database', 'debugdb', '0', NULL),
(704, 2, 1415061121, 'enrol_database', 'localcoursefield', 'idnumber', NULL),
(705, 2, 1415061121, 'enrol_database', 'localuserfield', 'idnumber', NULL),
(706, 2, 1415061122, 'enrol_database', 'localrolefield', 'shortname', NULL),
(707, 2, 1415061122, 'enrol_database', 'localcategoryfield', 'id', NULL),
(708, 2, 1415061122, 'enrol_database', 'remoteenroltable', '', NULL),
(709, 2, 1415061122, 'enrol_database', 'remotecoursefield', '', NULL),
(710, 2, 1415061122, 'enrol_database', 'remoteuserfield', '', NULL),
(711, 2, 1415061122, 'enrol_database', 'remoterolefield', '', NULL),
(712, 2, 1415061122, 'enrol_database', 'defaultrole', '5', NULL),
(713, 2, 1415061122, 'enrol_database', 'ignorehiddencourses', '0', NULL),
(714, 2, 1415061122, 'enrol_database', 'unenrolaction', '0', NULL),
(715, 2, 1415061122, 'enrol_database', 'newcoursetable', '', NULL),
(716, 2, 1415061122, 'enrol_database', 'newcoursefullname', 'fullname', NULL),
(717, 2, 1415061122, 'enrol_database', 'newcourseshortname', 'shortname', NULL),
(718, 2, 1415061122, 'enrol_database', 'newcourseidnumber', 'idnumber', NULL),
(719, 2, 1415061122, 'enrol_database', 'newcoursecategory', '', NULL),
(720, 2, 1415061122, 'enrol_database', 'defaultcategory', '1', NULL),
(721, 2, 1415061122, 'enrol_database', 'templatecourse', '', NULL),
(722, 2, 1415061122, 'enrol_flatfile', 'location', '', NULL),
(723, 2, 1415061122, 'enrol_flatfile', 'encoding', 'UTF-8', NULL),
(724, 2, 1415061122, 'enrol_flatfile', 'mailstudents', '0', NULL),
(725, 2, 1415061122, 'enrol_flatfile', 'mailteachers', '0', NULL),
(726, 2, 1415061122, 'enrol_flatfile', 'mailadmins', '0', NULL),
(727, 2, 1415061122, 'enrol_flatfile', 'unenrolaction', '3', NULL),
(728, 2, 1415061122, 'enrol_flatfile', 'expiredaction', '3', NULL),
(729, 2, 1415061122, 'enrol_guest', 'requirepassword', '0', NULL),
(730, 2, 1415061122, 'enrol_guest', 'usepasswordpolicy', '0', NULL),
(731, 2, 1415061122, 'enrol_guest', 'showhint', '0', NULL),
(732, 2, 1415061122, 'enrol_guest', 'defaultenrol', '1', NULL),
(733, 2, 1415061122, 'enrol_guest', 'status', '1', NULL),
(734, 2, 1415061122, 'enrol_guest', 'status_adv', '', NULL),
(735, 2, 1415061122, 'enrol_imsenterprise', 'imsfilelocation', '', NULL),
(736, 2, 1415061122, 'enrol_imsenterprise', 'logtolocation', '', NULL),
(737, 2, 1415061122, 'enrol_imsenterprise', 'mailadmins', '0', NULL),
(738, 2, 1415061122, 'enrol_imsenterprise', 'createnewusers', '0', NULL),
(739, 2, 1415061122, 'enrol_imsenterprise', 'imsdeleteusers', '0', NULL),
(740, 2, 1415061122, 'enrol_imsenterprise', 'fixcaseusernames', '0', NULL),
(741, 2, 1415061122, 'enrol_imsenterprise', 'fixcasepersonalnames', '0', NULL),
(742, 2, 1415061122, 'enrol_imsenterprise', 'imssourcedidfallback', '0', NULL),
(743, 2, 1415061122, 'enrol_imsenterprise', 'imsrolemap01', '5', NULL),
(744, 2, 1415061122, 'enrol_imsenterprise', 'imsrolemap02', '3', NULL),
(745, 2, 1415061122, 'enrol_imsenterprise', 'imsrolemap03', '3', NULL),
(746, 2, 1415061122, 'enrol_imsenterprise', 'imsrolemap04', '5', NULL);
INSERT INTO `mdl_config_log` (`id`, `userid`, `timemodified`, `plugin`, `name`, `value`, `oldvalue`) VALUES
(747, 2, 1415061122, 'enrol_imsenterprise', 'imsrolemap05', '0', NULL),
(748, 2, 1415061122, 'enrol_imsenterprise', 'imsrolemap06', '4', NULL),
(749, 2, 1415061122, 'enrol_imsenterprise', 'imsrolemap07', '0', NULL),
(750, 2, 1415061122, 'enrol_imsenterprise', 'imsrolemap08', '4', NULL),
(751, 2, 1415061122, 'enrol_imsenterprise', 'truncatecoursecodes', '0', NULL),
(752, 2, 1415061122, 'enrol_imsenterprise', 'createnewcourses', '0', NULL),
(753, 2, 1415061122, 'enrol_imsenterprise', 'createnewcategories', '0', NULL),
(754, 2, 1415061122, 'enrol_imsenterprise', 'imsunenrol', '0', NULL),
(755, 2, 1415061122, 'enrol_imsenterprise', 'imscoursemapshortname', 'coursecode', NULL),
(756, 2, 1415061122, 'enrol_imsenterprise', 'imscoursemapfullname', 'short', NULL),
(757, 2, 1415061122, 'enrol_imsenterprise', 'imscoursemapsummary', 'ignore', NULL),
(758, 2, 1415061122, 'enrol_imsenterprise', 'imsrestricttarget', '', NULL),
(759, 2, 1415061122, 'enrol_imsenterprise', 'imscapitafix', '0', NULL),
(760, 2, 1415061122, 'enrol_ldap', 'host_url', '', NULL),
(761, 2, 1415061122, 'enrol_ldap', 'start_tls', '0', NULL),
(762, 2, 1415061122, 'enrol_ldap', 'ldap_version', '3', NULL),
(763, 2, 1415061122, 'enrol_ldap', 'ldapencoding', 'utf-8', NULL),
(764, 2, 1415061122, 'enrol_ldap', 'pagesize', '250', NULL),
(765, 2, 1415061122, 'enrol_ldap', 'bind_dn', '', NULL),
(766, 2, 1415061122, 'enrol_ldap', 'bind_pw', '', NULL),
(767, 2, 1415061122, 'enrol_ldap', 'course_search_sub', '0', NULL),
(768, 2, 1415061122, 'enrol_ldap', 'memberattribute_isdn', '0', NULL),
(769, 2, 1415061122, 'enrol_ldap', 'user_contexts', '', NULL),
(770, 2, 1415061122, 'enrol_ldap', 'user_search_sub', '0', NULL),
(771, 2, 1415061122, 'enrol_ldap', 'user_type', 'default', NULL),
(772, 2, 1415061122, 'enrol_ldap', 'opt_deref', '0', NULL),
(773, 2, 1415061122, 'enrol_ldap', 'idnumber_attribute', '', NULL),
(774, 2, 1415061122, 'enrol_ldap', 'objectclass', '', NULL),
(775, 2, 1415061122, 'enrol_ldap', 'course_idnumber', '', NULL),
(776, 2, 1415061122, 'enrol_ldap', 'course_shortname', '', NULL),
(777, 2, 1415061122, 'enrol_ldap', 'course_fullname', '', NULL),
(778, 2, 1415061122, 'enrol_ldap', 'course_summary', '', NULL),
(779, 2, 1415061122, 'enrol_ldap', 'ignorehiddencourses', '0', NULL),
(780, 2, 1415061122, 'enrol_ldap', 'unenrolaction', '0', NULL),
(781, 2, 1415061122, 'enrol_ldap', 'autocreate', '0', NULL),
(782, 2, 1415061122, 'enrol_ldap', 'category', '1', NULL),
(783, 2, 1415061122, 'enrol_ldap', 'template', '', NULL),
(784, 2, 1415061122, 'enrol_ldap', 'course_shortname_updateonsync', '0', NULL),
(785, 2, 1415061122, 'enrol_ldap', 'course_fullname_updateonsync', '0', NULL),
(786, 2, 1415061122, 'enrol_ldap', 'course_summary_updateonsync', '0', NULL),
(787, 2, 1415061122, 'enrol_ldap', 'nested_groups', '0', NULL),
(788, 2, 1415061122, 'enrol_ldap', 'group_memberofattribute', '', NULL),
(789, 2, 1415061122, 'enrol_manual', 'expiredaction', '1', NULL),
(790, 2, 1415061122, 'enrol_manual', 'expirynotifyhour', '6', NULL),
(791, 2, 1415061122, 'enrol_manual', 'defaultenrol', '1', NULL),
(792, 2, 1415061122, 'enrol_manual', 'status', '0', NULL),
(793, 2, 1415061122, 'enrol_manual', 'roleid', '5', NULL),
(794, 2, 1415061122, 'enrol_manual', 'enrolperiod', '0', NULL),
(795, 2, 1415061122, 'enrol_manual', 'expirynotify', '0', NULL),
(796, 2, 1415061122, 'enrol_manual', 'expirythreshold', '86400', NULL),
(797, 2, 1415061122, 'enrol_meta', 'nosyncroleids', '', NULL),
(798, 2, 1415061122, 'enrol_meta', 'syncall', '1', NULL),
(799, 2, 1415061122, 'enrol_meta', 'unenrolaction', '3', NULL),
(800, 2, 1415061122, 'enrol_mnet', 'roleid', '5', NULL),
(801, 2, 1415061122, 'enrol_mnet', 'roleid_adv', '1', NULL),
(802, 2, 1415061122, 'enrol_paypal', 'paypalbusiness', '', NULL),
(803, 2, 1415061122, 'enrol_paypal', 'mailstudents', '0', NULL),
(804, 2, 1415061122, 'enrol_paypal', 'mailteachers', '0', NULL),
(805, 2, 1415061122, 'enrol_paypal', 'mailadmins', '0', NULL),
(806, 2, 1415061122, 'enrol_paypal', 'expiredaction', '3', NULL),
(807, 2, 1415061122, 'enrol_paypal', 'status', '1', NULL),
(808, 2, 1415061122, 'enrol_paypal', 'cost', '0', NULL),
(809, 2, 1415061122, 'enrol_paypal', 'currency', 'USD', NULL),
(810, 2, 1415061122, 'enrol_paypal', 'roleid', '5', NULL),
(811, 2, 1415061122, 'enrol_paypal', 'enrolperiod', '0', NULL),
(812, 2, 1415061122, 'enrol_self', 'requirepassword', '0', NULL),
(813, 2, 1415061122, 'enrol_self', 'usepasswordpolicy', '0', NULL),
(814, 2, 1415061122, 'enrol_self', 'showhint', '0', NULL),
(815, 2, 1415061122, 'enrol_self', 'expiredaction', '1', NULL),
(816, 2, 1415061122, 'enrol_self', 'expirynotifyhour', '6', NULL),
(817, 2, 1415061122, 'enrol_self', 'defaultenrol', '1', NULL),
(818, 2, 1415061122, 'enrol_self', 'status', '1', NULL),
(819, 2, 1415061122, 'enrol_self', 'newenrols', '1', NULL),
(820, 2, 1415061122, 'enrol_self', 'groupkey', '0', NULL),
(821, 2, 1415061122, 'enrol_self', 'roleid', '5', NULL),
(822, 2, 1415061122, 'enrol_self', 'enrolperiod', '0', NULL),
(823, 2, 1415061122, 'enrol_self', 'expirynotify', '0', NULL),
(824, 2, 1415061122, 'enrol_self', 'expirythreshold', '86400', NULL),
(825, 2, 1415061122, 'enrol_self', 'longtimenosee', '0', NULL),
(826, 2, 1415061122, 'enrol_self', 'maxenrolled', '0', NULL),
(827, 2, 1415061122, 'enrol_self', 'sendcoursewelcomemessage', '1', NULL),
(828, 2, 1415061122, NULL, 'filter_censor_badwords', '', NULL),
(829, 2, 1415061122, 'filter_emoticon', 'formats', '1,4,0', NULL),
(830, 2, 1415061122, 'filter_mathjaxloader', 'httpurl', 'http://cdn.mathjax.org/mathjax/2.3-latest/MathJax.js', NULL),
(831, 2, 1415061122, 'filter_mathjaxloader', 'httpsurl', 'https://cdn.mathjax.org/mathjax/2.3-latest/MathJax.js', NULL),
(832, 2, 1415061122, 'filter_mathjaxloader', 'texfiltercompatibility', '0', NULL),
(833, 2, 1415061122, 'filter_mathjaxloader', 'mathjaxconfig', '\nMathJax.Hub.Config({\n    config: ["MMLorHTML.js", "Safe.js"],\n    jax: ["input/TeX","input/MathML","output/HTML-CSS","output/NativeMML"],\n    extensions: ["tex2jax.js","mml2jax.js","MathMenu.js","MathZoom.js"],\n    TeX: {\n        extensions: ["AMSmath.js","AMSsymbols.js","noErrors.js","noUndefined.js"]\n    },\n    menuSettings: {\n        zoom: "Double-Click",\n        mpContext: true,\n        mpMouse: true\n    },\n    errorSettings: { message: ["!"] },\n    skipStartupTypeset: true,\n    messageStyle: "none"\n});\n', NULL),
(834, 2, 1415061122, 'filter_mathjaxloader', 'additionaldelimiters', '', NULL),
(835, 2, 1415061122, NULL, 'filter_multilang_force_old', '0', NULL),
(836, 2, 1415061122, 'filter_tex', 'latexpreamble', '\\usepackage[latin1]{inputenc}\n\\usepackage{amsmath}\n\\usepackage{amsfonts}\n\\RequirePackage{amsmath,amssymb,latexsym}\n', NULL),
(837, 2, 1415061122, 'filter_tex', 'latexbackground', '#FFFFFF', NULL),
(838, 2, 1415061122, 'filter_tex', 'density', '120', NULL),
(839, 2, 1415061122, 'filter_tex', 'pathlatex', '/sw/bin/latex', NULL),
(840, 2, 1415061122, 'filter_tex', 'pathdvips', '/sw/bin/dvips', NULL),
(841, 2, 1415061122, 'filter_tex', 'pathconvert', '/sw/bin/convert', NULL),
(842, 2, 1415061122, 'filter_tex', 'pathmimetex', '', NULL),
(843, 2, 1415061122, 'filter_tex', 'convertformat', 'gif', NULL),
(844, 2, 1415061122, 'filter_urltolink', 'formats', '0', NULL),
(845, 2, 1415061122, 'filter_urltolink', 'embedimages', '1', NULL),
(846, 2, 1415061122, 'logstore_database', 'dbdriver', '', NULL),
(847, 2, 1415061122, 'logstore_database', 'dbhost', '', NULL),
(848, 2, 1415061122, 'logstore_database', 'dbuser', '', NULL),
(849, 2, 1415061122, 'logstore_database', 'dbpass', '', NULL),
(850, 2, 1415061122, 'logstore_database', 'dbname', '', NULL),
(851, 2, 1415061122, 'logstore_database', 'dbtable', '', NULL),
(852, 2, 1415061122, 'logstore_database', 'dbpersist', '0', NULL),
(853, 2, 1415061122, 'logstore_database', 'dbsocket', '', NULL),
(854, 2, 1415061122, 'logstore_database', 'dbport', '', NULL),
(855, 2, 1415061122, 'logstore_database', 'dbschema', '', NULL),
(856, 2, 1415061122, 'logstore_database', 'dbcollation', '', NULL),
(857, 2, 1415061122, 'logstore_database', 'buffersize', '50', NULL),
(858, 2, 1415061122, 'logstore_database', 'logguests', '0', NULL),
(859, 2, 1415061122, 'logstore_database', 'includelevels', '1,2,0', NULL),
(860, 2, 1415061122, 'logstore_database', 'includeactions', 'c,r,u,d', NULL),
(861, 2, 1415061122, 'logstore_legacy', 'loglegacy', '0', NULL),
(862, 2, 1415061122, NULL, 'logguests', '1', NULL),
(863, 2, 1415061122, NULL, 'loglifetime', '0', NULL),
(864, 2, 1415061122, 'logstore_standard', 'logguests', '1', NULL),
(865, 2, 1415061122, 'logstore_standard', 'loglifetime', '0', NULL),
(866, 2, 1415061122, 'logstore_standard', 'buffersize', '50', NULL),
(867, 2, 1415061122, NULL, 'airnotifierurl', 'https://messages.moodle.net', NULL),
(868, 2, 1415061122, NULL, 'airnotifierport', '443', NULL),
(869, 2, 1415061122, NULL, 'airnotifiermobileappname', 'com.moodle.moodlemobile', NULL),
(870, 2, 1415061122, NULL, 'airnotifierappname', 'commoodlemoodlemobile', NULL),
(871, 2, 1415061122, NULL, 'airnotifieraccesskey', '', NULL),
(872, 2, 1415061122, NULL, 'smtphosts', '', NULL),
(873, 2, 1415061122, NULL, 'smtpsecure', '', NULL),
(874, 2, 1415061122, NULL, 'smtpuser', '', NULL),
(875, 2, 1415061122, NULL, 'smtppass', '', NULL),
(876, 2, 1415061122, NULL, 'smtpmaxbulk', '1', NULL),
(877, 2, 1415061122, NULL, 'noreplyaddress', 'noreply@localhost', NULL),
(878, 2, 1415061122, NULL, 'emailonlyfromnoreplyaddress', '0', NULL),
(879, 2, 1415061122, NULL, 'sitemailcharset', '0', NULL),
(880, 2, 1415061122, NULL, 'allowusermailcharset', '0', NULL),
(881, 2, 1415061122, NULL, 'allowattachments', '1', NULL),
(882, 2, 1415061122, NULL, 'mailnewline', 'LF', NULL),
(883, 2, 1415061122, NULL, 'jabberhost', '', NULL),
(884, 2, 1415061122, NULL, 'jabberserver', '', NULL),
(885, 2, 1415061122, NULL, 'jabberusername', '', NULL),
(886, 2, 1415061122, NULL, 'jabberpassword', '', NULL),
(887, 2, 1415061122, NULL, 'jabberport', '5222', NULL),
(888, 2, 1415061122, 'editor_atto', 'toolbar', 'collapse = collapse\nstyle1 = title, bold, italic\nlist = unorderedlist, orderedlist\nlinks = link\nfiles = image, media, managefiles\nstyle2 = underline, strike, subscript, superscript\nalign = align\nindent = indent\ninsert = equation, charmap, table, clear\nundo = undo\naccessibility = accessibilitychecker, accessibilityhelper\nother = html', NULL),
(889, 2, 1415061122, 'atto_collapse', 'showgroups', '5', NULL),
(890, 2, 1415061122, 'atto_equation', 'librarygroup1', '\n\\cdot\n\\times\n\\ast\n\\div\n\\diamond\n\\pm\n\\mp\n\\oplus\n\\ominus\n\\otimes\n\\oslash\n\\odot\n\\circ\n\\bullet\n\\asymp\n\\equiv\n\\subseteq\n\\supseteq\n\\leq\n\\geq\n\\preceq\n\\succeq\n\\sim\n\\simeq\n\\approx\n\\subset\n\\supset\n\\ll\n\\gg\n\\prec\n\\succ\n\\infty\n\\in\n\\ni\n\\forall\n\\exists\n\\neq\n', NULL),
(891, 2, 1415061123, 'atto_equation', 'librarygroup2', '\n\\leftarrow\n\\rightarrow\n\\uparrow\n\\downarrow\n\\leftrightarrow\n\\nearrow\n\\searrow\n\\swarrow\n\\nwarrow\n\\Leftarrow\n\\Rightarrow\n\\Uparrow\n\\Downarrow\n\\Leftrightarrow\n', NULL),
(892, 2, 1415061123, 'atto_equation', 'librarygroup3', '\n\\alpha\n\\beta\n\\gamma\n\\delta\n\\epsilon\n\\zeta\n\\eta\n\\theta\n\\iota\n\\kappa\n\\lambda\n\\mu\n\\nu\n\\xi\n\\pi\n\\rho\n\\sigma\n\\tau\n\\upsilon\n\\phi\n\\chi\n\\psi\n\\omega\n\\Gamma\n\\Delta\n\\Theta\n\\Lambda\n\\Xi\n\\Pi\n\\Sigma\n\\Upsilon\n\\Phi\n\\Psi\n\\Omega\n', NULL),
(893, 2, 1415061123, 'atto_equation', 'librarygroup4', '\n\\sum{a,b}\n\\int_{a}^{b}{c}\n\\iint_{a}^{b}{c}\n\\iiint_{a}^{b}{c}\n\\oint{a}\n(a)\n[a]\n\\lbrace{a}\\rbrace\n\\left| \\begin{matrix} a_1 & a_2 \\ a_3 & a_4 \\end{matrix} \\right|\n', NULL),
(894, 2, 1415061123, 'editor_tinymce', 'customtoolbar', 'wrap,formatselect,wrap,bold,italic,wrap,bullist,numlist,wrap,link,unlink,wrap,image\n\nundo,redo,wrap,underline,strikethrough,sub,sup,wrap,justifyleft,justifycenter,justifyright,wrap,outdent,indent,wrap,forecolor,backcolor,wrap,ltr,rtl\n\nfontselect,fontsizeselect,wrap,code,search,replace,wrap,nonbreaking,charmap,table,wrap,cleanup,removeformat,pastetext,pasteword,wrap,fullscreen', NULL),
(895, 2, 1415061123, 'editor_tinymce', 'fontselectlist', 'Trebuchet=Trebuchet MS,Verdana,Arial,Helvetica,sans-serif;Arial=arial,helvetica,sans-serif;Courier New=courier new,courier,monospace;Georgia=georgia,times new roman,times,serif;Tahoma=tahoma,arial,helvetica,sans-serif;Times New Roman=times new roman,times,serif;Verdana=verdana,arial,helvetica,sans-serif;Impact=impact;Wingdings=wingdings', NULL),
(896, 2, 1415061123, 'editor_tinymce', 'customconfig', '', NULL),
(897, 2, 1415061123, 'tinymce_dragmath', 'requiretex', '1', NULL),
(898, 2, 1415061123, 'tinymce_moodleemoticon', 'requireemoticon', '1', NULL),
(899, 2, 1415061123, 'tinymce_spellchecker', 'spellengine', '', NULL),
(900, 2, 1415061123, 'tinymce_spellchecker', 'spelllanguagelist', '+English=en,Danish=da,Dutch=nl,Finnish=fi,French=fr,German=de,Italian=it,Polish=pl,Portuguese=pt,Spanish=es,Swedish=sv', NULL),
(901, 2, 1415061123, NULL, 'profileroles', '5,4,3', NULL),
(902, 2, 1415061123, NULL, 'coursecontact', '3', NULL),
(903, 2, 1415061123, NULL, 'frontpage', '6', NULL),
(904, 2, 1415061123, NULL, 'frontpageloggedin', '6', NULL),
(905, 2, 1415061123, NULL, 'maxcategorydepth', '2', NULL),
(906, 2, 1415061123, NULL, 'frontpagecourselimit', '200', NULL),
(907, 2, 1415061123, NULL, 'commentsperpage', '15', NULL),
(908, 2, 1415061123, NULL, 'defaultfrontpageroleid', '8', NULL),
(909, 2, 1415061123, NULL, 'supportname', 'Admin User', NULL),
(910, 2, 1415061123, NULL, 'supportemail', 'dom_2789@yahoo.com', NULL),
(911, 2, 1415061184, NULL, 'registerauth', '', NULL),
(912, 2, 1415061497, NULL, 'lang', 'es', 'en'),
(913, 2, 1415062266, NULL, 'guestloginbutton', '0', '1'),
(914, 2, 1415062656, NULL, 'frontpage', '', '6'),
(915, 2, 1415062656, NULL, 'frontpageloggedin', '5', '6'),
(916, 2, 1415062842, NULL, 'forcelogin', '1', '0'),
(917, 2, 1415062842, NULL, 'profileroles', '3,4,5', '5,4,3'),
(918, 2, 1415156950, 'theme_clean', 'logo', '/capacita_logo.gif', ''),
(919, 2, 1415156951, 'theme_clean', 'customcss', 'body {background: #DDDDDD;color: #000;margin: 0;}\r\n\r\n.container-fluid{margin: 0 auto;width: 85%;box-shadow: 0 0 0 10px rgba(0,0,0,.07);background-color: #fff;}\r\n\r\n.skiplinks, .navbar{	position: absolute; top: 0; left: 0;width: 100%;height: 190px; z-index: -1;}\r\n.skiplinks, .navbar{\r\n	background: #17517a; /* Old browsers */\r\n	background: -moz-linear-gradient(top,  #17517a 0%, #17517a 69%, #124162 69%, #124162 100%); /* FF3.6+ */\r\n	background: -webkit-gradient(linear, left top, left bottom, color-stop(0%,#17517a), color-stop(69%,#17517a), color-stop(69%,#124162), color-stop(100%,#124162)); /* Chrome,Safari4+ */\r\n	background: -webkit-linear-gradient(top,  #17517a 0%,#17517a 69%,#124162 69%,#124162 100%); /* Chrome10+,Safari5.1+ */\r\n	background: -o-linear-gradient(top,  #17517a 0%,#17517a 69%,#124162 69%,#124162 100%); /* Opera 11.10+ */\r\n	background: -ms-linear-gradient(top,  #17517a 0%,#17517a 69%,#124162 69%,#124162 100%); /* IE10+ */\r\n	background: linear-gradient(top,  #17517a 0%,#17517a 69%,#124162 69%,#124162 100%); /* W3C */\r\n	filter: progid:DXImageTransform.Microsoft.gradient( startColorstr=''#17517a'', endColorstr=''#124162'',GradientType=0 ); /* IE6-9 */\r\n}', ''),
(920, 2, 1415300929, NULL, 'autolang', '0', '1'),
(921, 2, 1415420132, 'theme_clean', 'customcss', 'body {background: #DDDDDD;color: #000;margin: 0;}\r\n\r\n.container-fluid{margin: 0 auto;width: 85%;box-shadow: 0 0 0 10px rgba(0,0,0,.07);background-color: #fff;}\r\n\r\n.skiplinks, .navbar{	position: absolute; top: 0; left: 0;width: 100%;height: 190px; }\r\n.skiplinks, .navbar{\r\n	background: #17517a; /* Old browsers */\r\n	background: -moz-linear-gradient(top,  #17517a 0%, #17517a 69%, #124162 69%, #124162 100%); /* FF3.6+ */\r\n	background: -webkit-gradient(linear, left top, left bottom, color-stop(0%,#17517a), color-stop(69%,#17517a), color-stop(69%,#124162), color-stop(100%,#124162)); /* Chrome,Safari4+ */\r\n	background: -webkit-linear-gradient(top,  #17517a 0%,#17517a 69%,#124162 69%,#124162 100%); /* Chrome10+,Safari5.1+ */\r\n	background: -o-linear-gradient(top,  #17517a 0%,#17517a 69%,#124162 69%,#124162 100%); /* Opera 11.10+ */\r\n	background: -ms-linear-gradient(top,  #17517a 0%,#17517a 69%,#124162 69%,#124162 100%); /* IE10+ */\r\n	background: linear-gradient(top,  #17517a 0%,#17517a 69%,#124162 69%,#124162 100%); /* W3C */\r\n	filter: progid:DXImageTransform.Microsoft.gradient( startColorstr=''#17517a'', endColorstr=''#124162'',GradientType=0 ); /* IE6-9 */\r\n}', 'body {background: #DDDDDD;color: #000;margin: 0;}\r\n\r\n.container-fluid{margin: 0 auto;width: 85%;box-shadow: 0 0 0 10px rgba(0,0,0,.07);background-color: #fff;}\r\n\r\n.skiplinks, .navbar{	position: absolute; top: 0; left: 0;width: 100%;height: 190px; z-index: -1;}\r\n.skiplinks, .navbar{\r\n	background: #17517a; /* Old browsers */\r\n	background: -moz-linear-gradient(top,  #17517a 0%, #17517a 69%, #124162 69%, #124162 100%); /* FF3.6+ */\r\n	background: -webkit-gradient(linear, left top, left bottom, color-stop(0%,#17517a), color-stop(69%,#17517a), color-stop(69%,#124162), color-stop(100%,#124162)); /* Chrome,Safari4+ */\r\n	background: -webkit-linear-gradient(top,  #17517a 0%,#17517a 69%,#124162 69%,#124162 100%); /* Chrome10+,Safari5.1+ */\r\n	background: -o-linear-gradient(top,  #17517a 0%,#17517a 69%,#124162 69%,#124162 100%); /* Opera 11.10+ */\r\n	background: -ms-linear-gradient(top,  #17517a 0%,#17517a 69%,#124162 69%,#124162 100%); /* IE10+ */\r\n	background: linear-gradient(top,  #17517a 0%,#17517a 69%,#124162 69%,#124162 100%); /* W3C */\r\n	filter: progid:DXImageTransform.Microsoft.gradient( startColorstr=''#17517a'', endColorstr=''#124162'',GradientType=0 ); /* IE6-9 */\r\n}'),
(922, 2, 1415420170, 'theme_clean', 'customcss', 'body {background: #DDDDDD;color: #000;margin: 0;}\r\n\r\n.container-fluid{margin: 0 auto;width: 85%;box-shadow: 0 0 0 10px rgba(0,0,0,.07);background-color: #fff; }\r\n\r\n.skiplinks, .navbar{	position: absolute; top: 0; left: 0;width: 100%;height: 190px; z-index: -1; top: 200px;}\r\n.skiplinks, .navbar{\r\n	background: #17517a; /* Old browsers */\r\n	background: -moz-linear-gradient(top,  #17517a 0%, #17517a 69%, #124162 69%, #124162 100%); /* FF3.6+ */\r\n	background: -webkit-gradient(linear, left top, left bottom, color-stop(0%,#17517a), color-stop(69%,#17517a), color-stop(69%,#124162), color-stop(100%,#124162)); /* Chrome,Safari4+ */\r\n	background: -webkit-linear-gradient(top,  #17517a 0%,#17517a 69%,#124162 69%,#124162 100%); /* Chrome10+,Safari5.1+ */\r\n	background: -o-linear-gradient(top,  #17517a 0%,#17517a 69%,#124162 69%,#124162 100%); /* Opera 11.10+ */\r\n	background: -ms-linear-gradient(top,  #17517a 0%,#17517a 69%,#124162 69%,#124162 100%); /* IE10+ */\r\n	background: linear-gradient(top,  #17517a 0%,#17517a 69%,#124162 69%,#124162 100%); /* W3C */\r\n	filter: progid:DXImageTransform.Microsoft.gradient( startColorstr=''#17517a'', endColorstr=''#124162'',GradientType=0 ); /* IE6-9 */\r\n}', 'body {background: #DDDDDD;color: #000;margin: 0;}\r\n\r\n.container-fluid{margin: 0 auto;width: 85%;box-shadow: 0 0 0 10px rgba(0,0,0,.07);background-color: #fff;}\r\n\r\n.skiplinks, .navbar{	position: absolute; top: 0; left: 0;width: 100%;height: 190px; }\r\n.skiplinks, .navbar{\r\n	background: #17517a; /* Old browsers */\r\n	background: -moz-linear-gradient(top,  #17517a 0%, #17517a 69%, #124162 69%, #124162 100%); /* FF3.6+ */\r\n	background: -webkit-gradient(linear, left top, left bottom, color-stop(0%,#17517a), color-stop(69%,#17517a), color-stop(69%,#124162), color-stop(100%,#124162)); /* Chrome,Safari4+ */\r\n	background: -webkit-linear-gradient(top,  #17517a 0%,#17517a 69%,#124162 69%,#124162 100%); /* Chrome10+,Safari5.1+ */\r\n	background: -o-linear-gradient(top,  #17517a 0%,#17517a 69%,#124162 69%,#124162 100%); /* Opera 11.10+ */\r\n	background: -ms-linear-gradient(top,  #17517a 0%,#17517a 69%,#124162 69%,#124162 100%); /* IE10+ */\r\n	background: linear-gradient(top,  #17517a 0%,#17517a 69%,#124162 69%,#124162 100%); /* W3C */\r\n	filter: progid:DXImageTransform.Microsoft.gradient( startColorstr=''#17517a'', endColorstr=''#124162'',GradientType=0 ); /* IE6-9 */\r\n}'),
(923, 2, 1415420196, 'theme_clean', 'customcss', 'body {background: #DDDDDD;color: #000;margin: 0;}\r\n\r\n.container-fluid{margin: 0 auto;width: 85%;box-shadow: 0 0 0 10px rgba(0,0,0,.07);background-color: #fff; }\r\n\r\n.skiplinks, .navbar{	position: absolute; top: 0; left: 0;width: 100%;height: 190px; z-index: 0;}\r\n.skiplinks, .navbar{\r\n	background: #17517a; /* Old browsers */\r\n	background: -moz-linear-gradient(top,  #17517a 0%, #17517a 69%, #124162 69%, #124162 100%); /* FF3.6+ */\r\n	background: -webkit-gradient(linear, left top, left bottom, color-stop(0%,#17517a), color-stop(69%,#17517a), color-stop(69%,#124162), color-stop(100%,#124162)); /* Chrome,Safari4+ */\r\n	background: -webkit-linear-gradient(top,  #17517a 0%,#17517a 69%,#124162 69%,#124162 100%); /* Chrome10+,Safari5.1+ */\r\n	background: -o-linear-gradient(top,  #17517a 0%,#17517a 69%,#124162 69%,#124162 100%); /* Opera 11.10+ */\r\n	background: -ms-linear-gradient(top,  #17517a 0%,#17517a 69%,#124162 69%,#124162 100%); /* IE10+ */\r\n	background: linear-gradient(top,  #17517a 0%,#17517a 69%,#124162 69%,#124162 100%); /* W3C */\r\n	filter: progid:DXImageTransform.Microsoft.gradient( startColorstr=''#17517a'', endColorstr=''#124162'',GradientType=0 ); /* IE6-9 */\r\n}', 'body {background: #DDDDDD;color: #000;margin: 0;}\r\n\r\n.container-fluid{margin: 0 auto;width: 85%;box-shadow: 0 0 0 10px rgba(0,0,0,.07);background-color: #fff; }\r\n\r\n.skiplinks, .navbar{	position: absolute; top: 0; left: 0;width: 100%;height: 190px; z-index: -1; top: 200px;}\r\n.skiplinks, .navbar{\r\n	background: #17517a; /* Old browsers */\r\n	background: -moz-linear-gradient(top,  #17517a 0%, #17517a 69%, #124162 69%, #124162 100%); /* FF3.6+ */\r\n	background: -webkit-gradient(linear, left top, left bottom, color-stop(0%,#17517a), color-stop(69%,#17517a), color-stop(69%,#124162), color-stop(100%,#124162)); /* Chrome,Safari4+ */\r\n	background: -webkit-linear-gradient(top,  #17517a 0%,#17517a 69%,#124162 69%,#124162 100%); /* Chrome10+,Safari5.1+ */\r\n	background: -o-linear-gradient(top,  #17517a 0%,#17517a 69%,#124162 69%,#124162 100%); /* Opera 11.10+ */\r\n	background: -ms-linear-gradient(top,  #17517a 0%,#17517a 69%,#124162 69%,#124162 100%); /* IE10+ */\r\n	background: linear-gradient(top,  #17517a 0%,#17517a 69%,#124162 69%,#124162 100%); /* W3C */\r\n	filter: progid:DXImageTransform.Microsoft.gradient( startColorstr=''#17517a'', endColorstr=''#124162'',GradientType=0 ); /* IE6-9 */\r\n}'),
(924, 2, 1415420220, 'theme_clean', 'customcss', 'body {background: #DDDDDD;color: #000;margin: 0;}\r\n\r\n.container-fluid{margin: 0 auto;width: 85%;box-shadow: 0 0 0 10px rgba(0,0,0,.07);background-color: #fff; }\r\n\r\n.skiplinks, .navbar{	position: absolute; top: 0; left: 0;width: 100%;height: 190px; z-index: -1;}\r\n.skiplinks, .navbar{\r\n	background: #17517a; /* Old browsers */\r\n	background: -moz-linear-gradient(top,  #17517a 0%, #17517a 69%, #124162 69%, #124162 100%); /* FF3.6+ */\r\n	background: -webkit-gradient(linear, left top, left bottom, color-stop(0%,#17517a), color-stop(69%,#17517a), color-stop(69%,#124162), color-stop(100%,#124162)); /* Chrome,Safari4+ */\r\n	background: -webkit-linear-gradient(top,  #17517a 0%,#17517a 69%,#124162 69%,#124162 100%); /* Chrome10+,Safari5.1+ */\r\n	background: -o-linear-gradient(top,  #17517a 0%,#17517a 69%,#124162 69%,#124162 100%); /* Opera 11.10+ */\r\n	background: -ms-linear-gradient(top,  #17517a 0%,#17517a 69%,#124162 69%,#124162 100%); /* IE10+ */\r\n	background: linear-gradient(top,  #17517a 0%,#17517a 69%,#124162 69%,#124162 100%); /* W3C */\r\n	filter: progid:DXImageTransform.Microsoft.gradient( startColorstr=''#17517a'', endColorstr=''#124162'',GradientType=0 ); /* IE6-9 */\r\n}', 'body {background: #DDDDDD;color: #000;margin: 0;}\r\n\r\n.container-fluid{margin: 0 auto;width: 85%;box-shadow: 0 0 0 10px rgba(0,0,0,.07);background-color: #fff; }\r\n\r\n.skiplinks, .navbar{	position: absolute; top: 0; left: 0;width: 100%;height: 190px; z-index: 0;}\r\n.skiplinks, .navbar{\r\n	background: #17517a; /* Old browsers */\r\n	background: -moz-linear-gradient(top,  #17517a 0%, #17517a 69%, #124162 69%, #124162 100%); /* FF3.6+ */\r\n	background: -webkit-gradient(linear, left top, left bottom, color-stop(0%,#17517a), color-stop(69%,#17517a), color-stop(69%,#124162), color-stop(100%,#124162)); /* Chrome,Safari4+ */\r\n	background: -webkit-linear-gradient(top,  #17517a 0%,#17517a 69%,#124162 69%,#124162 100%); /* Chrome10+,Safari5.1+ */\r\n	background: -o-linear-gradient(top,  #17517a 0%,#17517a 69%,#124162 69%,#124162 100%); /* Opera 11.10+ */\r\n	background: -ms-linear-gradient(top,  #17517a 0%,#17517a 69%,#124162 69%,#124162 100%); /* IE10+ */\r\n	background: linear-gradient(top,  #17517a 0%,#17517a 69%,#124162 69%,#124162 100%); /* W3C */\r\n	filter: progid:DXImageTransform.Microsoft.gradient( startColorstr=''#17517a'', endColorstr=''#124162'',GradientType=0 ); /* IE6-9 */\r\n}'),
(925, 2, 1415682237, 'theme_clean', 'customcss', 'body {background: #DDDDDD;color: #000;margin: 0;width: 85%;}\r\n\r\n.container-fluid{margin: 0 auto;width: 85%;box-shadow: 0 0 0 10px rgba(0,0,0,.07);background-color: #fff; }\r\n\r\n.skiplinks, .navbar{	position: absolute; top: 0; left: 0;width: 100%;height: 190px; z-index: -1;}\r\n.skiplinks, .navbar{\r\n	background: #17517a; /* Old browsers */\r\n	background: -moz-linear-gradient(top,  #17517a 0%, #17517a 69%, #124162 69%, #124162 100%); /* FF3.6+ */\r\n	background: -webkit-gradient(linear, left top, left bottom, color-stop(0%,#17517a), color-stop(69%,#17517a), color-stop(69%,#124162), color-stop(100%,#124162)); /* Chrome,Safari4+ */\r\n	background: -webkit-linear-gradient(top,  #17517a 0%,#17517a 69%,#124162 69%,#124162 100%); /* Chrome10+,Safari5.1+ */\r\n	background: -o-linear-gradient(top,  #17517a 0%,#17517a 69%,#124162 69%,#124162 100%); /* Opera 11.10+ */\r\n	background: -ms-linear-gradient(top,  #17517a 0%,#17517a 69%,#124162 69%,#124162 100%); /* IE10+ */\r\n	background: linear-gradient(top,  #17517a 0%,#17517a 69%,#124162 69%,#124162 100%); /* W3C */\r\n	filter: progid:DXImageTransform.Microsoft.gradient( startColorstr=''#17517a'', endColorstr=''#124162'',GradientType=0 ); /* IE6-9 */\r\n}', 'body {background: #DDDDDD;color: #000;margin: 0;}\r\n\r\n.container-fluid{margin: 0 auto;width: 85%;box-shadow: 0 0 0 10px rgba(0,0,0,.07);background-color: #fff; }\r\n\r\n.skiplinks, .navbar{	position: absolute; top: 0; left: 0;width: 100%;height: 190px; z-index: -1;}\r\n.skiplinks, .navbar{\r\n	background: #17517a; /* Old browsers */\r\n	background: -moz-linear-gradient(top,  #17517a 0%, #17517a 69%, #124162 69%, #124162 100%); /* FF3.6+ */\r\n	background: -webkit-gradient(linear, left top, left bottom, color-stop(0%,#17517a), color-stop(69%,#17517a), color-stop(69%,#124162), color-stop(100%,#124162)); /* Chrome,Safari4+ */\r\n	background: -webkit-linear-gradient(top,  #17517a 0%,#17517a 69%,#124162 69%,#124162 100%); /* Chrome10+,Safari5.1+ */\r\n	background: -o-linear-gradient(top,  #17517a 0%,#17517a 69%,#124162 69%,#124162 100%); /* Opera 11.10+ */\r\n	background: -ms-linear-gradient(top,  #17517a 0%,#17517a 69%,#124162 69%,#124162 100%); /* IE10+ */\r\n	background: linear-gradient(top,  #17517a 0%,#17517a 69%,#124162 69%,#124162 100%); /* W3C */\r\n	filter: progid:DXImageTransform.Microsoft.gradient( startColorstr=''#17517a'', endColorstr=''#124162'',GradientType=0 ); /* IE6-9 */\r\n}'),
(926, 2, 1415682255, 'theme_clean', 'customcss', 'body {background: #DDDDDD;color: #000;margin: 0;}\r\n\r\n.container-fluid{margin: 0 auto;width: 85%;box-shadow: 0 0 0 10px rgba(0,0,0,.07);background-color: #fff; }\r\n\r\n.skiplinks, .navbar{	position: absolute; top: 0; left: 0;width: 100%;height: 190px; z-index: -1;}\r\n.skiplinks, .navbar{\r\n	background: #17517a; /* Old browsers */\r\n	background: -moz-linear-gradient(top,  #17517a 0%, #17517a 69%, #124162 69%, #124162 100%); /* FF3.6+ */\r\n	background: -webkit-gradient(linear, left top, left bottom, color-stop(0%,#17517a), color-stop(69%,#17517a), color-stop(69%,#124162), color-stop(100%,#124162)); /* Chrome,Safari4+ */\r\n	background: -webkit-linear-gradient(top,  #17517a 0%,#17517a 69%,#124162 69%,#124162 100%); /* Chrome10+,Safari5.1+ */\r\n	background: -o-linear-gradient(top,  #17517a 0%,#17517a 69%,#124162 69%,#124162 100%); /* Opera 11.10+ */\r\n	background: -ms-linear-gradient(top,  #17517a 0%,#17517a 69%,#124162 69%,#124162 100%); /* IE10+ */\r\n	background: linear-gradient(top,  #17517a 0%,#17517a 69%,#124162 69%,#124162 100%); /* W3C */\r\n	filter: progid:DXImageTransform.Microsoft.gradient( startColorstr=''#17517a'', endColorstr=''#124162'',GradientType=0 ); /* IE6-9 */\r\n}', 'body {background: #DDDDDD;color: #000;margin: 0;width: 85%;}\r\n\r\n.container-fluid{margin: 0 auto;width: 85%;box-shadow: 0 0 0 10px rgba(0,0,0,.07);background-color: #fff; }\r\n\r\n.skiplinks, .navbar{	position: absolute; top: 0; left: 0;width: 100%;height: 190px; z-index: -1;}\r\n.skiplinks, .navbar{\r\n	background: #17517a; /* Old browsers */\r\n	background: -moz-linear-gradient(top,  #17517a 0%, #17517a 69%, #124162 69%, #124162 100%); /* FF3.6+ */\r\n	background: -webkit-gradient(linear, left top, left bottom, color-stop(0%,#17517a), color-stop(69%,#17517a), color-stop(69%,#124162), color-stop(100%,#124162)); /* Chrome,Safari4+ */\r\n	background: -webkit-linear-gradient(top,  #17517a 0%,#17517a 69%,#124162 69%,#124162 100%); /* Chrome10+,Safari5.1+ */\r\n	background: -o-linear-gradient(top,  #17517a 0%,#17517a 69%,#124162 69%,#124162 100%); /* Opera 11.10+ */\r\n	background: -ms-linear-gradient(top,  #17517a 0%,#17517a 69%,#124162 69%,#124162 100%); /* IE10+ */\r\n	background: linear-gradient(top,  #17517a 0%,#17517a 69%,#124162 69%,#124162 100%); /* W3C */\r\n	filter: progid:DXImageTransform.Microsoft.gradient( startColorstr=''#17517a'', endColorstr=''#124162'',GradientType=0 ); /* IE6-9 */\r\n}'),
(927, 2, 1415682269, 'theme_clean', 'customcss', 'body {background: #DDDDDD;color: #000;margin: 0;}\r\n\r\n', 'body {background: #DDDDDD;color: #000;margin: 0;}\r\n\r\n.container-fluid{margin: 0 auto;width: 85%;box-shadow: 0 0 0 10px rgba(0,0,0,.07);background-color: #fff; }\r\n\r\n.skiplinks, .navbar{	position: absolute; top: 0; left: 0;width: 100%;height: 190px; z-index: -1;}\r\n.skiplinks, .navbar{\r\n	background: #17517a; /* Old browsers */\r\n	background: -moz-linear-gradient(top,  #17517a 0%, #17517a 69%, #124162 69%, #124162 100%); /* FF3.6+ */\r\n	background: -webkit-gradient(linear, left top, left bottom, color-stop(0%,#17517a), color-stop(69%,#17517a), color-stop(69%,#124162), color-stop(100%,#124162)); /* Chrome,Safari4+ */\r\n	background: -webkit-linear-gradient(top,  #17517a 0%,#17517a 69%,#124162 69%,#124162 100%); /* Chrome10+,Safari5.1+ */\r\n	background: -o-linear-gradient(top,  #17517a 0%,#17517a 69%,#124162 69%,#124162 100%); /* Opera 11.10+ */\r\n	background: -ms-linear-gradient(top,  #17517a 0%,#17517a 69%,#124162 69%,#124162 100%); /* IE10+ */\r\n	background: linear-gradient(top,  #17517a 0%,#17517a 69%,#124162 69%,#124162 100%); /* W3C */\r\n	filter: progid:DXImageTransform.Microsoft.gradient( startColorstr=''#17517a'', endColorstr=''#124162'',GradientType=0 ); /* IE6-9 */\r\n}'),
(928, 2, 1415682307, 'theme_clean', 'customcss', 'body {background: #DDDDDD;color: #000;margin: 0;}\r\n\r\n.container-fluid{margin: 0 auto;width: 85%;box-shadow: 0 0 0 10px rgba(0,0,0,.07);background-color: #fff; }\r\n\r\n', 'body {background: #DDDDDD;color: #000;margin: 0;}\r\n\r\n'),
(929, 2, 1415682351, 'theme_clean', 'customcss', 'body {background: #DDDDDD;color: #000;margin: 0;}\r\n\r\n.container-fluid{margin: 0 auto;width: 85%;box-shadow: 0 0 0 10px rgba(0,0,0,.07);background-color: #fff; }\r\n\r\n.skiplinks, .navbar{	position: absolute; top: 0; left: 0;width: 100%;height: 190px; z-index: -1;}\r\n\r\n', 'body {background: #DDDDDD;color: #000;margin: 0;}\r\n\r\n.container-fluid{margin: 0 auto;width: 85%;box-shadow: 0 0 0 10px rgba(0,0,0,.07);background-color: #fff; }\r\n\r\n'),
(930, 2, 1415682377, 'theme_clean', 'customcss', 'body {background: #DDDDDD;color: #000;margin: 0;}\r\n\r\n.container-fluid{margin: 0 auto;width: 85%;box-shadow: 0 0 0 10px rgba(0,0,0,.07);background-color: #fff; }\r\n\r\n.skiplinks, .navbar{\r\n	background: #17517a; /* Old browsers */\r\n	background: -moz-linear-gradient(top,  #17517a 0%, #17517a 69%, #124162 69%, #124162 100%); /* FF3.6+ */\r\n	background: -webkit-gradient(linear, left top, left bottom, color-stop(0%,#17517a), color-stop(69%,#17517a), color-stop(69%,#124162), color-stop(100%,#124162)); /* Chrome,Safari4+ */\r\n	background: -webkit-linear-gradient(top,  #17517a 0%,#17517a 69%,#124162 69%,#124162 100%); /* Chrome10+,Safari5.1+ */\r\n	background: -o-linear-gradient(top,  #17517a 0%,#17517a 69%,#124162 69%,#124162 100%); /* Opera 11.10+ */\r\n	background: -ms-linear-gradient(top,  #17517a 0%,#17517a 69%,#124162 69%,#124162 100%); /* IE10+ */\r\n	background: linear-gradient(top,  #17517a 0%,#17517a 69%,#124162 69%,#124162 100%); /* W3C */\r\n	filter: progid:DXImageTransform.Microsoft.gradient( startColorstr=''#17517a'', endColorstr=''#124162'',GradientType=0 ); /* IE6-9 */\r\n}\r\n', 'body {background: #DDDDDD;color: #000;margin: 0;}\r\n\r\n.container-fluid{margin: 0 auto;width: 85%;box-shadow: 0 0 0 10px rgba(0,0,0,.07);background-color: #fff; }\r\n\r\n.skiplinks, .navbar{	position: absolute; top: 0; left: 0;width: 100%;height: 190px; z-index: -1;}\r\n\r\n'),
(931, 2, 1415682402, 'theme_clean', 'customcss', 'body {background: #DDDDDD;color: #000;margin: 0;}\r\n\r\n.container-fluid{margin: 0 auto;width: 85%;box-shadow: 0 0 0 10px rgba(0,0,0,.07);background-color: #fff; }\r\n\r\n.skiplinks, .navbar{	position: absolute; top: 0; left: 0;width: 100%;height: 190px; z-index: -1;}\r\n\r\n.skiplinks, .navbar{\r\n	background: #17517a; /* Old browsers */\r\n	background: -moz-linear-gradient(top,  #17517a 0%, #17517a 69%, #124162 69%, #124162 100%); /* FF3.6+ */\r\n	background: -webkit-gradient(linear, left top, left bottom, color-stop(0%,#17517a), color-stop(69%,#17517a), color-stop(69%,#124162), color-stop(100%,#124162)); /* Chrome,Safari4+ */\r\n	background: -webkit-linear-gradient(top,  #17517a 0%,#17517a 69%,#124162 69%,#124162 100%); /* Chrome10+,Safari5.1+ */\r\n	background: -o-linear-gradient(top,  #17517a 0%,#17517a 69%,#124162 69%,#124162 100%); /* Opera 11.10+ */\r\n	background: -ms-linear-gradient(top,  #17517a 0%,#17517a 69%,#124162 69%,#124162 100%); /* IE10+ */\r\n	background: linear-gradient(top,  #17517a 0%,#17517a 69%,#124162 69%,#124162 100%); /* W3C */\r\n	filter: progid:DXImageTransform.Microsoft.gradient( startColorstr=''#17517a'', endColorstr=''#124162'',GradientType=0 ); /* IE6-9 */\r\n}\r\n', 'body {background: #DDDDDD;color: #000;margin: 0;}\r\n\r\n.container-fluid{margin: 0 auto;width: 85%;box-shadow: 0 0 0 10px rgba(0,0,0,.07);background-color: #fff; }\r\n\r\n.skiplinks, .navbar{\r\n	background: #17517a; /* Old browsers */\r\n	background: -moz-linear-gradient(top,  #17517a 0%, #17517a 69%, #124162 69%, #124162 100%); /* FF3.6+ */\r\n	background: -webkit-gradient(linear, left top, left bottom, color-stop(0%,#17517a), color-stop(69%,#17517a), color-stop(69%,#124162), color-stop(100%,#124162)); /* Chrome,Safari4+ */\r\n	background: -webkit-linear-gradient(top,  #17517a 0%,#17517a 69%,#124162 69%,#124162 100%); /* Chrome10+,Safari5.1+ */\r\n	background: -o-linear-gradient(top,  #17517a 0%,#17517a 69%,#124162 69%,#124162 100%); /* Opera 11.10+ */\r\n	background: -ms-linear-gradient(top,  #17517a 0%,#17517a 69%,#124162 69%,#124162 100%); /* IE10+ */\r\n	background: linear-gradient(top,  #17517a 0%,#17517a 69%,#124162 69%,#124162 100%); /* W3C */\r\n	filter: progid:DXImageTransform.Microsoft.gradient( startColorstr=''#17517a'', endColorstr=''#124162'',GradientType=0 ); /* IE6-9 */\r\n}\r\n'),
(932, 2, 1415682429, 'theme_clean', 'customcss', 'body {background: #DDDDDD;color: #000;margin: 0;}\r\n\r\n.container-fluid{margin: 0 auto;width: 85%;box-shadow: 0 0 0 10px rgba(0,0,0,.07);background-color: #fff; }\r\n\r\n.skiplinks, .navbar{	position: absolute; top: 100px; left: 0;width: 100%;height: 190px; z-index: -1;}\r\n\r\n.skiplinks, .navbar{\r\n	background: #17517a; /* Old browsers */\r\n	background: -moz-linear-gradient(top,  #17517a 0%, #17517a 69%, #124162 69%, #124162 100%); /* FF3.6+ */\r\n	background: -webkit-gradient(linear, left top, left bottom, color-stop(0%,#17517a), color-stop(69%,#17517a), color-stop(69%,#124162), color-stop(100%,#124162)); /* Chrome,Safari4+ */\r\n	background: -webkit-linear-gradient(top,  #17517a 0%,#17517a 69%,#124162 69%,#124162 100%); /* Chrome10+,Safari5.1+ */\r\n	background: -o-linear-gradient(top,  #17517a 0%,#17517a 69%,#124162 69%,#124162 100%); /* Opera 11.10+ */\r\n	background: -ms-linear-gradient(top,  #17517a 0%,#17517a 69%,#124162 69%,#124162 100%); /* IE10+ */\r\n	background: linear-gradient(top,  #17517a 0%,#17517a 69%,#124162 69%,#124162 100%); /* W3C */\r\n	filter: progid:DXImageTransform.Microsoft.gradient( startColorstr=''#17517a'', endColorstr=''#124162'',GradientType=0 ); /* IE6-9 */\r\n}\r\n', 'body {background: #DDDDDD;color: #000;margin: 0;}\r\n\r\n.container-fluid{margin: 0 auto;width: 85%;box-shadow: 0 0 0 10px rgba(0,0,0,.07);background-color: #fff; }\r\n\r\n.skiplinks, .navbar{	position: absolute; top: 0; left: 0;width: 100%;height: 190px; z-index: -1;}\r\n\r\n.skiplinks, .navbar{\r\n	background: #17517a; /* Old browsers */\r\n	background: -moz-linear-gradient(top,  #17517a 0%, #17517a 69%, #124162 69%, #124162 100%); /* FF3.6+ */\r\n	background: -webkit-gradient(linear, left top, left bottom, color-stop(0%,#17517a), color-stop(69%,#17517a), color-stop(69%,#124162), color-stop(100%,#124162)); /* Chrome,Safari4+ */\r\n	background: -webkit-linear-gradient(top,  #17517a 0%,#17517a 69%,#124162 69%,#124162 100%); /* Chrome10+,Safari5.1+ */\r\n	background: -o-linear-gradient(top,  #17517a 0%,#17517a 69%,#124162 69%,#124162 100%); /* Opera 11.10+ */\r\n	background: -ms-linear-gradient(top,  #17517a 0%,#17517a 69%,#124162 69%,#124162 100%); /* IE10+ */\r\n	background: linear-gradient(top,  #17517a 0%,#17517a 69%,#124162 69%,#124162 100%); /* W3C */\r\n	filter: progid:DXImageTransform.Microsoft.gradient( startColorstr=''#17517a'', endColorstr=''#124162'',GradientType=0 ); /* IE6-9 */\r\n}\r\n'),
(933, 2, 1415682450, 'theme_clean', 'customcss', 'body {background: #DDDDDD;color: #000;margin: 0;}\r\n\r\n.container-fluid{margin: 0 auto;width: 85%;box-shadow: 0 0 0 10px rgba(0,0,0,.07);background-color: #fff; }\r\n\r\n.skiplinks, .navbar{	position: absolute; top: 30px; left: 0;width: 100%;height: 190px; z-index: -1;}\r\n\r\n.skiplinks, .navbar{\r\n	background: #17517a; /* Old browsers */\r\n	background: -moz-linear-gradient(top,  #17517a 0%, #17517a 69%, #124162 69%, #124162 100%); /* FF3.6+ */\r\n	background: -webkit-gradient(linear, left top, left bottom, color-stop(0%,#17517a), color-stop(69%,#17517a), color-stop(69%,#124162), color-stop(100%,#124162)); /* Chrome,Safari4+ */\r\n	background: -webkit-linear-gradient(top,  #17517a 0%,#17517a 69%,#124162 69%,#124162 100%); /* Chrome10+,Safari5.1+ */\r\n	background: -o-linear-gradient(top,  #17517a 0%,#17517a 69%,#124162 69%,#124162 100%); /* Opera 11.10+ */\r\n	background: -ms-linear-gradient(top,  #17517a 0%,#17517a 69%,#124162 69%,#124162 100%); /* IE10+ */\r\n	background: linear-gradient(top,  #17517a 0%,#17517a 69%,#124162 69%,#124162 100%); /* W3C */\r\n	filter: progid:DXImageTransform.Microsoft.gradient( startColorstr=''#17517a'', endColorstr=''#124162'',GradientType=0 ); /* IE6-9 */\r\n}\r\n', 'body {background: #DDDDDD;color: #000;margin: 0;}\r\n\r\n.container-fluid{margin: 0 auto;width: 85%;box-shadow: 0 0 0 10px rgba(0,0,0,.07);background-color: #fff; }\r\n\r\n.skiplinks, .navbar{	position: absolute; top: 100px; left: 0;width: 100%;height: 190px; z-index: -1;}\r\n\r\n.skiplinks, .navbar{\r\n	background: #17517a; /* Old browsers */\r\n	background: -moz-linear-gradient(top,  #17517a 0%, #17517a 69%, #124162 69%, #124162 100%); /* FF3.6+ */\r\n	background: -webkit-gradient(linear, left top, left bottom, color-stop(0%,#17517a), color-stop(69%,#17517a), color-stop(69%,#124162), color-stop(100%,#124162)); /* Chrome,Safari4+ */\r\n	background: -webkit-linear-gradient(top,  #17517a 0%,#17517a 69%,#124162 69%,#124162 100%); /* Chrome10+,Safari5.1+ */\r\n	background: -o-linear-gradient(top,  #17517a 0%,#17517a 69%,#124162 69%,#124162 100%); /* Opera 11.10+ */\r\n	background: -ms-linear-gradient(top,  #17517a 0%,#17517a 69%,#124162 69%,#124162 100%); /* IE10+ */\r\n	background: linear-gradient(top,  #17517a 0%,#17517a 69%,#124162 69%,#124162 100%); /* W3C */\r\n	filter: progid:DXImageTransform.Microsoft.gradient( startColorstr=''#17517a'', endColorstr=''#124162'',GradientType=0 ); /* IE6-9 */\r\n}\r\n'),
(934, 2, 1415682496, 'theme_clean', 'customcss', 'body {background: #DDDDDD;color: #000;margin: 0;}\r\n\r\n.container-fluid{margin: 0 auto;width: 85%;box-shadow: 0 0 0 10px rgba(0,0,0,.07);background-color: #fff; }\r\n\r\n.skiplinks, .navbar{	position: absolute; top: 0; left: 0;width: 100%;height: 190px; z-index: -1;}\r\n\r\n.skiplinks, .navbar{\r\n	background: #17517a; /* Old browsers */\r\n	background: -moz-linear-gradient(top,  #17517a 0%, #17517a 69%, #124162 69%, #124162 100%); /* FF3.6+ */\r\n	background: -webkit-gradient(linear, left top, left bottom, color-stop(0%,#17517a), color-stop(69%,#17517a), color-stop(69%,#124162), color-stop(100%,#124162)); /* Chrome,Safari4+ */\r\n	background: -webkit-linear-gradient(top,  #17517a 0%,#17517a 69%,#124162 69%,#124162 100%); /* Chrome10+,Safari5.1+ */\r\n	background: -o-linear-gradient(top,  #17517a 0%,#17517a 69%,#124162 69%,#124162 100%); /* Opera 11.10+ */\r\n	background: -ms-linear-gradient(top,  #17517a 0%,#17517a 69%,#124162 69%,#124162 100%); /* IE10+ */\r\n	background: linear-gradient(top,  #17517a 0%,#17517a 69%,#124162 69%,#124162 100%); /* W3C */\r\n	filter: progid:DXImageTransform.Microsoft.gradient( startColorstr=''#17517a'', endColorstr=''#124162'',GradientType=0 ); /* IE6-9 */\r\n}\r\n', 'body {background: #DDDDDD;color: #000;margin: 0;}\r\n\r\n.container-fluid{margin: 0 auto;width: 85%;box-shadow: 0 0 0 10px rgba(0,0,0,.07);background-color: #fff; }\r\n\r\n.skiplinks, .navbar{	position: absolute; top: 30px; left: 0;width: 100%;height: 190px; z-index: -1;}\r\n\r\n.skiplinks, .navbar{\r\n	background: #17517a; /* Old browsers */\r\n	background: -moz-linear-gradient(top,  #17517a 0%, #17517a 69%, #124162 69%, #124162 100%); /* FF3.6+ */\r\n	background: -webkit-gradient(linear, left top, left bottom, color-stop(0%,#17517a), color-stop(69%,#17517a), color-stop(69%,#124162), color-stop(100%,#124162)); /* Chrome,Safari4+ */\r\n	background: -webkit-linear-gradient(top,  #17517a 0%,#17517a 69%,#124162 69%,#124162 100%); /* Chrome10+,Safari5.1+ */\r\n	background: -o-linear-gradient(top,  #17517a 0%,#17517a 69%,#124162 69%,#124162 100%); /* Opera 11.10+ */\r\n	background: -ms-linear-gradient(top,  #17517a 0%,#17517a 69%,#124162 69%,#124162 100%); /* IE10+ */\r\n	background: linear-gradient(top,  #17517a 0%,#17517a 69%,#124162 69%,#124162 100%); /* W3C */\r\n	filter: progid:DXImageTransform.Microsoft.gradient( startColorstr=''#17517a'', endColorstr=''#124162'',GradientType=0 ); /* IE6-9 */\r\n}\r\n'),
(935, 2, 1415682587, 'theme_clean', 'customcss', 'body {background: #DDDDDD;color: #000;margin: 0;}\r\n\r\n.container-fluid{margin: 0 auto;width: 85%;box-shadow: 0 0 0 10px rgba(0,0,0,.07);background-color: #fff; }\r\n\r\n.skiplinks, .navbar{	position: absolute; top: 0; left: 0;width: 100%;height: 190px; z-index: -1;}\r\n\r\n.container-fluid{\r\n	background: #17517a; /* Old browsers */\r\n	background: -moz-linear-gradient(top,  #17517a 0%, #17517a 69%, #124162 69%, #124162 100%); /* FF3.6+ */\r\n	background: -webkit-gradient(linear, left top, left bottom, color-stop(0%,#17517a), color-stop(69%,#17517a), color-stop(69%,#124162), color-stop(100%,#124162)); /* Chrome,Safari4+ */\r\n	background: -webkit-linear-gradient(top,  #17517a 0%,#17517a 69%,#124162 69%,#124162 100%); /* Chrome10+,Safari5.1+ */\r\n	background: -o-linear-gradient(top,  #17517a 0%,#17517a 69%,#124162 69%,#124162 100%); /* Opera 11.10+ */\r\n	background: -ms-linear-gradient(top,  #17517a 0%,#17517a 69%,#124162 69%,#124162 100%); /* IE10+ */\r\n	background: linear-gradient(top,  #17517a 0%,#17517a 69%,#124162 69%,#124162 100%); /* W3C */\r\n	filter: progid:DXImageTransform.Microsoft.gradient( startColorstr=''#17517a'', endColorstr=''#124162'',GradientType=0 ); /* IE6-9 */\r\n}\r\n', 'body {background: #DDDDDD;color: #000;margin: 0;}\r\n\r\n.container-fluid{margin: 0 auto;width: 85%;box-shadow: 0 0 0 10px rgba(0,0,0,.07);background-color: #fff; }\r\n\r\n.skiplinks, .navbar{	position: absolute; top: 0; left: 0;width: 100%;height: 190px; z-index: -1;}\r\n\r\n.skiplinks, .navbar{\r\n	background: #17517a; /* Old browsers */\r\n	background: -moz-linear-gradient(top,  #17517a 0%, #17517a 69%, #124162 69%, #124162 100%); /* FF3.6+ */\r\n	background: -webkit-gradient(linear, left top, left bottom, color-stop(0%,#17517a), color-stop(69%,#17517a), color-stop(69%,#124162), color-stop(100%,#124162)); /* Chrome,Safari4+ */\r\n	background: -webkit-linear-gradient(top,  #17517a 0%,#17517a 69%,#124162 69%,#124162 100%); /* Chrome10+,Safari5.1+ */\r\n	background: -o-linear-gradient(top,  #17517a 0%,#17517a 69%,#124162 69%,#124162 100%); /* Opera 11.10+ */\r\n	background: -ms-linear-gradient(top,  #17517a 0%,#17517a 69%,#124162 69%,#124162 100%); /* IE10+ */\r\n	background: linear-gradient(top,  #17517a 0%,#17517a 69%,#124162 69%,#124162 100%); /* W3C */\r\n	filter: progid:DXImageTransform.Microsoft.gradient( startColorstr=''#17517a'', endColorstr=''#124162'',GradientType=0 ); /* IE6-9 */\r\n}\r\n'),
(936, 2, 1415682615, 'theme_clean', 'customcss', 'body {background: #DDDDDD;color: #000;margin: 0;}\r\n\r\n.container-fluid{margin: 0 auto;width: 85%;box-shadow: 0 0 0 10px rgba(0,0,0,.07);background-color: #fff; }\r\n\r\n.skiplinks, .navbar{	position: absolute; top: 0; left: 0;width: 100%;height: 190px; z-index: -1;}\r\n\r\n.skiplinks, .navbar{\r\n	background: #17517a; /* Old browsers */\r\n	background: -moz-linear-gradient(top,  #17517a 0%, #17517a 69%, #124162 69%, #124162 100%); /* FF3.6+ */\r\n	background: -webkit-gradient(linear, left top, left bottom, color-stop(0%,#17517a), color-stop(69%,#17517a), color-stop(69%,#124162), color-stop(100%,#124162)); /* Chrome,Safari4+ */\r\n	background: -webkit-linear-gradient(top,  #17517a 0%,#17517a 69%,#124162 69%,#124162 100%); /* Chrome10+,Safari5.1+ */\r\n	background: -o-linear-gradient(top,  #17517a 0%,#17517a 69%,#124162 69%,#124162 100%); /* Opera 11.10+ */\r\n	background: -ms-linear-gradient(top,  #17517a 0%,#17517a 69%,#124162 69%,#124162 100%); /* IE10+ */\r\n	background: linear-gradient(top,  #17517a 0%,#17517a 69%,#124162 69%,#124162 100%); /* W3C */\r\n	filter: progid:DXImageTransform.Microsoft.gradient( startColorstr=''#17517a'', endColorstr=''#124162'',GradientType=0 ); /* IE6-9 */\r\n}\r\n', 'body {background: #DDDDDD;color: #000;margin: 0;}\r\n\r\n.container-fluid{margin: 0 auto;width: 85%;box-shadow: 0 0 0 10px rgba(0,0,0,.07);background-color: #fff; }\r\n\r\n.skiplinks, .navbar{	position: absolute; top: 0; left: 0;width: 100%;height: 190px; z-index: -1;}\r\n\r\n.container-fluid{\r\n	background: #17517a; /* Old browsers */\r\n	background: -moz-linear-gradient(top,  #17517a 0%, #17517a 69%, #124162 69%, #124162 100%); /* FF3.6+ */\r\n	background: -webkit-gradient(linear, left top, left bottom, color-stop(0%,#17517a), color-stop(69%,#17517a), color-stop(69%,#124162), color-stop(100%,#124162)); /* Chrome,Safari4+ */\r\n	background: -webkit-linear-gradient(top,  #17517a 0%,#17517a 69%,#124162 69%,#124162 100%); /* Chrome10+,Safari5.1+ */\r\n	background: -o-linear-gradient(top,  #17517a 0%,#17517a 69%,#124162 69%,#124162 100%); /* Opera 11.10+ */\r\n	background: -ms-linear-gradient(top,  #17517a 0%,#17517a 69%,#124162 69%,#124162 100%); /* IE10+ */\r\n	background: linear-gradient(top,  #17517a 0%,#17517a 69%,#124162 69%,#124162 100%); /* W3C */\r\n	filter: progid:DXImageTransform.Microsoft.gradient( startColorstr=''#17517a'', endColorstr=''#124162'',GradientType=0 ); /* IE6-9 */\r\n}\r\n');
INSERT INTO `mdl_config_log` (`id`, `userid`, `timemodified`, `plugin`, `name`, `value`, `oldvalue`) VALUES
(937, 2, 1415683013, 'theme_clean', 'customcss', 'body {background: #DDDDDD;color: #000;margin: 0;}\r\n\r\n.container-fluid{margin: 0 auto;width: 85%;box-shadow: 0 0 0 10px rgba(0,0,0,.07);background-color: #fff; }\r\n\r\n.navbar{	position: absolute; top: 0; left: 0;width: 100%;height: 190px; z-index: -1;}\r\n\r\n.navbar{\r\n	background: #17517a; /* Old browsers */\r\n	background: -moz-linear-gradient(top,  #17517a 0%, #17517a 69%, #124162 69%, #124162 100%); /* FF3.6+ */\r\n	background: -webkit-gradient(linear, left top, left bottom, color-stop(0%,#17517a), color-stop(69%,#17517a), color-stop(69%,#124162), color-stop(100%,#124162)); /* Chrome,Safari4+ */\r\n	background: -webkit-linear-gradient(top,  #17517a 0%,#17517a 69%,#124162 69%,#124162 100%); /* Chrome10+,Safari5.1+ */\r\n	background: -o-linear-gradient(top,  #17517a 0%,#17517a 69%,#124162 69%,#124162 100%); /* Opera 11.10+ */\r\n	background: -ms-linear-gradient(top,  #17517a 0%,#17517a 69%,#124162 69%,#124162 100%); /* IE10+ */\r\n	background: linear-gradient(top,  #17517a 0%,#17517a 69%,#124162 69%,#124162 100%); /* W3C */\r\n	filter: progid:DXImageTransform.Microsoft.gradient( startColorstr=''#17517a'', endColorstr=''#124162'',GradientType=0 ); /* IE6-9 */\r\n}\r\n', 'body {background: #DDDDDD;color: #000;margin: 0;}\r\n\r\n.container-fluid{margin: 0 auto;width: 85%;box-shadow: 0 0 0 10px rgba(0,0,0,.07);background-color: #fff; }\r\n\r\n.skiplinks, .navbar{	position: absolute; top: 0; left: 0;width: 100%;height: 190px; z-index: -1;}\r\n\r\n.skiplinks, .navbar{\r\n	background: #17517a; /* Old browsers */\r\n	background: -moz-linear-gradient(top,  #17517a 0%, #17517a 69%, #124162 69%, #124162 100%); /* FF3.6+ */\r\n	background: -webkit-gradient(linear, left top, left bottom, color-stop(0%,#17517a), color-stop(69%,#17517a), color-stop(69%,#124162), color-stop(100%,#124162)); /* Chrome,Safari4+ */\r\n	background: -webkit-linear-gradient(top,  #17517a 0%,#17517a 69%,#124162 69%,#124162 100%); /* Chrome10+,Safari5.1+ */\r\n	background: -o-linear-gradient(top,  #17517a 0%,#17517a 69%,#124162 69%,#124162 100%); /* Opera 11.10+ */\r\n	background: -ms-linear-gradient(top,  #17517a 0%,#17517a 69%,#124162 69%,#124162 100%); /* IE10+ */\r\n	background: linear-gradient(top,  #17517a 0%,#17517a 69%,#124162 69%,#124162 100%); /* W3C */\r\n	filter: progid:DXImageTransform.Microsoft.gradient( startColorstr=''#17517a'', endColorstr=''#124162'',GradientType=0 ); /* IE6-9 */\r\n}\r\n'),
(938, 2, 1415683048, 'theme_clean', 'customcss', 'body {background: #DDDDDD;color: #000;margin: 0;}\r\n\r\n.container-fluid{margin: 0 auto;width: 85%;box-shadow: 0 0 0 10px rgba(0,0,0,.07);background-color: #fff; }\r\n\r\n.skiplinks{	position: absolute; top: 0; left: 0;width: 100%;height: 190px; z-index: -1;}\r\n\r\n.skiplinks{\r\n	background: #17517a; /* Old browsers */\r\n	background: -moz-linear-gradient(top,  #17517a 0%, #17517a 69%, #124162 69%, #124162 100%); /* FF3.6+ */\r\n	background: -webkit-gradient(linear, left top, left bottom, color-stop(0%,#17517a), color-stop(69%,#17517a), color-stop(69%,#124162), color-stop(100%,#124162)); /* Chrome,Safari4+ */\r\n	background: -webkit-linear-gradient(top,  #17517a 0%,#17517a 69%,#124162 69%,#124162 100%); /* Chrome10+,Safari5.1+ */\r\n	background: -o-linear-gradient(top,  #17517a 0%,#17517a 69%,#124162 69%,#124162 100%); /* Opera 11.10+ */\r\n	background: -ms-linear-gradient(top,  #17517a 0%,#17517a 69%,#124162 69%,#124162 100%); /* IE10+ */\r\n	background: linear-gradient(top,  #17517a 0%,#17517a 69%,#124162 69%,#124162 100%); /* W3C */\r\n	filter: progid:DXImageTransform.Microsoft.gradient( startColorstr=''#17517a'', endColorstr=''#124162'',GradientType=0 ); /* IE6-9 */\r\n}\r\n', 'body {background: #DDDDDD;color: #000;margin: 0;}\r\n\r\n.container-fluid{margin: 0 auto;width: 85%;box-shadow: 0 0 0 10px rgba(0,0,0,.07);background-color: #fff; }\r\n\r\n.navbar{	position: absolute; top: 0; left: 0;width: 100%;height: 190px; z-index: -1;}\r\n\r\n.navbar{\r\n	background: #17517a; /* Old browsers */\r\n	background: -moz-linear-gradient(top,  #17517a 0%, #17517a 69%, #124162 69%, #124162 100%); /* FF3.6+ */\r\n	background: -webkit-gradient(linear, left top, left bottom, color-stop(0%,#17517a), color-stop(69%,#17517a), color-stop(69%,#124162), color-stop(100%,#124162)); /* Chrome,Safari4+ */\r\n	background: -webkit-linear-gradient(top,  #17517a 0%,#17517a 69%,#124162 69%,#124162 100%); /* Chrome10+,Safari5.1+ */\r\n	background: -o-linear-gradient(top,  #17517a 0%,#17517a 69%,#124162 69%,#124162 100%); /* Opera 11.10+ */\r\n	background: -ms-linear-gradient(top,  #17517a 0%,#17517a 69%,#124162 69%,#124162 100%); /* IE10+ */\r\n	background: linear-gradient(top,  #17517a 0%,#17517a 69%,#124162 69%,#124162 100%); /* W3C */\r\n	filter: progid:DXImageTransform.Microsoft.gradient( startColorstr=''#17517a'', endColorstr=''#124162'',GradientType=0 ); /* IE6-9 */\r\n}\r\n'),
(939, 2, 1415683390, 'theme_clean', 'customcss', 'body {background: #DDDDDD;color: #000;margin: 0;}\r\n\r\n.container-fluid{margin: 0 auto;width: 85%;box-shadow: 0 0 0 10px rgba(0,0,0,.07);background-color: #fff; }\r\n\r\n.skiplinks{	position: absolute; top: 0; left: 0;width: 100%;height: 190px; z-index: -1;}\r\n\r\n.skiplinks{ background: none repeat scroll 0 0 #41ade7;\r\n    }\r\n\r\n.skiplinks{\r\n	background: #17517a; /* Old browsers */\r\n	background: -moz-linear-gradient(top,  #17517a 0%, #17517a 69%, #124162 69%, #124162 100%); /* FF3.6+ */\r\n	background: -webkit-gradient(linear, left top, left bottom, color-stop(0%,#17517a), color-stop(69%,#17517a), color-stop(69%,#124162), color-stop(100%,#124162)); /* Chrome,Safari4+ */\r\n	background: -webkit-linear-gradient(top,  #17517a 0%,#17517a 69%,#124162 69%,#124162 100%); /* Chrome10+,Safari5.1+ */\r\n	background: -o-linear-gradient(top,  #17517a 0%,#17517a 69%,#124162 69%,#124162 100%); /* Opera 11.10+ */\r\n	background: -ms-linear-gradient(top,  #17517a 0%,#17517a 69%,#124162 69%,#124162 100%); /* IE10+ */\r\n	background: linear-gradient(top,  #17517a 0%,#17517a 69%,#124162 69%,#124162 100%); /* W3C */\r\n	filter: progid:DXImageTransform.Microsoft.gradient( startColorstr=''#17517a'', endColorstr=''#124162'',GradientType=0 ); /* IE6-9 */\r\n}\r\n', 'body {background: #DDDDDD;color: #000;margin: 0;}\r\n\r\n.container-fluid{margin: 0 auto;width: 85%;box-shadow: 0 0 0 10px rgba(0,0,0,.07);background-color: #fff; }\r\n\r\n.skiplinks{	position: absolute; top: 0; left: 0;width: 100%;height: 190px; z-index: -1;}\r\n\r\n.skiplinks{\r\n	background: #17517a; /* Old browsers */\r\n	background: -moz-linear-gradient(top,  #17517a 0%, #17517a 69%, #124162 69%, #124162 100%); /* FF3.6+ */\r\n	background: -webkit-gradient(linear, left top, left bottom, color-stop(0%,#17517a), color-stop(69%,#17517a), color-stop(69%,#124162), color-stop(100%,#124162)); /* Chrome,Safari4+ */\r\n	background: -webkit-linear-gradient(top,  #17517a 0%,#17517a 69%,#124162 69%,#124162 100%); /* Chrome10+,Safari5.1+ */\r\n	background: -o-linear-gradient(top,  #17517a 0%,#17517a 69%,#124162 69%,#124162 100%); /* Opera 11.10+ */\r\n	background: -ms-linear-gradient(top,  #17517a 0%,#17517a 69%,#124162 69%,#124162 100%); /* IE10+ */\r\n	background: linear-gradient(top,  #17517a 0%,#17517a 69%,#124162 69%,#124162 100%); /* W3C */\r\n	filter: progid:DXImageTransform.Microsoft.gradient( startColorstr=''#17517a'', endColorstr=''#124162'',GradientType=0 ); /* IE6-9 */\r\n}\r\n'),
(940, 2, 1416172876, NULL, 'enablebadges', '0', '1'),
(941, 2, 1416173135, NULL, 'bloglevel', '1', '4'),
(942, 2, 1416173135, NULL, 'useexternalblogs', '0', '1'),
(943, 2, 1417665193, NULL, 'block_quickmail_allowstudents', '0', NULL),
(944, 2, 1417665193, NULL, 'block_quickmail_roleselection', '1,2,3,4', NULL),
(945, 2, 1417665193, NULL, 'block_quickmail_receipt', '0', NULL),
(946, 2, 1417665193, NULL, 'block_quickmail_prepend_class', 'shortname', NULL),
(947, 2, 1417665193, NULL, 'block_quickmail_ferpa', 'strictferpa', NULL),
(948, 2, 1417665908, NULL, 'smtphosts', 'mail.capacita.co', ''),
(949, 2, 1417665908, NULL, 'smtpuser', 'soporte@capacita.co', ''),
(950, 2, 1417665908, NULL, 'smtppass', '********', ''),
(951, 2, 1418101790, 'theme_clean', 'customcss', 'body {background: #DDDDDD;color: #000;margin: 0; font-family: "lucida grande",verdana,helvetica,arial,sans-serif;}\r\n\r\n.container-fluid{margin: 0 auto;width: 85%;box-shadow: 0 0 0 10px rgba(0,0,0,.07);background-color: #fff; }\r\n\r\n.skiplinks{	position: absolute; top: 0; left: 0;width: 100%;height: 190px; z-index: -1;}\r\n\r\n.skiplinks{ background: none repeat scroll 0 0 #41ade7;\r\n    }\r\n\r\n.skiplinks{\r\n	background: #17517a; /* Old browsers */\r\n	background: -moz-linear-gradient(top,  #17517a 0%, #17517a 69%, #124162 69%, #124162 100%); /* FF3.6+ */\r\n	background: -webkit-gradient(linear, left top, left bottom, color-stop(0%,#17517a), color-stop(69%,#17517a), color-stop(69%,#124162), color-stop(100%,#124162)); /* Chrome,Safari4+ */\r\n	background: -webkit-linear-gradient(top,  #17517a 0%,#17517a 69%,#124162 69%,#124162 100%); /* Chrome10+,Safari5.1+ */\r\n	background: -o-linear-gradient(top,  #17517a 0%,#17517a 69%,#124162 69%,#124162 100%); /* Opera 11.10+ */\r\n	background: -ms-linear-gradient(top,  #17517a 0%,#17517a 69%,#124162 69%,#124162 100%); /* IE10+ */\r\n	background: linear-gradient(top,  #17517a 0%,#17517a 69%,#124162 69%,#124162 100%); /* W3C */\r\n	filter: progid:DXImageTransform.Microsoft.gradient( startColorstr=''#17517a'', endColorstr=''#124162'',GradientType=0 ); /* IE6-9 */\r\n}\r\n', 'body {background: #DDDDDD;color: #000;margin: 0;}\r\n\r\n.container-fluid{margin: 0 auto;width: 85%;box-shadow: 0 0 0 10px rgba(0,0,0,.07);background-color: #fff; }\r\n\r\n.skiplinks{	position: absolute; top: 0; left: 0;width: 100%;height: 190px; z-index: -1;}\r\n\r\n.skiplinks{ background: none repeat scroll 0 0 #41ade7;\r\n    }\r\n\r\n.skiplinks{\r\n	background: #17517a; /* Old browsers */\r\n	background: -moz-linear-gradient(top,  #17517a 0%, #17517a 69%, #124162 69%, #124162 100%); /* FF3.6+ */\r\n	background: -webkit-gradient(linear, left top, left bottom, color-stop(0%,#17517a), color-stop(69%,#17517a), color-stop(69%,#124162), color-stop(100%,#124162)); /* Chrome,Safari4+ */\r\n	background: -webkit-linear-gradient(top,  #17517a 0%,#17517a 69%,#124162 69%,#124162 100%); /* Chrome10+,Safari5.1+ */\r\n	background: -o-linear-gradient(top,  #17517a 0%,#17517a 69%,#124162 69%,#124162 100%); /* Opera 11.10+ */\r\n	background: -ms-linear-gradient(top,  #17517a 0%,#17517a 69%,#124162 69%,#124162 100%); /* IE10+ */\r\n	background: linear-gradient(top,  #17517a 0%,#17517a 69%,#124162 69%,#124162 100%); /* W3C */\r\n	filter: progid:DXImageTransform.Microsoft.gradient( startColorstr=''#17517a'', endColorstr=''#124162'',GradientType=0 ); /* IE6-9 */\r\n}\r\n'),
(952, 2, 1418101840, 'theme_clean', 'customcss', 'body {background: #DDDDDD;color: #000;margin: 0; font-family: "lucida grande",verdana,helvetica,arial,sans-serif; font-size: 90%;}\r\n\r\n.container-fluid{margin: 0 auto;width: 85%;box-shadow: 0 0 0 10px rgba(0,0,0,.07);background-color: #fff; }\r\n\r\n.skiplinks{	position: absolute; top: 0; left: 0;width: 100%;height: 190px; z-index: -1;}\r\n\r\n.skiplinks{ background: none repeat scroll 0 0 #41ade7;\r\n    }\r\n\r\n.skiplinks{\r\n	background: #17517a; /* Old browsers */\r\n	background: -moz-linear-gradient(top,  #17517a 0%, #17517a 69%, #124162 69%, #124162 100%); /* FF3.6+ */\r\n	background: -webkit-gradient(linear, left top, left bottom, color-stop(0%,#17517a), color-stop(69%,#17517a), color-stop(69%,#124162), color-stop(100%,#124162)); /* Chrome,Safari4+ */\r\n	background: -webkit-linear-gradient(top,  #17517a 0%,#17517a 69%,#124162 69%,#124162 100%); /* Chrome10+,Safari5.1+ */\r\n	background: -o-linear-gradient(top,  #17517a 0%,#17517a 69%,#124162 69%,#124162 100%); /* Opera 11.10+ */\r\n	background: -ms-linear-gradient(top,  #17517a 0%,#17517a 69%,#124162 69%,#124162 100%); /* IE10+ */\r\n	background: linear-gradient(top,  #17517a 0%,#17517a 69%,#124162 69%,#124162 100%); /* W3C */\r\n	filter: progid:DXImageTransform.Microsoft.gradient( startColorstr=''#17517a'', endColorstr=''#124162'',GradientType=0 ); /* IE6-9 */\r\n}\r\n', 'body {background: #DDDDDD;color: #000;margin: 0; font-family: "lucida grande",verdana,helvetica,arial,sans-serif;}\r\n\r\n.container-fluid{margin: 0 auto;width: 85%;box-shadow: 0 0 0 10px rgba(0,0,0,.07);background-color: #fff; }\r\n\r\n.skiplinks{	position: absolute; top: 0; left: 0;width: 100%;height: 190px; z-index: -1;}\r\n\r\n.skiplinks{ background: none repeat scroll 0 0 #41ade7;\r\n    }\r\n\r\n.skiplinks{\r\n	background: #17517a; /* Old browsers */\r\n	background: -moz-linear-gradient(top,  #17517a 0%, #17517a 69%, #124162 69%, #124162 100%); /* FF3.6+ */\r\n	background: -webkit-gradient(linear, left top, left bottom, color-stop(0%,#17517a), color-stop(69%,#17517a), color-stop(69%,#124162), color-stop(100%,#124162)); /* Chrome,Safari4+ */\r\n	background: -webkit-linear-gradient(top,  #17517a 0%,#17517a 69%,#124162 69%,#124162 100%); /* Chrome10+,Safari5.1+ */\r\n	background: -o-linear-gradient(top,  #17517a 0%,#17517a 69%,#124162 69%,#124162 100%); /* Opera 11.10+ */\r\n	background: -ms-linear-gradient(top,  #17517a 0%,#17517a 69%,#124162 69%,#124162 100%); /* IE10+ */\r\n	background: linear-gradient(top,  #17517a 0%,#17517a 69%,#124162 69%,#124162 100%); /* W3C */\r\n	filter: progid:DXImageTransform.Microsoft.gradient( startColorstr=''#17517a'', endColorstr=''#124162'',GradientType=0 ); /* IE6-9 */\r\n}\r\n'),
(953, 2, 1418102240, 'theme_clean', 'customcss', 'body {background: #DDDDDD;color: #000;margin: 0; font-family: "lucida grande",verdana,helvetica,arial,sans-serif;}\r\n\r\nh2 {color: #777;  }\r\n\r\n.container-fluid{margin: 0 auto;width: 85%;box-shadow: 0 0 0 10px rgba(0,0,0,.07);background-color: #fff; }\r\n\r\n.skiplinks{	position: absolute; top: 0; left: 0;width: 100%;height: 190px; z-index: -1;}\r\n\r\n.skiplinks{ background: none repeat scroll 0 0 #41ade7;\r\n    }\r\n\r\n.skiplinks{\r\n	background: #17517a; /* Old browsers */\r\n	background: -moz-linear-gradient(top,  #17517a 0%, #17517a 69%, #124162 69%, #124162 100%); /* FF3.6+ */\r\n	background: -webkit-gradient(linear, left top, left bottom, color-stop(0%,#17517a), color-stop(69%,#17517a), color-stop(69%,#124162), color-stop(100%,#124162)); /* Chrome,Safari4+ */\r\n	background: -webkit-linear-gradient(top,  #17517a 0%,#17517a 69%,#124162 69%,#124162 100%); /* Chrome10+,Safari5.1+ */\r\n	background: -o-linear-gradient(top,  #17517a 0%,#17517a 69%,#124162 69%,#124162 100%); /* Opera 11.10+ */\r\n	background: -ms-linear-gradient(top,  #17517a 0%,#17517a 69%,#124162 69%,#124162 100%); /* IE10+ */\r\n	background: linear-gradient(top,  #17517a 0%,#17517a 69%,#124162 69%,#124162 100%); /* W3C */\r\n	filter: progid:DXImageTransform.Microsoft.gradient( startColorstr=''#17517a'', endColorstr=''#124162'',GradientType=0 ); /* IE6-9 */\r\n}\r\n', 'body {background: #DDDDDD;color: #000;margin: 0; font-family: "lucida grande",verdana,helvetica,arial,sans-serif; font-size: 90%;}\r\n\r\n.container-fluid{margin: 0 auto;width: 85%;box-shadow: 0 0 0 10px rgba(0,0,0,.07);background-color: #fff; }\r\n\r\n.skiplinks{	position: absolute; top: 0; left: 0;width: 100%;height: 190px; z-index: -1;}\r\n\r\n.skiplinks{ background: none repeat scroll 0 0 #41ade7;\r\n    }\r\n\r\n.skiplinks{\r\n	background: #17517a; /* Old browsers */\r\n	background: -moz-linear-gradient(top,  #17517a 0%, #17517a 69%, #124162 69%, #124162 100%); /* FF3.6+ */\r\n	background: -webkit-gradient(linear, left top, left bottom, color-stop(0%,#17517a), color-stop(69%,#17517a), color-stop(69%,#124162), color-stop(100%,#124162)); /* Chrome,Safari4+ */\r\n	background: -webkit-linear-gradient(top,  #17517a 0%,#17517a 69%,#124162 69%,#124162 100%); /* Chrome10+,Safari5.1+ */\r\n	background: -o-linear-gradient(top,  #17517a 0%,#17517a 69%,#124162 69%,#124162 100%); /* Opera 11.10+ */\r\n	background: -ms-linear-gradient(top,  #17517a 0%,#17517a 69%,#124162 69%,#124162 100%); /* IE10+ */\r\n	background: linear-gradient(top,  #17517a 0%,#17517a 69%,#124162 69%,#124162 100%); /* W3C */\r\n	filter: progid:DXImageTransform.Microsoft.gradient( startColorstr=''#17517a'', endColorstr=''#124162'',GradientType=0 ); /* IE6-9 */\r\n}\r\n'),
(954, 2, 1418102365, 'theme_clean', 'customcss', 'body {background: #DDDDDD;color: #000;margin: 0; font-family: "lucida grande",verdana,helvetica,arial,sans-serif; fontsize: 90%;}\r\n\r\nh2 {color: #777;  }\r\n\r\n.container-fluid{margin: 0 auto;width: 85%;box-shadow: 0 0 0 10px rgba(0,0,0,.07);background-color: #fff; }\r\n\r\n.skiplinks{	position: absolute; top: 0; left: 0;width: 100%;height: 190px; z-index: -1;}\r\n\r\n.skiplinks{ background: none repeat scroll 0 0 #41ade7;\r\n    }\r\n\r\n.skiplinks{\r\n	background: #17517a; /* Old browsers */\r\n	background: -moz-linear-gradient(top,  #17517a 0%, #17517a 69%, #124162 69%, #124162 100%); /* FF3.6+ */\r\n	background: -webkit-gradient(linear, left top, left bottom, color-stop(0%,#17517a), color-stop(69%,#17517a), color-stop(69%,#124162), color-stop(100%,#124162)); /* Chrome,Safari4+ */\r\n	background: -webkit-linear-gradient(top,  #17517a 0%,#17517a 69%,#124162 69%,#124162 100%); /* Chrome10+,Safari5.1+ */\r\n	background: -o-linear-gradient(top,  #17517a 0%,#17517a 69%,#124162 69%,#124162 100%); /* Opera 11.10+ */\r\n	background: -ms-linear-gradient(top,  #17517a 0%,#17517a 69%,#124162 69%,#124162 100%); /* IE10+ */\r\n	background: linear-gradient(top,  #17517a 0%,#17517a 69%,#124162 69%,#124162 100%); /* W3C */\r\n	filter: progid:DXImageTransform.Microsoft.gradient( startColorstr=''#17517a'', endColorstr=''#124162'',GradientType=0 ); /* IE6-9 */\r\n}\r\n', 'body {background: #DDDDDD;color: #000;margin: 0; font-family: "lucida grande",verdana,helvetica,arial,sans-serif;}\r\n\r\nh2 {color: #777;  }\r\n\r\n.container-fluid{margin: 0 auto;width: 85%;box-shadow: 0 0 0 10px rgba(0,0,0,.07);background-color: #fff; }\r\n\r\n.skiplinks{	position: absolute; top: 0; left: 0;width: 100%;height: 190px; z-index: -1;}\r\n\r\n.skiplinks{ background: none repeat scroll 0 0 #41ade7;\r\n    }\r\n\r\n.skiplinks{\r\n	background: #17517a; /* Old browsers */\r\n	background: -moz-linear-gradient(top,  #17517a 0%, #17517a 69%, #124162 69%, #124162 100%); /* FF3.6+ */\r\n	background: -webkit-gradient(linear, left top, left bottom, color-stop(0%,#17517a), color-stop(69%,#17517a), color-stop(69%,#124162), color-stop(100%,#124162)); /* Chrome,Safari4+ */\r\n	background: -webkit-linear-gradient(top,  #17517a 0%,#17517a 69%,#124162 69%,#124162 100%); /* Chrome10+,Safari5.1+ */\r\n	background: -o-linear-gradient(top,  #17517a 0%,#17517a 69%,#124162 69%,#124162 100%); /* Opera 11.10+ */\r\n	background: -ms-linear-gradient(top,  #17517a 0%,#17517a 69%,#124162 69%,#124162 100%); /* IE10+ */\r\n	background: linear-gradient(top,  #17517a 0%,#17517a 69%,#124162 69%,#124162 100%); /* W3C */\r\n	filter: progid:DXImageTransform.Microsoft.gradient( startColorstr=''#17517a'', endColorstr=''#124162'',GradientType=0 ); /* IE6-9 */\r\n}\r\n');

-- --------------------------------------------------------

--
-- Table structure for table `mdl_config_plugins`
--

CREATE TABLE IF NOT EXISTS `mdl_config_plugins` (
`id` bigint(10) NOT NULL,
  `plugin` varchar(100) NOT NULL DEFAULT 'core',
  `name` varchar(100) NOT NULL DEFAULT '',
  `value` longtext NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=1104 DEFAULT CHARSET=utf8 COMMENT='Moodle modules and plugins configuration variables';

--
-- Dumping data for table `mdl_config_plugins`
--

INSERT INTO `mdl_config_plugins` (`id`, `plugin`, `name`, `value`) VALUES
(1, 'moodlecourse', 'visible', '1'),
(2, 'moodlecourse', 'format', 'weeks'),
(3, 'moodlecourse', 'maxsections', '52'),
(4, 'moodlecourse', 'numsections', '10'),
(5, 'moodlecourse', 'hiddensections', '0'),
(6, 'moodlecourse', 'coursedisplay', '0'),
(7, 'moodlecourse', 'lang', ''),
(8, 'moodlecourse', 'newsitems', '5'),
(9, 'moodlecourse', 'showgrades', '1'),
(10, 'moodlecourse', 'showreports', '0'),
(11, 'moodlecourse', 'maxbytes', '0'),
(12, 'moodlecourse', 'enablecompletion', '0'),
(13, 'moodlecourse', 'groupmode', '0'),
(14, 'moodlecourse', 'groupmodeforce', '0'),
(15, 'backup', 'loglifetime', '30'),
(16, 'backup', 'backup_general_users', '1'),
(17, 'backup', 'backup_general_users_locked', ''),
(18, 'backup', 'backup_general_anonymize', '0'),
(19, 'backup', 'backup_general_anonymize_locked', ''),
(20, 'backup', 'backup_general_role_assignments', '1'),
(21, 'backup', 'backup_general_role_assignments_locked', ''),
(22, 'backup', 'backup_general_activities', '1'),
(23, 'backup', 'backup_general_activities_locked', ''),
(24, 'backup', 'backup_general_blocks', '1'),
(25, 'backup', 'backup_general_blocks_locked', ''),
(26, 'backup', 'backup_general_filters', '1'),
(27, 'backup', 'backup_general_filters_locked', ''),
(28, 'backup', 'backup_general_comments', '1'),
(29, 'backup', 'backup_general_comments_locked', ''),
(30, 'backup', 'backup_general_badges', '1'),
(31, 'backup', 'backup_general_badges_locked', ''),
(32, 'backup', 'backup_general_userscompletion', '1'),
(33, 'backup', 'backup_general_userscompletion_locked', ''),
(34, 'backup', 'backup_general_logs', '0'),
(35, 'backup', 'backup_general_logs_locked', ''),
(36, 'backup', 'backup_general_histories', '0'),
(37, 'backup', 'backup_general_histories_locked', ''),
(38, 'backup', 'backup_general_questionbank', '1'),
(39, 'backup', 'backup_general_questionbank_locked', ''),
(40, 'backup', 'import_general_maxresults', '10'),
(41, 'backup', 'backup_auto_active', '0'),
(42, 'backup', 'backup_auto_weekdays', '0000000'),
(43, 'backup', 'backup_auto_hour', '0'),
(44, 'backup', 'backup_auto_minute', '0'),
(45, 'backup', 'backup_auto_storage', '0'),
(46, 'backup', 'backup_auto_destination', ''),
(47, 'backup', 'backup_auto_keep', '1'),
(48, 'backup', 'backup_shortname', '0'),
(49, 'backup', 'backup_auto_skip_hidden', '1'),
(50, 'backup', 'backup_auto_skip_modif_days', '30'),
(51, 'backup', 'backup_auto_skip_modif_prev', '0'),
(52, 'backup', 'backup_auto_users', '1'),
(53, 'backup', 'backup_auto_role_assignments', '1'),
(54, 'backup', 'backup_auto_activities', '1'),
(55, 'backup', 'backup_auto_blocks', '1'),
(56, 'backup', 'backup_auto_filters', '1'),
(57, 'backup', 'backup_auto_comments', '1'),
(58, 'backup', 'backup_auto_badges', '1'),
(59, 'backup', 'backup_auto_userscompletion', '1'),
(60, 'backup', 'backup_auto_logs', '0'),
(61, 'backup', 'backup_auto_histories', '0'),
(62, 'backup', 'backup_auto_questionbank', '1'),
(63, 'cachestore_memcache', 'testservers', ''),
(64, 'cachestore_memcached', 'testservers', ''),
(65, 'cachestore_mongodb', 'testserver', ''),
(66, 'question_preview', 'behaviour', 'deferredfeedback'),
(67, 'question_preview', 'correctness', '1'),
(68, 'question_preview', 'marks', '1'),
(69, 'question_preview', 'markdp', '2'),
(70, 'question_preview', 'feedback', '1'),
(71, 'question_preview', 'generalfeedback', '1'),
(72, 'question_preview', 'rightanswer', '1'),
(73, 'question_preview', 'history', '0'),
(74, 'theme_clean', 'invert', '0'),
(75, 'theme_clean', 'logo', '/capacita_logo.gif'),
(76, 'theme_clean', 'customcss', 'body {background: #DDDDDD;color: #000;margin: 0; font-family: "lucida grande",verdana,helvetica,arial,sans-serif; fontsize: 90%;}\r\n\r\nh2 {color: #777;  }\r\n\r\n.container-fluid{margin: 0 auto;width: 85%;box-shadow: 0 0 0 10px rgba(0,0,0,.07);background-color: #fff; }\r\n\r\n.skiplinks{	position: absolute; top: 0; left: 0;width: 100%;height: 190px; z-index: -1;}\r\n\r\n.skiplinks{ background: none repeat scroll 0 0 #41ade7;\r\n    }\r\n\r\n.skiplinks{\r\n	background: #17517a; /* Old browsers */\r\n	background: -moz-linear-gradient(top,  #17517a 0%, #17517a 69%, #124162 69%, #124162 100%); /* FF3.6+ */\r\n	background: -webkit-gradient(linear, left top, left bottom, color-stop(0%,#17517a), color-stop(69%,#17517a), color-stop(69%,#124162), color-stop(100%,#124162)); /* Chrome,Safari4+ */\r\n	background: -webkit-linear-gradient(top,  #17517a 0%,#17517a 69%,#124162 69%,#124162 100%); /* Chrome10+,Safari5.1+ */\r\n	background: -o-linear-gradient(top,  #17517a 0%,#17517a 69%,#124162 69%,#124162 100%); /* Opera 11.10+ */\r\n	background: -ms-linear-gradient(top,  #17517a 0%,#17517a 69%,#124162 69%,#124162 100%); /* IE10+ */\r\n	background: linear-gradient(top,  #17517a 0%,#17517a 69%,#124162 69%,#124162 100%); /* W3C */\r\n	filter: progid:DXImageTransform.Microsoft.gradient( startColorstr=''#17517a'', endColorstr=''#124162'',GradientType=0 ); /* IE6-9 */\r\n}\r\n'),
(77, 'theme_clean', 'footnote', ''),
(78, 'theme_more', 'textcolor', '#333366'),
(79, 'theme_more', 'linkcolor', '#FF6500'),
(80, 'theme_more', 'bodybackground', ''),
(81, 'theme_more', 'backgroundimage', ''),
(82, 'theme_more', 'backgroundrepeat', 'repeat'),
(83, 'theme_more', 'backgroundposition', '0'),
(84, 'theme_more', 'backgroundfixed', '0'),
(85, 'theme_more', 'contentbackground', '#FFFFFF'),
(86, 'theme_more', 'secondarybackground', '#FFFFFF'),
(87, 'theme_more', 'invert', '1'),
(88, 'theme_more', 'logo', ''),
(89, 'theme_more', 'customcss', ''),
(90, 'theme_more', 'footnote', ''),
(91, 'availability_completion', 'version', '2014051200'),
(92, 'availability_date', 'version', '2014051200'),
(93, 'availability_grade', 'version', '2014051200'),
(94, 'availability_group', 'version', '2014051200'),
(95, 'availability_grouping', 'version', '2014051200'),
(96, 'availability_profile', 'version', '2014051200'),
(97, 'qtype_calculated', 'version', '2014051200'),
(98, 'qtype_calculatedmulti', 'version', '2014051200'),
(99, 'qtype_calculatedsimple', 'version', '2014051200'),
(100, 'qtype_description', 'version', '2014051200'),
(101, 'qtype_essay', 'version', '2014051200'),
(102, 'qtype_match', 'version', '2014051200'),
(103, 'qtype_missingtype', 'version', '2014051200'),
(104, 'qtype_multianswer', 'version', '2014051200'),
(105, 'qtype_multichoice', 'version', '2014051200'),
(106, 'qtype_numerical', 'version', '2014051200'),
(107, 'qtype_random', 'version', '2014051201'),
(108, 'qtype_randomsamatch', 'version', '2014051200'),
(109, 'qtype_shortanswer', 'version', '2014051200'),
(110, 'qtype_truefalse', 'version', '2014051200'),
(111, 'mod_assign', 'version', '2014051201'),
(112, 'mod_assignment', 'version', '2014051200'),
(114, 'mod_book', 'version', '2014051200'),
(115, 'mod_chat', 'version', '2014051200'),
(116, 'mod_choice', 'version', '2014051200'),
(117, 'mod_data', 'version', '2014051200'),
(118, 'mod_feedback', 'version', '2014051200'),
(120, 'mod_folder', 'version', '2014051200'),
(122, 'mod_forum', 'version', '2014051202'),
(123, 'mod_glossary', 'version', '2014051200'),
(124, 'mod_imscp', 'version', '2014051200'),
(126, 'mod_label', 'version', '2014051200'),
(127, 'mod_lesson', 'version', '2014051200'),
(128, 'mod_lti', 'version', '2014051200'),
(129, 'mod_page', 'version', '2014051200'),
(131, 'mod_quiz', 'version', '2014051200'),
(132, 'mod_resource', 'version', '2014051200'),
(133, 'mod_scorm', 'version', '2014051200'),
(134, 'mod_survey', 'version', '2014051200'),
(136, 'mod_url', 'version', '2014051200'),
(138, 'mod_wiki', 'version', '2014051200'),
(140, 'mod_workshop', 'version', '2014051200'),
(141, 'auth_cas', 'version', '2014051200'),
(143, 'auth_db', 'version', '2014051200'),
(145, 'auth_email', 'version', '2014051200'),
(146, 'auth_fc', 'version', '2014051200'),
(148, 'auth_imap', 'version', '2014051200'),
(150, 'auth_ldap', 'version', '2014051200'),
(152, 'auth_manual', 'version', '2014051200'),
(153, 'auth_mnet', 'version', '2014051200'),
(155, 'auth_nntp', 'version', '2014051200'),
(157, 'auth_nologin', 'version', '2014051200'),
(158, 'auth_none', 'version', '2014051200'),
(159, 'auth_pam', 'version', '2014051200'),
(161, 'auth_pop3', 'version', '2014051200'),
(163, 'auth_radius', 'version', '2014051200'),
(165, 'auth_shibboleth', 'version', '2014051200'),
(167, 'auth_webservice', 'version', '2014051200'),
(168, 'calendartype_gregorian', 'version', '2014051200'),
(169, 'enrol_category', 'version', '2014051200'),
(171, 'enrol_cohort', 'version', '2014051200'),
(172, 'enrol_database', 'version', '2014051200'),
(174, 'enrol_flatfile', 'version', '2014051200'),
(176, 'enrol_flatfile', 'map_1', 'manager'),
(177, 'enrol_flatfile', 'map_2', 'coursecreator'),
(178, 'enrol_flatfile', 'map_3', 'editingteacher'),
(179, 'enrol_flatfile', 'map_4', 'teacher'),
(180, 'enrol_flatfile', 'map_5', 'student'),
(181, 'enrol_flatfile', 'map_6', 'guest'),
(182, 'enrol_flatfile', 'map_7', 'user'),
(183, 'enrol_flatfile', 'map_8', 'frontpage'),
(184, 'enrol_guest', 'version', '2014051200'),
(185, 'enrol_imsenterprise', 'version', '2014051200'),
(187, 'enrol_ldap', 'version', '2014051200'),
(189, 'enrol_manual', 'version', '2014051200'),
(191, 'enrol_meta', 'version', '2014051200'),
(193, 'enrol_mnet', 'version', '2014051200'),
(194, 'enrol_paypal', 'version', '2014051200'),
(195, 'enrol_self', 'version', '2014051200'),
(197, 'message_airnotifier', 'version', '2014051200'),
(199, 'message', 'airnotifier_provider_enrol_flatfile_flatfile_enrolment_permitted', 'permitted'),
(200, 'message', 'airnotifier_provider_enrol_imsenterprise_imsenterprise_enrolment_permitted', 'permitted'),
(201, 'message', 'airnotifier_provider_enrol_manual_expiry_notification_permitted', 'permitted'),
(202, 'message', 'airnotifier_provider_enrol_paypal_paypal_enrolment_permitted', 'permitted'),
(203, 'message', 'airnotifier_provider_enrol_self_expiry_notification_permitted', 'permitted'),
(204, 'message', 'airnotifier_provider_mod_assign_assign_notification_permitted', 'permitted'),
(205, 'message', 'airnotifier_provider_mod_assignment_assignment_updates_permitted', 'permitted'),
(206, 'message', 'airnotifier_provider_mod_feedback_submission_permitted', 'permitted'),
(207, 'message', 'airnotifier_provider_mod_feedback_message_permitted', 'permitted'),
(208, 'message', 'airnotifier_provider_mod_forum_posts_permitted', 'permitted'),
(209, 'message', 'airnotifier_provider_mod_lesson_graded_essay_permitted', 'permitted'),
(210, 'message', 'airnotifier_provider_mod_quiz_submission_permitted', 'permitted'),
(211, 'message', 'airnotifier_provider_mod_quiz_confirmation_permitted', 'permitted'),
(212, 'message', 'airnotifier_provider_mod_quiz_attempt_overdue_permitted', 'permitted'),
(213, 'message', 'airnotifier_provider_moodle_notices_permitted', 'permitted'),
(214, 'message', 'airnotifier_provider_moodle_errors_permitted', 'permitted'),
(215, 'message', 'airnotifier_provider_moodle_availableupdate_permitted', 'permitted'),
(216, 'message', 'airnotifier_provider_moodle_instantmessage_permitted', 'permitted'),
(217, 'message', 'airnotifier_provider_moodle_backup_permitted', 'permitted'),
(218, 'message', 'airnotifier_provider_moodle_courserequested_permitted', 'permitted'),
(219, 'message', 'airnotifier_provider_moodle_courserequestapproved_permitted', 'permitted'),
(220, 'message', 'airnotifier_provider_moodle_courserequestrejected_permitted', 'permitted'),
(221, 'message', 'airnotifier_provider_moodle_badgerecipientnotice_permitted', 'permitted'),
(222, 'message', 'airnotifier_provider_moodle_badgecreatornotice_permitted', 'permitted'),
(223, 'message_email', 'version', '2014051200'),
(225, 'message', 'email_provider_enrol_flatfile_flatfile_enrolment_permitted', 'permitted'),
(226, 'message', 'message_provider_enrol_flatfile_flatfile_enrolment_loggedin', 'email'),
(227, 'message', 'message_provider_enrol_flatfile_flatfile_enrolment_loggedoff', 'email'),
(228, 'message', 'email_provider_enrol_imsenterprise_imsenterprise_enrolment_permitted', 'permitted'),
(229, 'message', 'message_provider_enrol_imsenterprise_imsenterprise_enrolment_loggedin', 'email'),
(230, 'message', 'message_provider_enrol_imsenterprise_imsenterprise_enrolment_loggedoff', 'email'),
(231, 'message', 'email_provider_enrol_manual_expiry_notification_permitted', 'permitted'),
(232, 'message', 'message_provider_enrol_manual_expiry_notification_loggedin', 'email'),
(233, 'message', 'message_provider_enrol_manual_expiry_notification_loggedoff', 'email'),
(234, 'message', 'email_provider_enrol_paypal_paypal_enrolment_permitted', 'permitted'),
(235, 'message', 'message_provider_enrol_paypal_paypal_enrolment_loggedin', 'email'),
(236, 'message', 'message_provider_enrol_paypal_paypal_enrolment_loggedoff', 'email'),
(237, 'message', 'email_provider_enrol_self_expiry_notification_permitted', 'permitted'),
(238, 'message', 'message_provider_enrol_self_expiry_notification_loggedin', 'email'),
(239, 'message', 'message_provider_enrol_self_expiry_notification_loggedoff', 'email'),
(240, 'message', 'email_provider_mod_assign_assign_notification_permitted', 'permitted'),
(241, 'message', 'message_provider_mod_assign_assign_notification_loggedin', 'email'),
(242, 'message', 'message_provider_mod_assign_assign_notification_loggedoff', 'email'),
(243, 'message', 'email_provider_mod_assignment_assignment_updates_permitted', 'permitted'),
(244, 'message', 'message_provider_mod_assignment_assignment_updates_loggedin', 'email'),
(245, 'message', 'message_provider_mod_assignment_assignment_updates_loggedoff', 'email'),
(246, 'message', 'email_provider_mod_feedback_submission_permitted', 'permitted'),
(247, 'message', 'message_provider_mod_feedback_submission_loggedin', 'email'),
(248, 'message', 'message_provider_mod_feedback_submission_loggedoff', 'email'),
(249, 'message', 'email_provider_mod_feedback_message_permitted', 'permitted'),
(250, 'message', 'message_provider_mod_feedback_message_loggedin', 'email'),
(251, 'message', 'message_provider_mod_feedback_message_loggedoff', 'email'),
(252, 'message', 'email_provider_mod_forum_posts_permitted', 'permitted'),
(253, 'message', 'message_provider_mod_forum_posts_loggedin', 'email'),
(254, 'message', 'message_provider_mod_forum_posts_loggedoff', 'email'),
(255, 'message', 'email_provider_mod_lesson_graded_essay_permitted', 'permitted'),
(256, 'message', 'message_provider_mod_lesson_graded_essay_loggedin', 'email'),
(257, 'message', 'message_provider_mod_lesson_graded_essay_loggedoff', 'email'),
(258, 'message', 'email_provider_mod_quiz_submission_permitted', 'permitted'),
(259, 'message', 'message_provider_mod_quiz_submission_loggedin', 'email'),
(260, 'message', 'message_provider_mod_quiz_submission_loggedoff', 'email'),
(261, 'message', 'email_provider_mod_quiz_confirmation_permitted', 'permitted'),
(262, 'message', 'message_provider_mod_quiz_confirmation_loggedin', 'email'),
(263, 'message', 'message_provider_mod_quiz_confirmation_loggedoff', 'email'),
(264, 'message', 'email_provider_mod_quiz_attempt_overdue_permitted', 'permitted'),
(265, 'message', 'message_provider_mod_quiz_attempt_overdue_loggedin', 'email'),
(266, 'message', 'message_provider_mod_quiz_attempt_overdue_loggedoff', 'email'),
(267, 'message', 'email_provider_moodle_notices_permitted', 'permitted'),
(268, 'message', 'message_provider_moodle_notices_loggedin', 'email'),
(269, 'message', 'message_provider_moodle_notices_loggedoff', 'email'),
(270, 'message', 'email_provider_moodle_errors_permitted', 'permitted'),
(271, 'message', 'message_provider_moodle_errors_loggedin', 'email'),
(272, 'message', 'message_provider_moodle_errors_loggedoff', 'email'),
(273, 'message', 'email_provider_moodle_availableupdate_permitted', 'permitted'),
(274, 'message', 'message_provider_moodle_availableupdate_loggedin', 'email'),
(275, 'message', 'message_provider_moodle_availableupdate_loggedoff', 'email'),
(276, 'message', 'email_provider_moodle_instantmessage_permitted', 'permitted'),
(277, 'message', 'message_provider_moodle_instantmessage_loggedoff', 'popup,email'),
(278, 'message', 'email_provider_moodle_backup_permitted', 'permitted'),
(279, 'message', 'message_provider_moodle_backup_loggedin', 'email'),
(280, 'message', 'message_provider_moodle_backup_loggedoff', 'email'),
(281, 'message', 'email_provider_moodle_courserequested_permitted', 'permitted'),
(282, 'message', 'message_provider_moodle_courserequested_loggedin', 'email'),
(283, 'message', 'message_provider_moodle_courserequested_loggedoff', 'email'),
(284, 'message', 'email_provider_moodle_courserequestapproved_permitted', 'permitted'),
(285, 'message', 'message_provider_moodle_courserequestapproved_loggedin', 'email'),
(286, 'message', 'message_provider_moodle_courserequestapproved_loggedoff', 'email'),
(287, 'message', 'email_provider_moodle_courserequestrejected_permitted', 'permitted'),
(288, 'message', 'message_provider_moodle_courserequestrejected_loggedin', 'email'),
(289, 'message', 'message_provider_moodle_courserequestrejected_loggedoff', 'email'),
(290, 'message', 'email_provider_moodle_badgerecipientnotice_permitted', 'permitted'),
(291, 'message', 'message_provider_moodle_badgerecipientnotice_loggedoff', 'popup,email'),
(292, 'message', 'email_provider_moodle_badgecreatornotice_permitted', 'permitted'),
(293, 'message', 'message_provider_moodle_badgecreatornotice_loggedoff', 'email'),
(294, 'message_jabber', 'version', '2014051200'),
(296, 'message', 'jabber_provider_enrol_flatfile_flatfile_enrolment_permitted', 'permitted'),
(297, 'message', 'jabber_provider_enrol_imsenterprise_imsenterprise_enrolment_permitted', 'permitted'),
(298, 'message', 'jabber_provider_enrol_manual_expiry_notification_permitted', 'permitted'),
(299, 'message', 'jabber_provider_enrol_paypal_paypal_enrolment_permitted', 'permitted'),
(300, 'message', 'jabber_provider_enrol_self_expiry_notification_permitted', 'permitted'),
(301, 'message', 'jabber_provider_mod_assign_assign_notification_permitted', 'permitted'),
(302, 'message', 'jabber_provider_mod_assignment_assignment_updates_permitted', 'permitted'),
(303, 'message', 'jabber_provider_mod_feedback_submission_permitted', 'permitted'),
(304, 'message', 'jabber_provider_mod_feedback_message_permitted', 'permitted'),
(305, 'message', 'jabber_provider_mod_forum_posts_permitted', 'permitted'),
(306, 'message', 'jabber_provider_mod_lesson_graded_essay_permitted', 'permitted'),
(307, 'message', 'jabber_provider_mod_quiz_submission_permitted', 'permitted'),
(308, 'message', 'jabber_provider_mod_quiz_confirmation_permitted', 'permitted'),
(309, 'message', 'jabber_provider_mod_quiz_attempt_overdue_permitted', 'permitted'),
(310, 'message', 'jabber_provider_moodle_notices_permitted', 'permitted'),
(311, 'message', 'jabber_provider_moodle_errors_permitted', 'permitted'),
(312, 'message', 'jabber_provider_moodle_availableupdate_permitted', 'permitted'),
(313, 'message', 'jabber_provider_moodle_instantmessage_permitted', 'permitted'),
(314, 'message', 'jabber_provider_moodle_backup_permitted', 'permitted'),
(315, 'message', 'jabber_provider_moodle_courserequested_permitted', 'permitted'),
(316, 'message', 'jabber_provider_moodle_courserequestapproved_permitted', 'permitted'),
(317, 'message', 'jabber_provider_moodle_courserequestrejected_permitted', 'permitted'),
(318, 'message', 'jabber_provider_moodle_badgerecipientnotice_permitted', 'permitted'),
(319, 'message', 'jabber_provider_moodle_badgecreatornotice_permitted', 'permitted'),
(320, 'message_popup', 'version', '2014051200'),
(322, 'message', 'popup_provider_enrol_flatfile_flatfile_enrolment_permitted', 'permitted'),
(323, 'message', 'popup_provider_enrol_imsenterprise_imsenterprise_enrolment_permitted', 'permitted'),
(324, 'message', 'popup_provider_enrol_manual_expiry_notification_permitted', 'permitted'),
(325, 'message', 'popup_provider_enrol_paypal_paypal_enrolment_permitted', 'permitted'),
(326, 'message', 'popup_provider_enrol_self_expiry_notification_permitted', 'permitted'),
(327, 'message', 'popup_provider_mod_assign_assign_notification_permitted', 'permitted'),
(328, 'message', 'popup_provider_mod_assignment_assignment_updates_permitted', 'permitted'),
(329, 'message', 'popup_provider_mod_feedback_submission_permitted', 'permitted'),
(330, 'message', 'popup_provider_mod_feedback_message_permitted', 'permitted'),
(331, 'message', 'popup_provider_mod_forum_posts_permitted', 'permitted'),
(332, 'message', 'popup_provider_mod_lesson_graded_essay_permitted', 'permitted'),
(333, 'message', 'popup_provider_mod_quiz_submission_permitted', 'permitted'),
(334, 'message', 'popup_provider_mod_quiz_confirmation_permitted', 'permitted'),
(335, 'message', 'popup_provider_mod_quiz_attempt_overdue_permitted', 'permitted'),
(336, 'message', 'popup_provider_moodle_notices_permitted', 'permitted'),
(337, 'message', 'popup_provider_moodle_errors_permitted', 'permitted'),
(338, 'message', 'popup_provider_moodle_availableupdate_permitted', 'permitted'),
(339, 'message', 'popup_provider_moodle_instantmessage_permitted', 'permitted'),
(340, 'message', 'message_provider_moodle_instantmessage_loggedin', 'popup'),
(341, 'message', 'popup_provider_moodle_backup_permitted', 'permitted'),
(342, 'message', 'popup_provider_moodle_courserequested_permitted', 'permitted'),
(343, 'message', 'popup_provider_moodle_courserequestapproved_permitted', 'permitted'),
(344, 'message', 'popup_provider_moodle_courserequestrejected_permitted', 'permitted'),
(345, 'message', 'popup_provider_moodle_badgerecipientnotice_permitted', 'permitted'),
(346, 'message', 'message_provider_moodle_badgerecipientnotice_loggedin', 'popup'),
(347, 'message', 'popup_provider_moodle_badgecreatornotice_permitted', 'permitted'),
(348, 'block_activity_modules', 'version', '2014051200'),
(349, 'block_admin_bookmarks', 'version', '2014051200'),
(350, 'block_badges', 'version', '2014051200'),
(351, 'block_blog_menu', 'version', '2014051200'),
(352, 'block_blog_recent', 'version', '2014051200'),
(353, 'block_blog_tags', 'version', '2014051200'),
(354, 'block_calendar_month', 'version', '2014051200'),
(355, 'block_calendar_upcoming', 'version', '2014051200'),
(356, 'block_comments', 'version', '2014051200'),
(357, 'block_community', 'version', '2014051200'),
(358, 'block_completionstatus', 'version', '2014051200'),
(359, 'block_course_list', 'version', '2014051200'),
(360, 'block_course_overview', 'version', '2014051200'),
(361, 'block_course_summary', 'version', '2014051200'),
(362, 'block_feedback', 'version', '2014051200'),
(364, 'block_glossary_random', 'version', '2014051200'),
(365, 'block_html', 'version', '2014051200'),
(366, 'block_login', 'version', '2014051200'),
(367, 'block_mentees', 'version', '2014051200'),
(368, 'block_messages', 'version', '2014051200'),
(369, 'block_mnet_hosts', 'version', '2014051200'),
(370, 'block_myprofile', 'version', '2014051200'),
(371, 'block_navigation', 'version', '2014051200'),
(372, 'block_news_items', 'version', '2014051200'),
(373, 'block_online_users', 'version', '2014051200'),
(374, 'block_participants', 'version', '2014051200'),
(375, 'block_private_files', 'version', '2014051200'),
(376, 'block_quiz_results', 'version', '2014051200'),
(377, 'block_recent_activity', 'version', '2014051200'),
(378, 'block_rss_client', 'version', '2014051200'),
(379, 'block_search_forums', 'version', '2014051200'),
(380, 'block_section_links', 'version', '2014051200'),
(381, 'block_selfcompletion', 'version', '2014051200'),
(382, 'block_settings', 'version', '2014051200'),
(383, 'block_site_main_menu', 'version', '2014051200'),
(384, 'block_social_activities', 'version', '2014051200'),
(385, 'block_tag_flickr', 'version', '2014051200'),
(386, 'block_tag_youtube', 'version', '2014051200'),
(387, 'block_tags', 'version', '2014051200'),
(388, 'filter_activitynames', 'version', '2014051200'),
(390, 'filter_algebra', 'version', '2014051200'),
(391, 'filter_censor', 'version', '2014051200'),
(392, 'filter_data', 'version', '2014051200'),
(394, 'filter_emailprotect', 'version', '2014051200'),
(395, 'filter_emoticon', 'version', '2014051200'),
(396, 'filter_glossary', 'version', '2014051200'),
(398, 'filter_mathjaxloader', 'version', '2014051201'),
(400, 'filter_mediaplugin', 'version', '2014051200'),
(402, 'filter_multilang', 'version', '2014051200'),
(403, 'filter_tex', 'version', '2014051200'),
(405, 'filter_tidy', 'version', '2014051200'),
(406, 'filter_urltolink', 'version', '2014051200'),
(407, 'editor_atto', 'version', '2014051200'),
(409, 'editor_textarea', 'version', '2014051200'),
(410, 'editor_tinymce', 'version', '2014051201'),
(411, 'format_singleactivity', 'version', '2014051200'),
(412, 'format_social', 'version', '2014051200'),
(413, 'format_topics', 'version', '2014051200'),
(414, 'format_weeks', 'version', '2014051200'),
(415, 'profilefield_checkbox', 'version', '2014051200'),
(416, 'profilefield_datetime', 'version', '2014051200'),
(417, 'profilefield_menu', 'version', '2014051200'),
(418, 'profilefield_text', 'version', '2014051200'),
(419, 'profilefield_textarea', 'version', '2014051200'),
(420, 'report_backups', 'version', '2014051200'),
(421, 'report_completion', 'version', '2014051200'),
(423, 'report_configlog', 'version', '2014051200'),
(424, 'report_courseoverview', 'version', '2014051200'),
(425, 'report_eventlist', 'version', '2014051200'),
(426, 'report_log', 'version', '2014051200'),
(428, 'report_loglive', 'version', '2014051200'),
(429, 'report_outline', 'version', '2014051200'),
(431, 'report_participation', 'version', '2014051200'),
(433, 'report_performance', 'version', '2014051200'),
(434, 'report_progress', 'version', '2014051200'),
(436, 'report_questioninstances', 'version', '2014051200'),
(437, 'report_security', 'version', '2014051200'),
(438, 'report_stats', 'version', '2014051200'),
(440, 'gradeexport_ods', 'version', '2014051200'),
(441, 'gradeexport_txt', 'version', '2014051200'),
(442, 'gradeexport_xls', 'version', '2014051200'),
(443, 'gradeexport_xml', 'version', '2014051200'),
(444, 'gradeimport_csv', 'version', '2014051200'),
(445, 'gradeimport_xml', 'version', '2014051200'),
(446, 'gradereport_grader', 'version', '2014051200'),
(447, 'gradereport_outcomes', 'version', '2014051200'),
(448, 'gradereport_overview', 'version', '2014051200'),
(449, 'gradereport_user', 'version', '2014051200'),
(450, 'gradingform_guide', 'version', '2014051200'),
(451, 'gradingform_rubric', 'version', '2014051200'),
(452, 'mnetservice_enrol', 'version', '2014051200'),
(453, 'webservice_amf', 'version', '2014051200'),
(454, 'webservice_rest', 'version', '2014051200'),
(455, 'webservice_soap', 'version', '2014051200'),
(456, 'webservice_xmlrpc', 'version', '2014051200'),
(457, 'repository_alfresco', 'version', '2014051200'),
(458, 'repository_areafiles', 'version', '2014051200'),
(462, 'repository_boxnet', 'version', '2014051200'),
(463, 'repository_coursefiles', 'version', '2014051200'),
(464, 'repository_dropbox', 'version', '2014051200'),
(465, 'repository_equella', 'version', '2014051200'),
(466, 'repository_filesystem', 'version', '2014051200'),
(467, 'repository_flickr', 'version', '2014051200'),
(468, 'repository_flickr_public', 'version', '2014051200'),
(469, 'repository_googledocs', 'version', '2014051200'),
(470, 'repository_local', 'version', '2014051200'),
(474, 'repository_merlot', 'version', '2014051200'),
(475, 'repository_picasa', 'version', '2014051200'),
(476, 'repository_recent', 'version', '2014051200'),
(480, 'repository_s3', 'version', '2014051200'),
(481, 'repository_skydrive', 'version', '2014051200'),
(482, 'repository_upload', 'version', '2014051200'),
(486, 'repository_url', 'version', '2014051200'),
(490, 'repository_user', 'version', '2014051200'),
(494, 'repository_webdav', 'version', '2014051200'),
(495, 'repository_wikimedia', 'version', '2014051200'),
(499, 'repository_youtube', 'version', '2014051200'),
(503, 'portfolio_boxnet', 'version', '2014051200'),
(504, 'portfolio_download', 'version', '2014051200'),
(505, 'portfolio_flickr', 'version', '2014051200'),
(506, 'portfolio_googledocs', 'version', '2014051200'),
(507, 'portfolio_mahara', 'version', '2014051200'),
(508, 'portfolio_picasa', 'version', '2014051200'),
(509, 'qbehaviour_adaptive', 'version', '2014051200'),
(510, 'qbehaviour_adaptivenopenalty', 'version', '2014051200'),
(511, 'qbehaviour_deferredcbm', 'version', '2014051200'),
(512, 'qbehaviour_deferredfeedback', 'version', '2014051200'),
(513, 'qbehaviour_immediatecbm', 'version', '2014051200'),
(514, 'qbehaviour_immediatefeedback', 'version', '2014051200'),
(515, 'qbehaviour_informationitem', 'version', '2014051200'),
(516, 'qbehaviour_interactive', 'version', '2014051200'),
(517, 'qbehaviour_interactivecountback', 'version', '2014051200'),
(518, 'qbehaviour_manualgraded', 'version', '2014051200'),
(520, 'question', 'disabledbehaviours', 'manualgraded'),
(521, 'qbehaviour_missing', 'version', '2014051200'),
(522, 'qformat_aiken', 'version', '2014051200'),
(523, 'qformat_blackboard_six', 'version', '2014051200'),
(524, 'qformat_examview', 'version', '2014051200'),
(525, 'qformat_gift', 'version', '2014051200'),
(526, 'qformat_learnwise', 'version', '2014051200'),
(527, 'qformat_missingword', 'version', '2014051200'),
(528, 'qformat_multianswer', 'version', '2014051200'),
(529, 'qformat_webct', 'version', '2014051200'),
(530, 'qformat_xhtml', 'version', '2014051200'),
(531, 'qformat_xml', 'version', '2014051200'),
(532, 'tool_assignmentupgrade', 'version', '2014051200'),
(533, 'tool_availabilityconditions', 'version', '2014051200'),
(534, 'tool_behat', 'version', '2014051200'),
(535, 'tool_capability', 'version', '2014051200'),
(536, 'tool_customlang', 'version', '2014051200'),
(538, 'tool_dbtransfer', 'version', '2014051200'),
(539, 'tool_generator', 'version', '2014051200'),
(540, 'tool_health', 'version', '2014051200'),
(541, 'tool_innodb', 'version', '2014051200'),
(542, 'tool_installaddon', 'version', '2014051200'),
(543, 'tool_langimport', 'version', '2014051200'),
(544, 'tool_log', 'version', '2014051200'),
(546, 'tool_log', 'enabled_stores', 'logstore_standard'),
(547, 'tool_multilangupgrade', 'version', '2014051200'),
(548, 'tool_phpunit', 'version', '2014051200'),
(549, 'tool_profiling', 'version', '2014051200'),
(550, 'tool_replace', 'version', '2014051200'),
(551, 'tool_spamcleaner', 'version', '2014051200'),
(552, 'tool_task', 'version', '2014051200'),
(553, 'tool_timezoneimport', 'version', '2014051200'),
(554, 'tool_unsuproles', 'version', '2014051200'),
(556, 'tool_uploadcourse', 'version', '2014051200'),
(557, 'tool_uploaduser', 'version', '2014051200'),
(558, 'tool_xmldb', 'version', '2014051200'),
(559, 'cachestore_file', 'version', '2014051200'),
(560, 'cachestore_memcache', 'version', '2014051200'),
(561, 'cachestore_memcached', 'version', '2014051200'),
(562, 'cachestore_mongodb', 'version', '2014051200'),
(563, 'cachestore_session', 'version', '2014051200'),
(564, 'cachestore_static', 'version', '2014051200'),
(565, 'cachelock_file', 'version', '2014051200'),
(566, 'theme_base', 'version', '2014051200'),
(567, 'theme_bootstrapbase', 'version', '2014051200'),
(568, 'theme_canvas', 'version', '2014051200'),
(569, 'theme_clean', 'version', '2014051200'),
(570, 'theme_more', 'version', '2014051200'),
(572, 'assignsubmission_comments', 'version', '2014051200'),
(574, 'assignsubmission_file', 'sortorder', '1'),
(575, 'assignsubmission_comments', 'sortorder', '2'),
(576, 'assignsubmission_onlinetext', 'sortorder', '0'),
(577, 'assignsubmission_file', 'version', '2014051200'),
(578, 'assignsubmission_onlinetext', 'version', '2014051200'),
(580, 'assignfeedback_comments', 'version', '2014051200'),
(582, 'assignfeedback_comments', 'sortorder', '0'),
(583, 'assignfeedback_editpdf', 'sortorder', '1'),
(584, 'assignfeedback_file', 'sortorder', '3'),
(585, 'assignfeedback_offline', 'sortorder', '2'),
(586, 'assignfeedback_editpdf', 'version', '2014051200'),
(588, 'assignfeedback_file', 'version', '2014051200'),
(590, 'assignfeedback_offline', 'version', '2014051200'),
(591, 'assignment_offline', 'version', '2014051200'),
(592, 'assignment_online', 'version', '2014051200'),
(593, 'assignment_upload', 'version', '2014051200'),
(594, 'assignment_uploadsingle', 'version', '2014051200'),
(595, 'booktool_exportimscp', 'version', '2014051200'),
(596, 'booktool_importhtml', 'version', '2014051200'),
(597, 'booktool_print', 'version', '2014051200'),
(598, 'datafield_checkbox', 'version', '2014051200'),
(599, 'datafield_date', 'version', '2014051200'),
(600, 'datafield_file', 'version', '2014051200'),
(601, 'datafield_latlong', 'version', '2014051200'),
(602, 'datafield_menu', 'version', '2014051200'),
(603, 'datafield_multimenu', 'version', '2014051200'),
(604, 'datafield_number', 'version', '2014051200'),
(605, 'datafield_picture', 'version', '2014051200'),
(606, 'datafield_radiobutton', 'version', '2014051200'),
(607, 'datafield_text', 'version', '2014051200'),
(608, 'datafield_textarea', 'version', '2014051200'),
(609, 'datafield_url', 'version', '2014051200'),
(610, 'datapreset_imagegallery', 'version', '2014051200'),
(611, 'quiz_grading', 'version', '2014051200'),
(613, 'quiz_overview', 'version', '2014051200'),
(615, 'quiz_responses', 'version', '2014051200'),
(617, 'quiz_statistics', 'version', '2014051200'),
(619, 'quizaccess_delaybetweenattempts', 'version', '2014051200'),
(620, 'quizaccess_ipaddress', 'version', '2014051200'),
(621, 'quizaccess_numattempts', 'version', '2014051200'),
(622, 'quizaccess_openclosedate', 'version', '2014051200'),
(623, 'quizaccess_password', 'version', '2014051200'),
(624, 'quizaccess_safebrowser', 'version', '2014051200'),
(625, 'quizaccess_securewindow', 'version', '2014051200'),
(626, 'quizaccess_timelimit', 'version', '2014051200'),
(627, 'scormreport_basic', 'version', '2014051200'),
(628, 'scormreport_graphs', 'version', '2014051200'),
(629, 'scormreport_interactions', 'version', '2014051200'),
(630, 'scormreport_objectives', 'version', '2014051200'),
(631, 'workshopform_accumulative', 'version', '2014051200'),
(633, 'workshopform_comments', 'version', '2014051200'),
(635, 'workshopform_numerrors', 'version', '2014051200'),
(637, 'workshopform_rubric', 'version', '2014051200'),
(639, 'workshopallocation_manual', 'version', '2014051200'),
(640, 'workshopallocation_random', 'version', '2014051200'),
(641, 'workshopallocation_scheduled', 'version', '2014051200'),
(642, 'workshopeval_best', 'version', '2014051200'),
(643, 'atto_accessibilitychecker', 'version', '2014051200'),
(644, 'atto_accessibilityhelper', 'version', '2014051200'),
(645, 'atto_align', 'version', '2014051200'),
(646, 'atto_backcolor', 'version', '2014051200'),
(647, 'atto_bold', 'version', '2014051200'),
(648, 'atto_charmap', 'version', '2014051200'),
(649, 'atto_clear', 'version', '2014051200'),
(650, 'atto_collapse', 'version', '2014051200'),
(651, 'atto_emoticon', 'version', '2014051200'),
(652, 'atto_equation', 'version', '2014051200'),
(653, 'atto_fontcolor', 'version', '2014051200'),
(654, 'atto_html', 'version', '2014051200'),
(655, 'atto_image', 'version', '2014051200'),
(656, 'atto_indent', 'version', '2014051200'),
(657, 'atto_italic', 'version', '2014051200'),
(658, 'atto_link', 'version', '2014051200'),
(659, 'atto_managefiles', 'version', '2014051200'),
(660, 'atto_media', 'version', '2014051200'),
(661, 'atto_noautolink', 'version', '2014051200'),
(662, 'atto_orderedlist', 'version', '2014051200'),
(663, 'atto_rtl', 'version', '2014051200'),
(664, 'atto_strike', 'version', '2014051200'),
(665, 'atto_subscript', 'version', '2014051200'),
(666, 'atto_superscript', 'version', '2014051200'),
(667, 'atto_table', 'version', '2014051200'),
(668, 'atto_title', 'version', '2014051200'),
(669, 'atto_underline', 'version', '2014051200'),
(670, 'atto_undo', 'version', '2014051200'),
(671, 'atto_unorderedlist', 'version', '2014051200'),
(672, 'tinymce_ctrlhelp', 'version', '2014051200'),
(673, 'tinymce_dragmath', 'version', '2014051200'),
(674, 'tinymce_managefiles', 'version', '2014051200'),
(675, 'tinymce_moodleemoticon', 'version', '2014051200'),
(676, 'tinymce_moodleimage', 'version', '2014051200'),
(677, 'tinymce_moodlemedia', 'version', '2014051200'),
(678, 'tinymce_moodlenolink', 'version', '2014051200'),
(679, 'tinymce_pdw', 'version', '2014051200'),
(680, 'tinymce_spellchecker', 'version', '2014051200'),
(682, 'tinymce_wrap', 'version', '2014051200'),
(683, 'logstore_database', 'version', '2014051200'),
(684, 'logstore_legacy', 'version', '2014051200'),
(685, 'logstore_standard', 'version', '2014051200'),
(686, 'assign', 'feedback_plugin_for_gradebook', 'assignfeedback_comments'),
(687, 'assign', 'showrecentsubmissions', '0'),
(688, 'assign', 'submissionreceipts', '1'),
(689, 'assign', 'submissionstatement', 'This assignment is my own work, except where I have acknowledged the use of the works of other people.'),
(690, 'assign', 'alwaysshowdescription', '1'),
(691, 'assign', 'alwaysshowdescription_adv', ''),
(692, 'assign', 'alwaysshowdescription_locked', ''),
(693, 'assign', 'allowsubmissionsfromdate', '0'),
(694, 'assign', 'allowsubmissionsfromdate_enabled', '1'),
(695, 'assign', 'allowsubmissionsfromdate_adv', ''),
(696, 'assign', 'duedate', '604800'),
(697, 'assign', 'duedate_enabled', '1'),
(698, 'assign', 'duedate_adv', ''),
(699, 'assign', 'cutoffdate', '1209600'),
(700, 'assign', 'cutoffdate_enabled', ''),
(701, 'assign', 'cutoffdate_adv', ''),
(702, 'assign', 'submissiondrafts', '0'),
(703, 'assign', 'submissiondrafts_adv', ''),
(704, 'assign', 'submissiondrafts_locked', ''),
(705, 'assign', 'requiresubmissionstatement', '0'),
(706, 'assign', 'requiresubmissionstatement_adv', ''),
(707, 'assign', 'requiresubmissionstatement_locked', ''),
(708, 'assign', 'attemptreopenmethod', 'none'),
(709, 'assign', 'attemptreopenmethod_adv', ''),
(710, 'assign', 'attemptreopenmethod_locked', ''),
(711, 'assign', 'maxattempts', '-1'),
(712, 'assign', 'maxattempts_adv', ''),
(713, 'assign', 'maxattempts_locked', ''),
(714, 'assign', 'teamsubmission', '0'),
(715, 'assign', 'teamsubmission_adv', ''),
(716, 'assign', 'teamsubmission_locked', ''),
(717, 'assign', 'requireallteammemberssubmit', '0'),
(718, 'assign', 'requireallteammemberssubmit_adv', ''),
(719, 'assign', 'requireallteammemberssubmit_locked', ''),
(720, 'assign', 'teamsubmissiongroupingid', ''),
(721, 'assign', 'teamsubmissiongroupingid_adv', ''),
(722, 'assign', 'sendnotifications', '0'),
(723, 'assign', 'sendnotifications_adv', ''),
(724, 'assign', 'sendnotifications_locked', ''),
(725, 'assign', 'sendlatenotifications', '0'),
(726, 'assign', 'sendlatenotifications_adv', ''),
(727, 'assign', 'sendlatenotifications_locked', ''),
(728, 'assign', 'sendstudentnotifications', '1'),
(729, 'assign', 'sendstudentnotifications_adv', ''),
(730, 'assign', 'sendstudentnotifications_locked', ''),
(731, 'assign', 'blindmarking', '0'),
(732, 'assign', 'blindmarking_adv', ''),
(733, 'assign', 'blindmarking_locked', ''),
(734, 'assign', 'markingworkflow', '0'),
(735, 'assign', 'markingworkflow_adv', ''),
(736, 'assign', 'markingworkflow_locked', ''),
(737, 'assign', 'markingallocation', '0'),
(738, 'assign', 'markingallocation_adv', ''),
(739, 'assign', 'markingallocation_locked', ''),
(740, 'assignsubmission_file', 'default', '1'),
(741, 'assignsubmission_file', 'maxbytes', '1048576'),
(742, 'assignsubmission_onlinetext', 'default', '0'),
(743, 'assignfeedback_comments', 'default', '1'),
(744, 'assignfeedback_comments', 'inline', '0'),
(745, 'assignfeedback_comments', 'inline_adv', ''),
(746, 'assignfeedback_comments', 'inline_locked', ''),
(747, 'assignfeedback_editpdf', 'stamps', ''),
(748, 'assignfeedback_editpdf', 'gspath', '/usr/bin/gs'),
(749, 'assignfeedback_file', 'default', '0'),
(750, 'assignfeedback_offline', 'default', '0'),
(751, 'book', 'requiremodintro', '1'),
(752, 'book', 'numberingoptions', '0,1,2,3'),
(753, 'book', 'numbering', '1'),
(754, 'folder', 'requiremodintro', '1'),
(755, 'folder', 'showexpanded', '1'),
(756, 'imscp', 'requiremodintro', '1'),
(757, 'imscp', 'keepold', '1'),
(758, 'imscp', 'keepold_adv', ''),
(759, 'label', 'dndmedia', '1'),
(760, 'label', 'dndresizewidth', '400'),
(761, 'label', 'dndresizeheight', '400'),
(762, 'page', 'requiremodintro', '1'),
(763, 'page', 'displayoptions', '5'),
(764, 'page', 'printheading', '1'),
(765, 'page', 'printintro', '0'),
(766, 'page', 'display', '5'),
(767, 'page', 'popupwidth', '620'),
(768, 'page', 'popupheight', '450'),
(769, 'quiz', 'timelimit', '0'),
(770, 'quiz', 'timelimit_adv', ''),
(771, 'quiz', 'overduehandling', 'autoabandon'),
(772, 'quiz', 'overduehandling_adv', ''),
(773, 'quiz', 'graceperiod', '86400'),
(774, 'quiz', 'graceperiod_adv', ''),
(775, 'quiz', 'graceperiodmin', '60'),
(776, 'quiz', 'attempts', '0'),
(777, 'quiz', 'attempts_adv', ''),
(778, 'quiz', 'grademethod', '1'),
(779, 'quiz', 'grademethod_adv', ''),
(780, 'quiz', 'maximumgrade', '10'),
(781, 'quiz', 'shufflequestions', '0'),
(782, 'quiz', 'shufflequestions_adv', ''),
(783, 'quiz', 'questionsperpage', '1'),
(784, 'quiz', 'questionsperpage_adv', ''),
(785, 'quiz', 'navmethod', 'free'),
(786, 'quiz', 'navmethod_adv', '1'),
(787, 'quiz', 'shuffleanswers', '1'),
(788, 'quiz', 'shuffleanswers_adv', ''),
(789, 'quiz', 'preferredbehaviour', 'deferredfeedback'),
(790, 'quiz', 'attemptonlast', '0'),
(791, 'quiz', 'attemptonlast_adv', '1'),
(792, 'quiz', 'reviewattempt', '69904'),
(793, 'quiz', 'reviewcorrectness', '69904'),
(794, 'quiz', 'reviewmarks', '69904'),
(795, 'quiz', 'reviewspecificfeedback', '69904'),
(796, 'quiz', 'reviewgeneralfeedback', '69904'),
(797, 'quiz', 'reviewrightanswer', '69904'),
(798, 'quiz', 'reviewoverallfeedback', '4368'),
(799, 'quiz', 'showuserpicture', '0'),
(800, 'quiz', 'showuserpicture_adv', ''),
(801, 'quiz', 'decimalpoints', '2'),
(802, 'quiz', 'decimalpoints_adv', ''),
(803, 'quiz', 'questiondecimalpoints', '-1'),
(804, 'quiz', 'questiondecimalpoints_adv', '1'),
(805, 'quiz', 'showblocks', '0'),
(806, 'quiz', 'showblocks_adv', '1'),
(807, 'quiz', 'password', ''),
(808, 'quiz', 'password_adv', '1'),
(809, 'quiz', 'subnet', ''),
(810, 'quiz', 'subnet_adv', '1'),
(811, 'quiz', 'delay1', '0'),
(812, 'quiz', 'delay1_adv', '1'),
(813, 'quiz', 'delay2', '0'),
(814, 'quiz', 'delay2_adv', '1'),
(815, 'quiz', 'browsersecurity', '-'),
(816, 'quiz', 'browsersecurity_adv', '1'),
(817, 'quiz', 'autosaveperiod', '0'),
(818, 'resource', 'framesize', '130'),
(819, 'resource', 'requiremodintro', '1'),
(820, 'resource', 'displayoptions', '0,1,4,5,6'),
(821, 'resource', 'printintro', '1'),
(822, 'resource', 'display', '0'),
(823, 'resource', 'showsize', '0'),
(824, 'resource', 'showtype', '0'),
(825, 'resource', 'popupwidth', '620'),
(826, 'resource', 'popupheight', '450'),
(827, 'resource', 'filterfiles', '0'),
(828, 'scorm', 'displaycoursestructure', '0'),
(829, 'scorm', 'displaycoursestructure_adv', ''),
(830, 'scorm', 'popup', '0'),
(831, 'scorm', 'popup_adv', ''),
(832, 'scorm', 'displayactivityname', '1'),
(833, 'scorm', 'framewidth', '100'),
(834, 'scorm', 'framewidth_adv', '1'),
(835, 'scorm', 'frameheight', '500'),
(836, 'scorm', 'frameheight_adv', '1'),
(837, 'scorm', 'winoptgrp_adv', '1'),
(838, 'scorm', 'scrollbars', '0'),
(839, 'scorm', 'directories', '0'),
(840, 'scorm', 'location', '0'),
(841, 'scorm', 'menubar', '0'),
(842, 'scorm', 'toolbar', '0'),
(843, 'scorm', 'status', '0'),
(844, 'scorm', 'skipview', '0'),
(845, 'scorm', 'skipview_adv', '1'),
(846, 'scorm', 'hidebrowse', '0'),
(847, 'scorm', 'hidebrowse_adv', '1'),
(848, 'scorm', 'hidetoc', '0'),
(849, 'scorm', 'hidetoc_adv', '1'),
(850, 'scorm', 'nav', '1'),
(851, 'scorm', 'nav_adv', '1'),
(852, 'scorm', 'navpositionleft', '-100'),
(853, 'scorm', 'navpositionleft_adv', '1'),
(854, 'scorm', 'navpositiontop', '-100'),
(855, 'scorm', 'navpositiontop_adv', '1'),
(856, 'scorm', 'collapsetocwinsize', '767'),
(857, 'scorm', 'collapsetocwinsize_adv', '1'),
(858, 'scorm', 'displayattemptstatus', '1'),
(859, 'scorm', 'displayattemptstatus_adv', ''),
(860, 'scorm', 'grademethod', '1'),
(861, 'scorm', 'maxgrade', '100'),
(862, 'scorm', 'maxattempt', '0'),
(863, 'scorm', 'whatgrade', '0'),
(864, 'scorm', 'forcecompleted', '0'),
(865, 'scorm', 'forcenewattempt', '0'),
(866, 'scorm', 'lastattemptlock', '0'),
(867, 'scorm', 'auto', '0'),
(868, 'scorm', 'updatefreq', '0'),
(869, 'scorm', 'scorm12standard', '1'),
(870, 'scorm', 'allowtypeexternal', '0'),
(871, 'scorm', 'allowtypelocalsync', '0'),
(872, 'scorm', 'allowtypeexternalaicc', '0'),
(873, 'scorm', 'allowaicchacp', '0'),
(874, 'scorm', 'aicchacptimeout', '30'),
(875, 'scorm', 'aicchacpkeepsessiondata', '1'),
(876, 'scorm', 'forcejavascript', '1'),
(877, 'scorm', 'allowapidebug', '0'),
(878, 'scorm', 'apidebugmask', '.*'),
(879, 'url', 'framesize', '130'),
(880, 'url', 'requiremodintro', '1'),
(881, 'url', 'secretphrase', ''),
(882, 'url', 'rolesinparams', '0'),
(883, 'url', 'displayoptions', '0,1,5,6'),
(884, 'url', 'printintro', '1'),
(885, 'url', 'display', '0'),
(886, 'url', 'popupwidth', '620'),
(887, 'url', 'popupheight', '450'),
(888, 'workshop', 'grade', '80'),
(889, 'workshop', 'gradinggrade', '20'),
(890, 'workshop', 'gradedecimals', '0'),
(891, 'workshop', 'maxbytes', '0'),
(892, 'workshop', 'strategy', 'accumulative'),
(893, 'workshop', 'examplesmode', '0'),
(894, 'workshopallocation_random', 'numofreviews', '5'),
(895, 'workshopform_numerrors', 'grade0', 'No'),
(896, 'workshopform_numerrors', 'grade1', 'Yes'),
(897, 'workshopeval_best', 'comparison', '5'),
(898, 'block_course_overview', 'defaultmaxcourses', '10'),
(899, 'block_course_overview', 'forcedefaultmaxcourses', '0'),
(900, 'block_course_overview', 'showchildren', '0'),
(901, 'block_course_overview', 'showwelcomearea', '0'),
(902, 'block_section_links', 'numsections1', '22'),
(903, 'block_section_links', 'incby1', '2'),
(904, 'block_section_links', 'numsections2', '40'),
(905, 'block_section_links', 'incby2', '5'),
(906, 'format_singleactivity', 'activitytype', 'forum'),
(907, 'enrol_cohort', 'roleid', '5'),
(908, 'enrol_cohort', 'unenrolaction', '0'),
(909, 'enrol_database', 'dbtype', ''),
(910, 'enrol_database', 'dbhost', 'localhost'),
(911, 'enrol_database', 'dbuser', ''),
(912, 'enrol_database', 'dbpass', ''),
(913, 'enrol_database', 'dbname', ''),
(914, 'enrol_database', 'dbencoding', 'utf-8'),
(915, 'enrol_database', 'dbsetupsql', ''),
(916, 'enrol_database', 'dbsybasequoting', '0'),
(917, 'enrol_database', 'debugdb', '0'),
(918, 'enrol_database', 'localcoursefield', 'idnumber'),
(919, 'enrol_database', 'localuserfield', 'idnumber'),
(920, 'enrol_database', 'localrolefield', 'shortname'),
(921, 'enrol_database', 'localcategoryfield', 'id'),
(922, 'enrol_database', 'remoteenroltable', ''),
(923, 'enrol_database', 'remotecoursefield', ''),
(924, 'enrol_database', 'remoteuserfield', ''),
(925, 'enrol_database', 'remoterolefield', ''),
(926, 'enrol_database', 'defaultrole', '5'),
(927, 'enrol_database', 'ignorehiddencourses', '0'),
(928, 'enrol_database', 'unenrolaction', '0'),
(929, 'enrol_database', 'newcoursetable', ''),
(930, 'enrol_database', 'newcoursefullname', 'fullname'),
(931, 'enrol_database', 'newcourseshortname', 'shortname'),
(932, 'enrol_database', 'newcourseidnumber', 'idnumber'),
(933, 'enrol_database', 'newcoursecategory', ''),
(934, 'enrol_database', 'defaultcategory', '1'),
(935, 'enrol_database', 'templatecourse', ''),
(936, 'enrol_flatfile', 'location', ''),
(937, 'enrol_flatfile', 'encoding', 'UTF-8'),
(938, 'enrol_flatfile', 'mailstudents', '0'),
(939, 'enrol_flatfile', 'mailteachers', '0'),
(940, 'enrol_flatfile', 'mailadmins', '0'),
(941, 'enrol_flatfile', 'unenrolaction', '3'),
(942, 'enrol_flatfile', 'expiredaction', '3'),
(943, 'enrol_guest', 'requirepassword', '0'),
(944, 'enrol_guest', 'usepasswordpolicy', '0'),
(945, 'enrol_guest', 'showhint', '0'),
(946, 'enrol_guest', 'defaultenrol', '1'),
(947, 'enrol_guest', 'status', '1'),
(948, 'enrol_guest', 'status_adv', ''),
(949, 'enrol_imsenterprise', 'imsfilelocation', ''),
(950, 'enrol_imsenterprise', 'logtolocation', ''),
(951, 'enrol_imsenterprise', 'mailadmins', '0'),
(952, 'enrol_imsenterprise', 'createnewusers', '0'),
(953, 'enrol_imsenterprise', 'imsdeleteusers', '0'),
(954, 'enrol_imsenterprise', 'fixcaseusernames', '0'),
(955, 'enrol_imsenterprise', 'fixcasepersonalnames', '0'),
(956, 'enrol_imsenterprise', 'imssourcedidfallback', '0'),
(957, 'enrol_imsenterprise', 'imsrolemap01', '5'),
(958, 'enrol_imsenterprise', 'imsrolemap02', '3'),
(959, 'enrol_imsenterprise', 'imsrolemap03', '3'),
(960, 'enrol_imsenterprise', 'imsrolemap04', '5'),
(961, 'enrol_imsenterprise', 'imsrolemap05', '0'),
(962, 'enrol_imsenterprise', 'imsrolemap06', '4'),
(963, 'enrol_imsenterprise', 'imsrolemap07', '0'),
(964, 'enrol_imsenterprise', 'imsrolemap08', '4'),
(965, 'enrol_imsenterprise', 'truncatecoursecodes', '0'),
(966, 'enrol_imsenterprise', 'createnewcourses', '0'),
(967, 'enrol_imsenterprise', 'createnewcategories', '0'),
(968, 'enrol_imsenterprise', 'imsunenrol', '0'),
(969, 'enrol_imsenterprise', 'imscoursemapshortname', 'coursecode'),
(970, 'enrol_imsenterprise', 'imscoursemapfullname', 'short'),
(971, 'enrol_imsenterprise', 'imscoursemapsummary', 'ignore'),
(972, 'enrol_imsenterprise', 'imsrestricttarget', ''),
(973, 'enrol_imsenterprise', 'imscapitafix', '0'),
(974, 'enrol_ldap', 'host_url', ''),
(975, 'enrol_ldap', 'start_tls', '0'),
(976, 'enrol_ldap', 'ldap_version', '3'),
(977, 'enrol_ldap', 'ldapencoding', 'utf-8'),
(978, 'enrol_ldap', 'pagesize', '250'),
(979, 'enrol_ldap', 'bind_dn', ''),
(980, 'enrol_ldap', 'bind_pw', ''),
(981, 'enrol_ldap', 'course_search_sub', '0'),
(982, 'enrol_ldap', 'memberattribute_isdn', '0'),
(983, 'enrol_ldap', 'user_contexts', ''),
(984, 'enrol_ldap', 'user_search_sub', '0'),
(985, 'enrol_ldap', 'user_type', 'default'),
(986, 'enrol_ldap', 'opt_deref', '0'),
(987, 'enrol_ldap', 'idnumber_attribute', ''),
(988, 'enrol_ldap', 'objectclass', '(objectClass=*)'),
(989, 'enrol_ldap', 'course_idnumber', ''),
(990, 'enrol_ldap', 'course_shortname', ''),
(991, 'enrol_ldap', 'course_fullname', ''),
(992, 'enrol_ldap', 'course_summary', ''),
(993, 'enrol_ldap', 'ignorehiddencourses', '0'),
(994, 'enrol_ldap', 'unenrolaction', '0'),
(995, 'enrol_ldap', 'autocreate', '0'),
(996, 'enrol_ldap', 'category', '1'),
(997, 'enrol_ldap', 'template', ''),
(998, 'enrol_ldap', 'course_shortname_updateonsync', '0'),
(999, 'enrol_ldap', 'course_fullname_updateonsync', '0'),
(1000, 'enrol_ldap', 'course_summary_updateonsync', '0'),
(1001, 'enrol_ldap', 'nested_groups', '0'),
(1002, 'enrol_ldap', 'group_memberofattribute', ''),
(1003, 'enrol_manual', 'expiredaction', '1'),
(1004, 'enrol_manual', 'expirynotifyhour', '6'),
(1005, 'enrol_manual', 'defaultenrol', '1'),
(1006, 'enrol_manual', 'status', '0'),
(1007, 'enrol_manual', 'roleid', '5'),
(1008, 'enrol_manual', 'enrolperiod', '0'),
(1009, 'enrol_manual', 'expirynotify', '0'),
(1010, 'enrol_manual', 'expirythreshold', '86400'),
(1011, 'enrol_meta', 'nosyncroleids', ''),
(1012, 'enrol_meta', 'syncall', '1'),
(1013, 'enrol_meta', 'unenrolaction', '3'),
(1014, 'enrol_mnet', 'roleid', '5'),
(1015, 'enrol_mnet', 'roleid_adv', '1'),
(1016, 'enrol_paypal', 'paypalbusiness', ''),
(1017, 'enrol_paypal', 'mailstudents', '0'),
(1018, 'enrol_paypal', 'mailteachers', '0'),
(1019, 'enrol_paypal', 'mailadmins', '0'),
(1020, 'enrol_paypal', 'expiredaction', '3'),
(1021, 'enrol_paypal', 'status', '1'),
(1022, 'enrol_paypal', 'cost', '0'),
(1023, 'enrol_paypal', 'currency', 'USD'),
(1024, 'enrol_paypal', 'roleid', '5'),
(1025, 'enrol_paypal', 'enrolperiod', '0'),
(1026, 'enrol_self', 'requirepassword', '0'),
(1027, 'enrol_self', 'usepasswordpolicy', '0'),
(1028, 'enrol_self', 'showhint', '0'),
(1029, 'enrol_self', 'expiredaction', '1');
INSERT INTO `mdl_config_plugins` (`id`, `plugin`, `name`, `value`) VALUES
(1030, 'enrol_self', 'expirynotifyhour', '6'),
(1031, 'enrol_self', 'defaultenrol', '1'),
(1032, 'enrol_self', 'status', '1'),
(1033, 'enrol_self', 'newenrols', '1'),
(1034, 'enrol_self', 'groupkey', '0'),
(1035, 'enrol_self', 'roleid', '5'),
(1036, 'enrol_self', 'enrolperiod', '0'),
(1037, 'enrol_self', 'expirynotify', '0'),
(1038, 'enrol_self', 'expirythreshold', '86400'),
(1039, 'enrol_self', 'longtimenosee', '0'),
(1040, 'enrol_self', 'maxenrolled', '0'),
(1041, 'enrol_self', 'sendcoursewelcomemessage', '1'),
(1042, 'filter_emoticon', 'formats', '1,4,0'),
(1043, 'filter_mathjaxloader', 'httpurl', 'http://cdn.mathjax.org/mathjax/2.3-latest/MathJax.js'),
(1044, 'filter_mathjaxloader', 'httpsurl', 'https://cdn.mathjax.org/mathjax/2.3-latest/MathJax.js'),
(1045, 'filter_mathjaxloader', 'texfiltercompatibility', '0'),
(1046, 'filter_mathjaxloader', 'mathjaxconfig', '\nMathJax.Hub.Config({\n    config: ["MMLorHTML.js", "Safe.js"],\n    jax: ["input/TeX","input/MathML","output/HTML-CSS","output/NativeMML"],\n    extensions: ["tex2jax.js","mml2jax.js","MathMenu.js","MathZoom.js"],\n    TeX: {\n        extensions: ["AMSmath.js","AMSsymbols.js","noErrors.js","noUndefined.js"]\n    },\n    menuSettings: {\n        zoom: "Double-Click",\n        mpContext: true,\n        mpMouse: true\n    },\n    errorSettings: { message: ["!"] },\n    skipStartupTypeset: true,\n    messageStyle: "none"\n});\n'),
(1047, 'filter_mathjaxloader', 'additionaldelimiters', ''),
(1048, 'filter_tex', 'latexpreamble', '\\usepackage[latin1]{inputenc}\n\\usepackage{amsmath}\n\\usepackage{amsfonts}\n\\RequirePackage{amsmath,amssymb,latexsym}\n'),
(1049, 'filter_tex', 'latexbackground', '#FFFFFF'),
(1050, 'filter_tex', 'density', '120'),
(1051, 'filter_tex', 'pathlatex', '/sw/bin/latex'),
(1052, 'filter_tex', 'pathdvips', '/sw/bin/dvips'),
(1053, 'filter_tex', 'pathconvert', '/sw/bin/convert'),
(1054, 'filter_tex', 'pathmimetex', ''),
(1055, 'filter_tex', 'convertformat', 'gif'),
(1056, 'filter_urltolink', 'formats', '0'),
(1057, 'filter_urltolink', 'embedimages', '1'),
(1058, 'logstore_database', 'dbdriver', ''),
(1059, 'logstore_database', 'dbhost', ''),
(1060, 'logstore_database', 'dbuser', ''),
(1061, 'logstore_database', 'dbpass', ''),
(1062, 'logstore_database', 'dbname', ''),
(1063, 'logstore_database', 'dbtable', ''),
(1064, 'logstore_database', 'dbpersist', '0'),
(1065, 'logstore_database', 'dbsocket', ''),
(1066, 'logstore_database', 'dbport', ''),
(1067, 'logstore_database', 'dbschema', ''),
(1068, 'logstore_database', 'dbcollation', ''),
(1069, 'logstore_database', 'buffersize', '50'),
(1070, 'logstore_database', 'logguests', '0'),
(1071, 'logstore_database', 'includelevels', '1,2,0'),
(1072, 'logstore_database', 'includeactions', 'c,r,u,d'),
(1073, 'logstore_legacy', 'loglegacy', '0'),
(1074, 'logstore_standard', 'logguests', '1'),
(1075, 'logstore_standard', 'loglifetime', '0'),
(1076, 'logstore_standard', 'buffersize', '50'),
(1077, 'editor_atto', 'toolbar', 'collapse = collapse\nstyle1 = title, bold, italic\nlist = unorderedlist, orderedlist\nlinks = link\nfiles = image, media, managefiles\nstyle2 = underline, strike, subscript, superscript\nalign = align\nindent = indent\ninsert = equation, charmap, table, clear\nundo = undo\naccessibility = accessibilitychecker, accessibilityhelper\nother = html'),
(1078, 'atto_collapse', 'showgroups', '5'),
(1079, 'atto_equation', 'librarygroup1', '\n\\cdot\n\\times\n\\ast\n\\div\n\\diamond\n\\pm\n\\mp\n\\oplus\n\\ominus\n\\otimes\n\\oslash\n\\odot\n\\circ\n\\bullet\n\\asymp\n\\equiv\n\\subseteq\n\\supseteq\n\\leq\n\\geq\n\\preceq\n\\succeq\n\\sim\n\\simeq\n\\approx\n\\subset\n\\supset\n\\ll\n\\gg\n\\prec\n\\succ\n\\infty\n\\in\n\\ni\n\\forall\n\\exists\n\\neq\n'),
(1080, 'atto_equation', 'librarygroup2', '\n\\leftarrow\n\\rightarrow\n\\uparrow\n\\downarrow\n\\leftrightarrow\n\\nearrow\n\\searrow\n\\swarrow\n\\nwarrow\n\\Leftarrow\n\\Rightarrow\n\\Uparrow\n\\Downarrow\n\\Leftrightarrow\n'),
(1081, 'atto_equation', 'librarygroup3', '\n\\alpha\n\\beta\n\\gamma\n\\delta\n\\epsilon\n\\zeta\n\\eta\n\\theta\n\\iota\n\\kappa\n\\lambda\n\\mu\n\\nu\n\\xi\n\\pi\n\\rho\n\\sigma\n\\tau\n\\upsilon\n\\phi\n\\chi\n\\psi\n\\omega\n\\Gamma\n\\Delta\n\\Theta\n\\Lambda\n\\Xi\n\\Pi\n\\Sigma\n\\Upsilon\n\\Phi\n\\Psi\n\\Omega\n'),
(1082, 'atto_equation', 'librarygroup4', '\n\\sum{a,b}\n\\int_{a}^{b}{c}\n\\iint_{a}^{b}{c}\n\\iiint_{a}^{b}{c}\n\\oint{a}\n(a)\n[a]\n\\lbrace{a}\\rbrace\n\\left| \\begin{matrix} a_1 & a_2 \\ a_3 & a_4 \\end{matrix} \\right|\n'),
(1083, 'editor_tinymce', 'customtoolbar', 'wrap,formatselect,wrap,bold,italic,wrap,bullist,numlist,wrap,link,unlink,wrap,image\n\nundo,redo,wrap,underline,strikethrough,sub,sup,wrap,justifyleft,justifycenter,justifyright,wrap,outdent,indent,wrap,forecolor,backcolor,wrap,ltr,rtl\n\nfontselect,fontsizeselect,wrap,code,search,replace,wrap,nonbreaking,charmap,table,wrap,cleanup,removeformat,pastetext,pasteword,wrap,fullscreen'),
(1084, 'editor_tinymce', 'fontselectlist', 'Trebuchet=Trebuchet MS,Verdana,Arial,Helvetica,sans-serif;Arial=arial,helvetica,sans-serif;Courier New=courier new,courier,monospace;Georgia=georgia,times new roman,times,serif;Tahoma=tahoma,arial,helvetica,sans-serif;Times New Roman=times new roman,times,serif;Verdana=verdana,arial,helvetica,sans-serif;Impact=impact;Wingdings=wingdings'),
(1085, 'editor_tinymce', 'customconfig', ''),
(1086, 'tinymce_dragmath', 'requiretex', '1'),
(1087, 'tinymce_moodleemoticon', 'requireemoticon', '1'),
(1088, 'tinymce_spellchecker', 'spellengine', ''),
(1089, 'tinymce_spellchecker', 'spelllanguagelist', '+English=en,Danish=da,Dutch=nl,Finnish=fi,French=fr,German=de,Italian=it,Polish=pl,Portuguese=pt,Spanish=es,Swedish=sv'),
(1090, 'enrol_manual', 'expirynotifylast', '1415196025'),
(1091, 'enrol_manual', 'lastcron', '1415196025'),
(1092, 'enrol_self', 'expirynotifylast', '1415196025'),
(1093, 'enrol_self', 'lastcron', '1415196025'),
(1094, 'enrol_cohort', 'lastcron', '1415196025'),
(1095, 'quiz_statistics', 'lastcron', '1415196027'),
(1096, 'workshopallocation_scheduled', 'lastcron', '1415196027'),
(1097, 'repository_dropbox', 'lastcron', '1415196028'),
(1098, 'repository_filesystem', 'lastcron', '1415196028'),
(1099, 'registration', 'crontime', '1415196028'),
(1100, 'block_quickmail', 'version', '2014042914');

-- --------------------------------------------------------

--
-- Table structure for table `mdl_context`
--

CREATE TABLE IF NOT EXISTS `mdl_context` (
`id` bigint(10) NOT NULL,
  `contextlevel` bigint(10) NOT NULL DEFAULT '0',
  `instanceid` bigint(10) NOT NULL DEFAULT '0',
  `path` varchar(255) DEFAULT NULL,
  `depth` tinyint(2) NOT NULL DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8 COMMENT='one of these must be set';

--
-- Dumping data for table `mdl_context`
--

INSERT INTO `mdl_context` (`id`, `contextlevel`, `instanceid`, `path`, `depth`) VALUES
(1, 10, 0, '/1', 1),
(2, 50, 1, '/1/2', 2),
(3, 40, 1, '/1/3', 2),
(4, 30, 1, '/1/4', 2),
(5, 30, 2, '/1/5', 2),
(6, 80, 1, '/1/2/6', 3),
(7, 80, 2, '/1/2/7', 3),
(8, 80, 3, '/1/2/8', 3),
(9, 80, 4, '/1/9', 2),
(10, 80, 5, '/1/10', 2),
(11, 80, 6, '/1/11', 2),
(12, 80, 7, '/1/12', 2),
(13, 80, 8, '/1/13', 2),
(14, 80, 9, '/1/14', 2),
(15, 40, 2, '/1/15', 2),
(16, 50, 2, '/1/15/16', 3),
(17, 80, 10, '/1/15/16/17', 4),
(18, 80, 11, '/1/15/16/18', 4),
(19, 80, 12, '/1/15/16/19', 4),
(20, 80, 13, '/1/15/16/20', 4),
(21, 70, 1, '/1/15/16/21', 4),
(22, 30, 3, '/1/22', 2),
(23, 30, 4, '/1/23', 2),
(24, 30, 5, '/1/24', 2),
(26, 70, 3, '/1/15/16/26', 4);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_context_temp`
--

CREATE TABLE IF NOT EXISTS `mdl_context_temp` (
  `id` bigint(10) NOT NULL,
  `path` varchar(255) NOT NULL DEFAULT '',
  `depth` tinyint(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Used by build_context_path() in upgrade and cron to keep con';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_course`
--

CREATE TABLE IF NOT EXISTS `mdl_course` (
`id` bigint(10) NOT NULL,
  `category` bigint(10) NOT NULL DEFAULT '0',
  `sortorder` bigint(10) NOT NULL DEFAULT '0',
  `fullname` varchar(254) NOT NULL DEFAULT '',
  `shortname` varchar(255) NOT NULL DEFAULT '',
  `idnumber` varchar(100) NOT NULL DEFAULT '',
  `summary` longtext,
  `summaryformat` tinyint(2) NOT NULL DEFAULT '0',
  `format` varchar(21) NOT NULL DEFAULT 'topics',
  `showgrades` tinyint(2) NOT NULL DEFAULT '1',
  `newsitems` mediumint(5) NOT NULL DEFAULT '1',
  `startdate` bigint(10) NOT NULL DEFAULT '0',
  `marker` bigint(10) NOT NULL DEFAULT '0',
  `maxbytes` bigint(10) NOT NULL DEFAULT '0',
  `legacyfiles` smallint(4) NOT NULL DEFAULT '0',
  `showreports` smallint(4) NOT NULL DEFAULT '0',
  `visible` tinyint(1) NOT NULL DEFAULT '1',
  `visibleold` tinyint(1) NOT NULL DEFAULT '1',
  `groupmode` smallint(4) NOT NULL DEFAULT '0',
  `groupmodeforce` smallint(4) NOT NULL DEFAULT '0',
  `defaultgroupingid` bigint(10) NOT NULL DEFAULT '0',
  `lang` varchar(30) NOT NULL DEFAULT '',
  `calendartype` varchar(30) NOT NULL DEFAULT '',
  `theme` varchar(50) NOT NULL DEFAULT '',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `requested` tinyint(1) NOT NULL DEFAULT '0',
  `enablecompletion` tinyint(1) NOT NULL DEFAULT '0',
  `completionnotify` tinyint(1) NOT NULL DEFAULT '0',
  `cacherev` bigint(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='Central course table';

--
-- Dumping data for table `mdl_course`
--

INSERT INTO `mdl_course` (`id`, `category`, `sortorder`, `fullname`, `shortname`, `idnumber`, `summary`, `summaryformat`, `format`, `showgrades`, `newsitems`, `startdate`, `marker`, `maxbytes`, `legacyfiles`, `showreports`, `visible`, `visibleold`, `groupmode`, `groupmodeforce`, `defaultgroupingid`, `lang`, `calendartype`, `theme`, `timecreated`, `timemodified`, `requested`, `enablecompletion`, `completionnotify`, `cacherev`) VALUES
(1, 0, 1, 'Capacita Online', 'Capacita Online', '', '<p>Sitio para Capacita Online<br></p>', 0, 'site', 1, 3, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, '', '', '', 1415060944, 1415062656, 0, 0, 0, 1417664311),
(2, 2, 10001, 'Curso de prueba online', 'CP-01', '', '<p>Primer curso de prueba para capacita online.</p>', 1, 'weeks', 1, 5, 1418194800, 0, 0, 0, 1, 1, 1, 1, 0, 0, '', '', '', 1415372771, 1418230004, 0, 0, 0, 1419704464);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_course_categories`
--

CREATE TABLE IF NOT EXISTS `mdl_course_categories` (
`id` bigint(10) NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `idnumber` varchar(100) DEFAULT NULL,
  `description` longtext,
  `descriptionformat` tinyint(2) NOT NULL DEFAULT '0',
  `parent` bigint(10) NOT NULL DEFAULT '0',
  `sortorder` bigint(10) NOT NULL DEFAULT '0',
  `coursecount` bigint(10) NOT NULL DEFAULT '0',
  `visible` tinyint(1) NOT NULL DEFAULT '1',
  `visibleold` tinyint(1) NOT NULL DEFAULT '1',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `depth` bigint(10) NOT NULL DEFAULT '0',
  `path` varchar(255) NOT NULL DEFAULT '',
  `theme` varchar(50) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='Course categories';

--
-- Dumping data for table `mdl_course_categories`
--

INSERT INTO `mdl_course_categories` (`id`, `name`, `idnumber`, `description`, `descriptionformat`, `parent`, `sortorder`, `coursecount`, `visible`, `visibleold`, `timemodified`, `depth`, `path`, `theme`) VALUES
(1, 'Miscellaneous', NULL, NULL, 0, 0, 20000, 0, 0, 0, 1415060944, 1, '/1', NULL),
(2, 'Capacita Online', '001', '<p>Categoría para para los cursos en línea de capacita.</p>', 1, 0, 10000, 1, 1, 1, 1415372547, 1, '/2', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_course_completions`
--

CREATE TABLE IF NOT EXISTS `mdl_course_completions` (
`id` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `course` bigint(10) NOT NULL DEFAULT '0',
  `timeenrolled` bigint(10) NOT NULL DEFAULT '0',
  `timestarted` bigint(10) NOT NULL DEFAULT '0',
  `timecompleted` bigint(10) DEFAULT NULL,
  `reaggregate` bigint(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Course completion records';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_course_completion_aggr_methd`
--

CREATE TABLE IF NOT EXISTS `mdl_course_completion_aggr_methd` (
`id` bigint(10) NOT NULL,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `criteriatype` bigint(10) DEFAULT NULL,
  `method` tinyint(1) NOT NULL DEFAULT '0',
  `value` decimal(10,5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Course completion aggregation methods for criteria';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_course_completion_criteria`
--

CREATE TABLE IF NOT EXISTS `mdl_course_completion_criteria` (
`id` bigint(10) NOT NULL,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `criteriatype` bigint(10) NOT NULL DEFAULT '0',
  `module` varchar(100) DEFAULT NULL,
  `moduleinstance` bigint(10) DEFAULT NULL,
  `courseinstance` bigint(10) DEFAULT NULL,
  `enrolperiod` bigint(10) DEFAULT NULL,
  `timeend` bigint(10) DEFAULT NULL,
  `gradepass` decimal(10,5) DEFAULT NULL,
  `role` bigint(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Course completion criteria';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_course_completion_crit_compl`
--

CREATE TABLE IF NOT EXISTS `mdl_course_completion_crit_compl` (
`id` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `course` bigint(10) NOT NULL DEFAULT '0',
  `criteriaid` bigint(10) NOT NULL DEFAULT '0',
  `gradefinal` decimal(10,5) DEFAULT NULL,
  `unenroled` bigint(10) DEFAULT NULL,
  `timecompleted` bigint(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Course completion user records';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_course_format_options`
--

CREATE TABLE IF NOT EXISTS `mdl_course_format_options` (
`id` bigint(10) NOT NULL,
  `courseid` bigint(10) NOT NULL,
  `format` varchar(21) NOT NULL DEFAULT '',
  `sectionid` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(100) NOT NULL DEFAULT '',
  `value` longtext
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='Stores format-specific options for the course or course sect';

--
-- Dumping data for table `mdl_course_format_options`
--

INSERT INTO `mdl_course_format_options` (`id`, `courseid`, `format`, `sectionid`, `name`, `value`) VALUES
(1, 1, 'site', 0, 'numsections', '1'),
(2, 2, 'weeks', 0, 'numsections', '10'),
(3, 2, 'weeks', 0, 'hiddensections', '1'),
(4, 2, 'weeks', 0, 'coursedisplay', '0');

-- --------------------------------------------------------

--
-- Table structure for table `mdl_course_modules`
--

CREATE TABLE IF NOT EXISTS `mdl_course_modules` (
`id` bigint(10) NOT NULL,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `module` bigint(10) NOT NULL DEFAULT '0',
  `instance` bigint(10) NOT NULL DEFAULT '0',
  `section` bigint(10) NOT NULL DEFAULT '0',
  `idnumber` varchar(100) DEFAULT NULL,
  `added` bigint(10) NOT NULL DEFAULT '0',
  `score` smallint(4) NOT NULL DEFAULT '0',
  `indent` mediumint(5) NOT NULL DEFAULT '0',
  `visible` tinyint(1) NOT NULL DEFAULT '1',
  `visibleold` tinyint(1) NOT NULL DEFAULT '1',
  `groupmode` smallint(4) NOT NULL DEFAULT '0',
  `groupingid` bigint(10) NOT NULL DEFAULT '0',
  `groupmembersonly` smallint(4) NOT NULL DEFAULT '0',
  `completion` tinyint(1) NOT NULL DEFAULT '0',
  `completiongradeitemnumber` bigint(10) DEFAULT NULL,
  `completionview` tinyint(1) NOT NULL DEFAULT '0',
  `completionexpected` bigint(10) NOT NULL DEFAULT '0',
  `showdescription` tinyint(1) NOT NULL DEFAULT '0',
  `availability` longtext
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='course_modules table retrofitted from MySQL';

--
-- Dumping data for table `mdl_course_modules`
--

INSERT INTO `mdl_course_modules` (`id`, `course`, `module`, `instance`, `section`, `idnumber`, `added`, `score`, `indent`, `visible`, `visibleold`, `groupmode`, `groupingid`, `groupmembersonly`, `completion`, `completiongradeitemnumber`, `completionview`, `completionexpected`, `showdescription`, `availability`) VALUES
(1, 2, 9, 1, 1, NULL, 1415912226, 0, 0, 1, 1, 0, 0, 0, 0, NULL, 0, 0, 0, NULL),
(3, 2, 16, 1, 6, '', 1419704462, 0, 0, 1, 1, 1, 0, 0, 0, NULL, 0, 0, 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_course_modules_completion`
--

CREATE TABLE IF NOT EXISTS `mdl_course_modules_completion` (
`id` bigint(10) NOT NULL,
  `coursemoduleid` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `completionstate` tinyint(1) NOT NULL,
  `viewed` tinyint(1) DEFAULT NULL,
  `timemodified` bigint(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores the completion state (completed or not completed, etc';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_course_published`
--

CREATE TABLE IF NOT EXISTS `mdl_course_published` (
`id` bigint(10) NOT NULL,
  `huburl` varchar(255) DEFAULT NULL,
  `courseid` bigint(10) NOT NULL,
  `timepublished` bigint(10) NOT NULL,
  `enrollable` tinyint(1) NOT NULL DEFAULT '1',
  `hubcourseid` bigint(10) NOT NULL,
  `status` tinyint(1) DEFAULT '0',
  `timechecked` bigint(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Information about how and when an local courses were publish';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_course_request`
--

CREATE TABLE IF NOT EXISTS `mdl_course_request` (
`id` bigint(10) NOT NULL,
  `fullname` varchar(254) NOT NULL DEFAULT '',
  `shortname` varchar(100) NOT NULL DEFAULT '',
  `summary` longtext NOT NULL,
  `summaryformat` tinyint(2) NOT NULL DEFAULT '0',
  `category` bigint(10) NOT NULL DEFAULT '0',
  `reason` longtext NOT NULL,
  `requester` bigint(10) NOT NULL DEFAULT '0',
  `password` varchar(50) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='course requests';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_course_sections`
--

CREATE TABLE IF NOT EXISTS `mdl_course_sections` (
`id` bigint(10) NOT NULL,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `section` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) DEFAULT NULL,
  `summary` longtext,
  `summaryformat` tinyint(2) NOT NULL DEFAULT '0',
  `sequence` longtext,
  `visible` tinyint(1) NOT NULL DEFAULT '1',
  `availability` longtext
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COMMENT='to define the sections for each course';

--
-- Dumping data for table `mdl_course_sections`
--

INSERT INTO `mdl_course_sections` (`id`, `course`, `section`, `name`, `summary`, `summaryformat`, `sequence`, `visible`, `availability`) VALUES
(1, 2, 0, NULL, '', 1, '1', 1, NULL),
(2, 1, 0, NULL, '', 1, '', 1, NULL),
(3, 1, 1, NULL, '', 1, '', 1, NULL),
(4, 2, 1, 'Sección 01', '<p>Esta es la prueba 01 para una sección.<br></p>', 1, '', 1, NULL),
(5, 2, 2, NULL, '', 1, '', 1, NULL),
(6, 2, 3, NULL, '', 1, '3', 1, NULL),
(7, 2, 4, NULL, '', 1, '', 1, NULL),
(8, 2, 5, NULL, '', 1, '', 1, NULL),
(9, 2, 6, NULL, '', 1, '', 1, NULL),
(10, 2, 7, NULL, '', 1, '', 1, NULL),
(11, 2, 8, NULL, '', 1, '', 1, NULL),
(12, 2, 9, NULL, '', 1, '', 1, NULL),
(13, 2, 10, NULL, '', 1, '', 1, NULL),
(14, 2, 11, NULL, '', 1, '', 1, NULL),
(15, 2, 12, NULL, '', 1, '', 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_data`
--

CREATE TABLE IF NOT EXISTS `mdl_data` (
`id` bigint(10) NOT NULL,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `intro` longtext NOT NULL,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `comments` smallint(4) NOT NULL DEFAULT '0',
  `timeavailablefrom` bigint(10) NOT NULL DEFAULT '0',
  `timeavailableto` bigint(10) NOT NULL DEFAULT '0',
  `timeviewfrom` bigint(10) NOT NULL DEFAULT '0',
  `timeviewto` bigint(10) NOT NULL DEFAULT '0',
  `requiredentries` int(8) NOT NULL DEFAULT '0',
  `requiredentriestoview` int(8) NOT NULL DEFAULT '0',
  `maxentries` int(8) NOT NULL DEFAULT '0',
  `rssarticles` smallint(4) NOT NULL DEFAULT '0',
  `singletemplate` longtext,
  `listtemplate` longtext,
  `listtemplateheader` longtext,
  `listtemplatefooter` longtext,
  `addtemplate` longtext,
  `rsstemplate` longtext,
  `rsstitletemplate` longtext,
  `csstemplate` longtext,
  `jstemplate` longtext,
  `asearchtemplate` longtext,
  `approval` smallint(4) NOT NULL DEFAULT '0',
  `scale` bigint(10) NOT NULL DEFAULT '0',
  `assessed` bigint(10) NOT NULL DEFAULT '0',
  `assesstimestart` bigint(10) NOT NULL DEFAULT '0',
  `assesstimefinish` bigint(10) NOT NULL DEFAULT '0',
  `defaultsort` bigint(10) NOT NULL DEFAULT '0',
  `defaultsortdir` smallint(4) NOT NULL DEFAULT '0',
  `editany` smallint(4) NOT NULL DEFAULT '0',
  `notification` bigint(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='all database activities';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_data_content`
--

CREATE TABLE IF NOT EXISTS `mdl_data_content` (
`id` bigint(10) NOT NULL,
  `fieldid` bigint(10) NOT NULL DEFAULT '0',
  `recordid` bigint(10) NOT NULL DEFAULT '0',
  `content` longtext,
  `content1` longtext,
  `content2` longtext,
  `content3` longtext,
  `content4` longtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='the content introduced in each record/fields';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_data_fields`
--

CREATE TABLE IF NOT EXISTS `mdl_data_fields` (
`id` bigint(10) NOT NULL,
  `dataid` bigint(10) NOT NULL DEFAULT '0',
  `type` varchar(255) NOT NULL DEFAULT '',
  `name` varchar(255) NOT NULL DEFAULT '',
  `description` longtext NOT NULL,
  `param1` longtext,
  `param2` longtext,
  `param3` longtext,
  `param4` longtext,
  `param5` longtext,
  `param6` longtext,
  `param7` longtext,
  `param8` longtext,
  `param9` longtext,
  `param10` longtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='every field available';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_data_records`
--

CREATE TABLE IF NOT EXISTS `mdl_data_records` (
`id` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `groupid` bigint(10) NOT NULL DEFAULT '0',
  `dataid` bigint(10) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `approved` smallint(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='every record introduced';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_enrol`
--

CREATE TABLE IF NOT EXISTS `mdl_enrol` (
`id` bigint(10) NOT NULL,
  `enrol` varchar(20) NOT NULL DEFAULT '',
  `status` bigint(10) NOT NULL DEFAULT '0',
  `courseid` bigint(10) NOT NULL,
  `sortorder` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) DEFAULT NULL,
  `enrolperiod` bigint(10) DEFAULT '0',
  `enrolstartdate` bigint(10) DEFAULT '0',
  `enrolenddate` bigint(10) DEFAULT '0',
  `expirynotify` tinyint(1) DEFAULT '0',
  `expirythreshold` bigint(10) DEFAULT '0',
  `notifyall` tinyint(1) DEFAULT '0',
  `password` varchar(50) DEFAULT NULL,
  `cost` varchar(20) DEFAULT NULL,
  `currency` varchar(3) DEFAULT NULL,
  `roleid` bigint(10) DEFAULT '0',
  `customint1` bigint(10) DEFAULT NULL,
  `customint2` bigint(10) DEFAULT NULL,
  `customint3` bigint(10) DEFAULT NULL,
  `customint4` bigint(10) DEFAULT NULL,
  `customint5` bigint(10) DEFAULT NULL,
  `customint6` bigint(10) DEFAULT NULL,
  `customint7` bigint(10) DEFAULT NULL,
  `customint8` bigint(10) DEFAULT NULL,
  `customchar1` varchar(255) DEFAULT NULL,
  `customchar2` varchar(255) DEFAULT NULL,
  `customchar3` varchar(1333) DEFAULT NULL,
  `customdec1` decimal(12,7) DEFAULT NULL,
  `customdec2` decimal(12,7) DEFAULT NULL,
  `customtext1` longtext,
  `customtext2` longtext,
  `customtext3` longtext,
  `customtext4` longtext,
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='Instances of enrolment plugins used in courses, fields marke';

--
-- Dumping data for table `mdl_enrol`
--

INSERT INTO `mdl_enrol` (`id`, `enrol`, `status`, `courseid`, `sortorder`, `name`, `enrolperiod`, `enrolstartdate`, `enrolenddate`, `expirynotify`, `expirythreshold`, `notifyall`, `password`, `cost`, `currency`, `roleid`, `customint1`, `customint2`, `customint3`, `customint4`, `customint5`, `customint6`, `customint7`, `customint8`, `customchar1`, `customchar2`, `customchar3`, `customdec1`, `customdec2`, `customtext1`, `customtext2`, `customtext3`, `customtext4`, `timecreated`, `timemodified`) VALUES
(1, 'manual', 0, 2, 0, NULL, 0, 0, 0, 0, 86400, 0, NULL, NULL, NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1415372771, 1415372771),
(2, 'guest', 1, 2, 1, NULL, 0, 0, 0, 0, 0, 0, '', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1415372771, 1418230004),
(3, 'self', 1, 2, 2, NULL, 0, 0, 0, 0, 86400, 0, NULL, NULL, NULL, 5, 0, 0, 0, 1, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1415372771, 1415372771);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_enrol_flatfile`
--

CREATE TABLE IF NOT EXISTS `mdl_enrol_flatfile` (
`id` bigint(10) NOT NULL,
  `action` varchar(30) NOT NULL DEFAULT '',
  `roleid` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `courseid` bigint(10) NOT NULL,
  `timestart` bigint(10) NOT NULL DEFAULT '0',
  `timeend` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='enrol_flatfile table retrofitted from MySQL';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_enrol_paypal`
--

CREATE TABLE IF NOT EXISTS `mdl_enrol_paypal` (
`id` bigint(10) NOT NULL,
  `business` varchar(255) NOT NULL DEFAULT '',
  `receiver_email` varchar(255) NOT NULL DEFAULT '',
  `receiver_id` varchar(255) NOT NULL DEFAULT '',
  `item_name` varchar(255) NOT NULL DEFAULT '',
  `courseid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `instanceid` bigint(10) NOT NULL DEFAULT '0',
  `memo` varchar(255) NOT NULL DEFAULT '',
  `tax` varchar(255) NOT NULL DEFAULT '',
  `option_name1` varchar(255) NOT NULL DEFAULT '',
  `option_selection1_x` varchar(255) NOT NULL DEFAULT '',
  `option_name2` varchar(255) NOT NULL DEFAULT '',
  `option_selection2_x` varchar(255) NOT NULL DEFAULT '',
  `payment_status` varchar(255) NOT NULL DEFAULT '',
  `pending_reason` varchar(255) NOT NULL DEFAULT '',
  `reason_code` varchar(30) NOT NULL DEFAULT '',
  `txn_id` varchar(255) NOT NULL DEFAULT '',
  `parent_txn_id` varchar(255) NOT NULL DEFAULT '',
  `payment_type` varchar(30) NOT NULL DEFAULT '',
  `timeupdated` bigint(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Holds all known information about PayPal transactions';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_event`
--

CREATE TABLE IF NOT EXISTS `mdl_event` (
`id` bigint(10) NOT NULL,
  `name` longtext NOT NULL,
  `description` longtext NOT NULL,
  `format` smallint(4) NOT NULL DEFAULT '0',
  `courseid` bigint(10) NOT NULL DEFAULT '0',
  `groupid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `repeatid` bigint(10) NOT NULL DEFAULT '0',
  `modulename` varchar(20) NOT NULL DEFAULT '',
  `instance` bigint(10) NOT NULL DEFAULT '0',
  `eventtype` varchar(20) NOT NULL DEFAULT '',
  `timestart` bigint(10) NOT NULL DEFAULT '0',
  `timeduration` bigint(10) NOT NULL DEFAULT '0',
  `visible` smallint(4) NOT NULL DEFAULT '1',
  `uuid` varchar(255) NOT NULL DEFAULT '',
  `sequence` bigint(10) NOT NULL DEFAULT '1',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `subscriptionid` bigint(10) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='For everything with a time associated to it';

--
-- Dumping data for table `mdl_event`
--

INSERT INTO `mdl_event` (`id`, `name`, `description`, `format`, `courseid`, `groupid`, `userid`, `repeatid`, `modulename`, `instance`, `eventtype`, `timestart`, `timeduration`, `visible`, `uuid`, `sequence`, `timemodified`, `subscriptionid`) VALUES
(1, 'Quiz 1 (Cuestionario cerrado)', '', 1, 2, 0, 2, 0, 'quiz', 1, 'close', 1419963480, 0, 1, '', 1, 1419704462, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_events_handlers`
--

CREATE TABLE IF NOT EXISTS `mdl_events_handlers` (
`id` bigint(10) NOT NULL,
  `eventname` varchar(166) NOT NULL DEFAULT '',
  `component` varchar(166) NOT NULL DEFAULT '',
  `handlerfile` varchar(255) NOT NULL DEFAULT '',
  `handlerfunction` longtext,
  `schedule` varchar(255) DEFAULT NULL,
  `status` bigint(10) NOT NULL DEFAULT '0',
  `internal` tinyint(2) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='This table is for storing which components requests what typ';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_events_queue`
--

CREATE TABLE IF NOT EXISTS `mdl_events_queue` (
`id` bigint(10) NOT NULL,
  `eventdata` longtext NOT NULL,
  `stackdump` longtext,
  `userid` bigint(10) DEFAULT NULL,
  `timecreated` bigint(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='This table is for storing queued events. It stores only one ';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_events_queue_handlers`
--

CREATE TABLE IF NOT EXISTS `mdl_events_queue_handlers` (
`id` bigint(10) NOT NULL,
  `queuedeventid` bigint(10) NOT NULL,
  `handlerid` bigint(10) NOT NULL,
  `status` bigint(10) DEFAULT NULL,
  `errormessage` longtext,
  `timemodified` bigint(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='This is the list of queued handlers for processing. The even';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_event_subscriptions`
--

CREATE TABLE IF NOT EXISTS `mdl_event_subscriptions` (
`id` bigint(10) NOT NULL,
  `url` varchar(255) NOT NULL DEFAULT '',
  `courseid` bigint(10) NOT NULL DEFAULT '0',
  `groupid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `eventtype` varchar(20) NOT NULL DEFAULT '',
  `pollinterval` bigint(10) NOT NULL DEFAULT '0',
  `lastupdated` bigint(10) DEFAULT NULL,
  `name` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tracks subscriptions to remote calendars.';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_external_functions`
--

CREATE TABLE IF NOT EXISTS `mdl_external_functions` (
`id` bigint(10) NOT NULL,
  `name` varchar(200) NOT NULL DEFAULT '',
  `classname` varchar(100) NOT NULL DEFAULT '',
  `methodname` varchar(100) NOT NULL DEFAULT '',
  `classpath` varchar(255) DEFAULT NULL,
  `component` varchar(100) NOT NULL DEFAULT '',
  `capabilities` varchar(255) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=120 DEFAULT CHARSET=utf8 COMMENT='list of all external functions';

--
-- Dumping data for table `mdl_external_functions`
--

INSERT INTO `mdl_external_functions` (`id`, `name`, `classname`, `methodname`, `classpath`, `component`, `capabilities`) VALUES
(1, 'core_cohort_create_cohorts', 'core_cohort_external', 'create_cohorts', 'cohort/externallib.php', 'moodle', 'moodle/cohort:manage'),
(2, 'core_cohort_delete_cohorts', 'core_cohort_external', 'delete_cohorts', 'cohort/externallib.php', 'moodle', 'moodle/cohort:manage'),
(3, 'core_cohort_get_cohorts', 'core_cohort_external', 'get_cohorts', 'cohort/externallib.php', 'moodle', 'moodle/cohort:view'),
(4, 'core_cohort_update_cohorts', 'core_cohort_external', 'update_cohorts', 'cohort/externallib.php', 'moodle', 'moodle/cohort:manage'),
(5, 'core_cohort_add_cohort_members', 'core_cohort_external', 'add_cohort_members', 'cohort/externallib.php', 'moodle', 'moodle/cohort:assign'),
(6, 'core_cohort_delete_cohort_members', 'core_cohort_external', 'delete_cohort_members', 'cohort/externallib.php', 'moodle', 'moodle/cohort:assign'),
(7, 'core_cohort_get_cohort_members', 'core_cohort_external', 'get_cohort_members', 'cohort/externallib.php', 'moodle', 'moodle/cohort:view'),
(8, 'core_grades_get_grades', 'core_grades_external', 'get_grades', NULL, 'moodle', 'moodle/grade:view, moodle/grade:viewall'),
(9, 'core_grades_update_grades', 'core_grades_external', 'update_grades', NULL, 'moodle', ''),
(10, 'moodle_group_create_groups', 'core_group_external', 'create_groups', 'group/externallib.php', 'moodle', 'moodle/course:managegroups'),
(11, 'core_group_create_groups', 'core_group_external', 'create_groups', 'group/externallib.php', 'moodle', 'moodle/course:managegroups'),
(12, 'moodle_group_get_groups', 'core_group_external', 'get_groups', 'group/externallib.php', 'moodle', 'moodle/course:managegroups'),
(13, 'core_group_get_groups', 'core_group_external', 'get_groups', 'group/externallib.php', 'moodle', 'moodle/course:managegroups'),
(14, 'moodle_group_get_course_groups', 'core_group_external', 'get_course_groups', 'group/externallib.php', 'moodle', 'moodle/course:managegroups'),
(15, 'core_group_get_course_groups', 'core_group_external', 'get_course_groups', 'group/externallib.php', 'moodle', 'moodle/course:managegroups'),
(16, 'moodle_group_delete_groups', 'core_group_external', 'delete_groups', 'group/externallib.php', 'moodle', 'moodle/course:managegroups'),
(17, 'core_group_delete_groups', 'core_group_external', 'delete_groups', 'group/externallib.php', 'moodle', 'moodle/course:managegroups'),
(18, 'moodle_group_get_groupmembers', 'core_group_external', 'get_group_members', 'group/externallib.php', 'moodle', 'moodle/course:managegroups'),
(19, 'core_group_get_group_members', 'core_group_external', 'get_group_members', 'group/externallib.php', 'moodle', 'moodle/course:managegroups'),
(20, 'moodle_group_add_groupmembers', 'core_group_external', 'add_group_members', 'group/externallib.php', 'moodle', 'moodle/course:managegroups'),
(21, 'core_group_add_group_members', 'core_group_external', 'add_group_members', 'group/externallib.php', 'moodle', 'moodle/course:managegroups'),
(22, 'moodle_group_delete_groupmembers', 'core_group_external', 'delete_group_members', 'group/externallib.php', 'moodle', 'moodle/course:managegroups'),
(23, 'core_group_delete_group_members', 'core_group_external', 'delete_group_members', 'group/externallib.php', 'moodle', 'moodle/course:managegroups'),
(24, 'core_group_create_groupings', 'core_group_external', 'create_groupings', 'group/externallib.php', 'moodle', ''),
(25, 'core_group_update_groupings', 'core_group_external', 'update_groupings', 'group/externallib.php', 'moodle', ''),
(26, 'core_group_get_groupings', 'core_group_external', 'get_groupings', 'group/externallib.php', 'moodle', ''),
(27, 'core_group_get_course_groupings', 'core_group_external', 'get_course_groupings', 'group/externallib.php', 'moodle', ''),
(28, 'core_group_delete_groupings', 'core_group_external', 'delete_groupings', 'group/externallib.php', 'moodle', ''),
(29, 'core_group_assign_grouping', 'core_group_external', 'assign_grouping', 'group/externallib.php', 'moodle', ''),
(30, 'core_group_unassign_grouping', 'core_group_external', 'unassign_grouping', 'group/externallib.php', 'moodle', ''),
(31, 'moodle_file_get_files', 'core_files_external', 'get_files', 'files/externallib.php', 'moodle', ''),
(32, 'core_files_get_files', 'core_files_external', 'get_files', 'files/externallib.php', 'moodle', ''),
(33, 'moodle_file_upload', 'core_files_external', 'upload', 'files/externallib.php', 'moodle', ''),
(34, 'core_files_upload', 'core_files_external', 'upload', 'files/externallib.php', 'moodle', ''),
(35, 'moodle_user_create_users', 'core_user_external', 'create_users', 'user/externallib.php', 'moodle', 'moodle/user:create'),
(36, 'core_user_create_users', 'core_user_external', 'create_users', 'user/externallib.php', 'moodle', 'moodle/user:create'),
(37, 'core_user_get_users', 'core_user_external', 'get_users', 'user/externallib.php', 'moodle', 'moodle/user:viewdetails, moodle/user:viewhiddendetails, moodle/course:useremail, moodle/user:update'),
(38, 'moodle_user_get_users_by_id', 'core_user_external', 'get_users_by_id', 'user/externallib.php', 'moodle', 'moodle/user:viewdetails, moodle/user:viewhiddendetails, moodle/course:useremail, moodle/user:update'),
(39, 'core_user_get_users_by_field', 'core_user_external', 'get_users_by_field', 'user/externallib.php', 'moodle', 'moodle/user:viewdetails, moodle/user:viewhiddendetails, moodle/course:useremail, moodle/user:update'),
(40, 'core_user_get_users_by_id', 'core_user_external', 'get_users_by_id', 'user/externallib.php', 'moodle', 'moodle/user:viewdetails, moodle/user:viewhiddendetails, moodle/course:useremail, moodle/user:update'),
(41, 'moodle_user_get_users_by_courseid', 'core_enrol_external', 'get_enrolled_users', 'enrol/externallib.php', 'moodle', 'moodle/user:viewdetails, moodle/user:viewhiddendetails, moodle/course:useremail, moodle/user:update, moodle/site:accessallgroups'),
(42, 'moodle_user_get_course_participants_by_id', 'core_user_external', 'get_course_user_profiles', 'user/externallib.php', 'moodle', 'moodle/user:viewdetails, moodle/user:viewhiddendetails, moodle/course:useremail, moodle/user:update, moodle/site:accessallgroups'),
(43, 'core_user_get_course_user_profiles', 'core_user_external', 'get_course_user_profiles', 'user/externallib.php', 'moodle', 'moodle/user:viewdetails, moodle/user:viewhiddendetails, moodle/course:useremail, moodle/user:update, moodle/site:accessallgroups'),
(44, 'moodle_user_delete_users', 'core_user_external', 'delete_users', 'user/externallib.php', 'moodle', 'moodle/user:delete'),
(45, 'core_user_delete_users', 'core_user_external', 'delete_users', 'user/externallib.php', 'moodle', 'moodle/user:delete'),
(46, 'moodle_user_update_users', 'core_user_external', 'update_users', 'user/externallib.php', 'moodle', 'moodle/user:update'),
(47, 'core_user_update_users', 'core_user_external', 'update_users', 'user/externallib.php', 'moodle', 'moodle/user:update'),
(48, 'core_user_add_user_device', 'core_user_external', 'add_user_device', 'user/externallib.php', 'moodle', ''),
(49, 'core_enrol_get_enrolled_users_with_capability', 'core_enrol_external', 'get_enrolled_users_with_capability', 'enrol/externallib.php', 'moodle', ''),
(50, 'moodle_enrol_get_enrolled_users', 'moodle_enrol_external', 'get_enrolled_users', 'enrol/externallib.php', 'moodle', 'moodle/site:viewparticipants, moodle/course:viewparticipants,\n            moodle/role:review, moodle/site:accessallgroups, moodle/course:enrolreview'),
(51, 'core_enrol_get_enrolled_users', 'core_enrol_external', 'get_enrolled_users', 'enrol/externallib.php', 'moodle', 'moodle/user:viewdetails, moodle/user:viewhiddendetails, moodle/course:useremail, moodle/user:update, moodle/site:accessallgroups'),
(52, 'moodle_enrol_get_users_courses', 'core_enrol_external', 'get_users_courses', 'enrol/externallib.php', 'moodle', 'moodle/course:viewparticipants'),
(53, 'core_enrol_get_users_courses', 'core_enrol_external', 'get_users_courses', 'enrol/externallib.php', 'moodle', 'moodle/course:viewparticipants'),
(54, 'core_enrol_get_course_enrolment_methods', 'core_enrol_external', 'get_course_enrolment_methods', 'enrol/externallib.php', 'moodle', ''),
(55, 'moodle_role_assign', 'core_role_external', 'assign_roles', 'enrol/externallib.php', 'moodle', 'moodle/role:assign'),
(56, 'core_role_assign_roles', 'core_role_external', 'assign_roles', 'enrol/externallib.php', 'moodle', 'moodle/role:assign'),
(57, 'moodle_role_unassign', 'core_role_external', 'unassign_roles', 'enrol/externallib.php', 'moodle', 'moodle/role:assign'),
(58, 'core_role_unassign_roles', 'core_role_external', 'unassign_roles', 'enrol/externallib.php', 'moodle', 'moodle/role:assign'),
(59, 'core_course_get_contents', 'core_course_external', 'get_course_contents', 'course/externallib.php', 'moodle', 'moodle/course:update,moodle/course:viewhiddencourses'),
(60, 'moodle_course_get_courses', 'core_course_external', 'get_courses', 'course/externallib.php', 'moodle', 'moodle/course:view,moodle/course:update,moodle/course:viewhiddencourses'),
(61, 'core_course_get_courses', 'core_course_external', 'get_courses', 'course/externallib.php', 'moodle', 'moodle/course:view,moodle/course:update,moodle/course:viewhiddencourses'),
(62, 'moodle_course_create_courses', 'core_course_external', 'create_courses', 'course/externallib.php', 'moodle', 'moodle/course:create,moodle/course:visibility'),
(63, 'core_course_create_courses', 'core_course_external', 'create_courses', 'course/externallib.php', 'moodle', 'moodle/course:create,moodle/course:visibility'),
(64, 'core_course_delete_courses', 'core_course_external', 'delete_courses', 'course/externallib.php', 'moodle', 'moodle/course:delete'),
(65, 'core_course_delete_modules', 'core_course_external', 'delete_modules', 'course/externallib.php', 'moodle', 'moodle/course:manageactivities'),
(66, 'core_course_duplicate_course', 'core_course_external', 'duplicate_course', 'course/externallib.php', 'moodle', 'moodle/backup:backupcourse,moodle/restore:restorecourse,moodle/course:create'),
(67, 'core_course_update_courses', 'core_course_external', 'update_courses', 'course/externallib.php', 'moodle', 'moodle/course:update,moodle/course:changecategory,moodle/course:changefullname,moodle/course:changeshortname,moodle/course:changeidnumber,moodle/course:changesummary,moodle/course:visibility'),
(68, 'core_course_get_categories', 'core_course_external', 'get_categories', 'course/externallib.php', 'moodle', 'moodle/category:viewhiddencategories'),
(69, 'core_course_create_categories', 'core_course_external', 'create_categories', 'course/externallib.php', 'moodle', 'moodle/category:manage'),
(70, 'core_course_update_categories', 'core_course_external', 'update_categories', 'course/externallib.php', 'moodle', 'moodle/category:manage'),
(71, 'core_course_delete_categories', 'core_course_external', 'delete_categories', 'course/externallib.php', 'moodle', 'moodle/category:manage'),
(72, 'core_course_import_course', 'core_course_external', 'import_course', 'course/externallib.php', 'moodle', 'moodle/backup:backuptargetimport, moodle/restore:restoretargetimport'),
(73, 'moodle_message_send_instantmessages', 'core_message_external', 'send_instant_messages', 'message/externallib.php', 'moodle', 'moodle/site:sendmessage'),
(74, 'core_message_send_instant_messages', 'core_message_external', 'send_instant_messages', 'message/externallib.php', 'moodle', 'moodle/site:sendmessage'),
(75, 'core_message_create_contacts', 'core_message_external', 'create_contacts', 'message/externallib.php', 'moodle', ''),
(76, 'core_message_delete_contacts', 'core_message_external', 'delete_contacts', 'message/externallib.php', 'moodle', ''),
(77, 'core_message_block_contacts', 'core_message_external', 'block_contacts', 'message/externallib.php', 'moodle', ''),
(78, 'core_message_unblock_contacts', 'core_message_external', 'unblock_contacts', 'message/externallib.php', 'moodle', ''),
(79, 'core_message_get_contacts', 'core_message_external', 'get_contacts', 'message/externallib.php', 'moodle', ''),
(80, 'core_message_search_contacts', 'core_message_external', 'search_contacts', 'message/externallib.php', 'moodle', ''),
(81, 'moodle_notes_create_notes', 'core_notes_external', 'create_notes', 'notes/externallib.php', 'moodle', 'moodle/notes:manage'),
(82, 'core_notes_create_notes', 'core_notes_external', 'create_notes', 'notes/externallib.php', 'moodle', 'moodle/notes:manage'),
(83, 'core_notes_delete_notes', 'core_notes_external', 'delete_notes', 'notes/externallib.php', 'moodle', 'moodle/notes:manage'),
(84, 'core_notes_get_notes', 'core_notes_external', 'get_notes', 'notes/externallib.php', 'moodle', 'moodle/notes:view'),
(85, 'core_notes_update_notes', 'core_notes_external', 'update_notes', 'notes/externallib.php', 'moodle', 'moodle/notes:manage'),
(86, 'core_grading_get_definitions', 'core_grading_external', 'get_definitions', NULL, 'moodle', ''),
(87, 'core_grade_get_definitions', 'core_grade_external', 'get_definitions', 'grade/externallib.php', 'moodle', ''),
(88, 'core_grading_get_gradingform_instances', 'core_grading_external', 'get_gradingform_instances', NULL, 'moodle', ''),
(89, 'moodle_webservice_get_siteinfo', 'core_webservice_external', 'get_site_info', 'webservice/externallib.php', 'moodle', ''),
(90, 'core_webservice_get_site_info', 'core_webservice_external', 'get_site_info', 'webservice/externallib.php', 'moodle', ''),
(91, 'core_get_string', 'core_external', 'get_string', 'lib/external/externallib.php', 'moodle', ''),
(92, 'core_get_strings', 'core_external', 'get_strings', 'lib/external/externallib.php', 'moodle', ''),
(93, 'core_get_component_strings', 'core_external', 'get_component_strings', 'lib/external/externallib.php', 'moodle', ''),
(94, 'core_calendar_delete_calendar_events', 'core_calendar_external', 'delete_calendar_events', 'calendar/externallib.php', 'moodle', 'moodle/calendar:manageentries'),
(95, 'core_calendar_get_calendar_events', 'core_calendar_external', 'get_calendar_events', 'calendar/externallib.php', 'moodle', 'moodle/calendar:manageentries'),
(96, 'core_calendar_create_calendar_events', 'core_calendar_external', 'create_calendar_events', 'calendar/externallib.php', 'moodle', 'moodle/calendar:manageentries'),
(97, 'mod_assign_get_grades', 'mod_assign_external', 'get_grades', 'mod/assign/externallib.php', 'mod_assign', ''),
(98, 'mod_assign_get_assignments', 'mod_assign_external', 'get_assignments', 'mod/assign/externallib.php', 'mod_assign', ''),
(99, 'mod_assign_get_submissions', 'mod_assign_external', 'get_submissions', 'mod/assign/externallib.php', 'mod_assign', ''),
(100, 'mod_assign_get_user_flags', 'mod_assign_external', 'get_user_flags', 'mod/assign/externallib.php', 'mod_assign', ''),
(101, 'mod_assign_set_user_flags', 'mod_assign_external', 'set_user_flags', 'mod/assign/externallib.php', 'mod_assign', 'mod/assign:grade'),
(102, 'mod_assign_get_user_mappings', 'mod_assign_external', 'get_user_mappings', 'mod/assign/externallib.php', 'mod_assign', ''),
(103, 'mod_assign_revert_submissions_to_draft', 'mod_assign_external', 'revert_submissions_to_draft', 'mod/assign/externallib.php', 'mod_assign', ''),
(104, 'mod_assign_lock_submissions', 'mod_assign_external', 'lock_submissions', 'mod/assign/externallib.php', 'mod_assign', ''),
(105, 'mod_assign_unlock_submissions', 'mod_assign_external', 'unlock_submissions', 'mod/assign/externallib.php', 'mod_assign', ''),
(106, 'mod_assign_save_submission', 'mod_assign_external', 'save_submission', 'mod/assign/externallib.php', 'mod_assign', ''),
(107, 'mod_assign_submit_for_grading', 'mod_assign_external', 'submit_for_grading', 'mod/assign/externallib.php', 'mod_assign', ''),
(108, 'mod_assign_save_grade', 'mod_assign_external', 'save_grade', 'mod/assign/externallib.php', 'mod_assign', ''),
(109, 'mod_assign_save_grades', 'mod_assign_external', 'save_grades', 'mod/assign/externallib.php', 'mod_assign', ''),
(110, 'mod_assign_save_user_extensions', 'mod_assign_external', 'save_user_extensions', 'mod/assign/externallib.php', 'mod_assign', ''),
(111, 'mod_assign_reveal_identities', 'mod_assign_external', 'reveal_identities', 'mod/assign/externallib.php', 'mod_assign', ''),
(112, 'mod_forum_get_forums_by_courses', 'mod_forum_external', 'get_forums_by_courses', 'mod/forum/externallib.php', 'mod_forum', 'mod/forum:viewdiscussion'),
(113, 'mod_forum_get_forum_discussions', 'mod_forum_external', 'get_forum_discussions', 'mod/forum/externallib.php', 'mod_forum', 'mod/forum:viewdiscussion, mod/forum:viewqandawithoutposting'),
(114, 'mod_forum_get_forum_discussion_posts', 'mod_forum_external', 'get_forum_discussion_posts', 'mod/forum/externallib.php', 'mod_forum', 'mod/forum:viewdiscussion, mod/forum:viewqandawithoutposting'),
(115, 'moodle_enrol_manual_enrol_users', 'enrol_manual_external', 'enrol_users', 'enrol/manual/externallib.php', 'enrol_manual', 'enrol/manual:enrol'),
(116, 'enrol_manual_enrol_users', 'enrol_manual_external', 'enrol_users', 'enrol/manual/externallib.php', 'enrol_manual', 'enrol/manual:enrol'),
(117, 'enrol_self_get_instance_info', 'enrol_self_external', 'get_instance_info', 'enrol/self/externallib.php', 'enrol_self', ''),
(118, 'message_airnotifier_is_system_configured', 'message_airnotifier_external', 'is_system_configured', 'message/output/airnotifier/externallib.php', 'message_airnotifier', ''),
(119, 'message_airnotifier_are_notification_preferences_configured', 'message_airnotifier_external', 'are_notification_preferences_configured', 'message/output/airnotifier/externallib.php', 'message_airnotifier', '');

-- --------------------------------------------------------

--
-- Table structure for table `mdl_external_services`
--

CREATE TABLE IF NOT EXISTS `mdl_external_services` (
`id` bigint(10) NOT NULL,
  `name` varchar(200) NOT NULL DEFAULT '',
  `enabled` tinyint(1) NOT NULL,
  `requiredcapability` varchar(150) DEFAULT NULL,
  `restrictedusers` tinyint(1) NOT NULL,
  `component` varchar(100) DEFAULT NULL,
  `timecreated` bigint(10) NOT NULL,
  `timemodified` bigint(10) DEFAULT NULL,
  `shortname` varchar(255) DEFAULT NULL,
  `downloadfiles` tinyint(1) NOT NULL DEFAULT '0',
  `uploadfiles` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='built in and custom external services';

--
-- Dumping data for table `mdl_external_services`
--

INSERT INTO `mdl_external_services` (`id`, `name`, `enabled`, `requiredcapability`, `restrictedusers`, `component`, `timecreated`, `timemodified`, `shortname`, `downloadfiles`, `uploadfiles`) VALUES
(1, 'Moodle mobile web service', 0, NULL, 0, 'moodle', 1415060952, NULL, 'moodle_mobile_app', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_external_services_functions`
--

CREATE TABLE IF NOT EXISTS `mdl_external_services_functions` (
`id` bigint(10) NOT NULL,
  `externalserviceid` bigint(10) NOT NULL,
  `functionname` varchar(200) NOT NULL DEFAULT ''
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8 COMMENT='lists functions available in each service group';

--
-- Dumping data for table `mdl_external_services_functions`
--

INSERT INTO `mdl_external_services_functions` (`id`, `externalserviceid`, `functionname`) VALUES
(1, 1, 'moodle_enrol_get_users_courses'),
(2, 1, 'moodle_enrol_get_enrolled_users'),
(3, 1, 'moodle_user_get_users_by_id'),
(4, 1, 'moodle_webservice_get_siteinfo'),
(5, 1, 'moodle_notes_create_notes'),
(6, 1, 'moodle_user_get_course_participants_by_id'),
(7, 1, 'moodle_user_get_users_by_courseid'),
(8, 1, 'moodle_message_send_instantmessages'),
(9, 1, 'core_course_get_contents'),
(10, 1, 'core_get_component_strings'),
(11, 1, 'core_user_add_user_device'),
(12, 1, 'core_calendar_get_calendar_events'),
(13, 1, 'core_enrol_get_users_courses'),
(14, 1, 'core_enrol_get_enrolled_users'),
(15, 1, 'core_user_get_users_by_id'),
(16, 1, 'core_webservice_get_site_info'),
(17, 1, 'core_notes_create_notes'),
(18, 1, 'core_user_get_course_user_profiles'),
(19, 1, 'core_enrol_get_enrolled_users'),
(20, 1, 'core_message_send_instant_messages'),
(21, 1, 'mod_assign_get_grades'),
(22, 1, 'mod_assign_get_assignments'),
(23, 1, 'mod_assign_get_submissions'),
(24, 1, 'mod_assign_get_user_flags'),
(25, 1, 'mod_assign_set_user_flags'),
(26, 1, 'mod_assign_get_user_mappings'),
(27, 1, 'mod_assign_revert_submissions_to_draft'),
(28, 1, 'mod_assign_lock_submissions'),
(29, 1, 'mod_assign_unlock_submissions'),
(30, 1, 'mod_assign_save_submission'),
(31, 1, 'mod_assign_submit_for_grading'),
(32, 1, 'mod_assign_save_grade'),
(33, 1, 'mod_assign_save_user_extensions'),
(34, 1, 'mod_assign_reveal_identities'),
(35, 1, 'message_airnotifier_is_system_configured'),
(36, 1, 'message_airnotifier_are_notification_preferences_configured'),
(37, 1, 'core_grades_get_grades'),
(38, 1, 'core_grades_update_grades'),
(39, 1, 'mod_forum_get_forums_by_courses'),
(40, 1, 'mod_forum_get_forum_discussions'),
(41, 1, 'mod_forum_get_forum_discussion_posts');

-- --------------------------------------------------------

--
-- Table structure for table `mdl_external_services_users`
--

CREATE TABLE IF NOT EXISTS `mdl_external_services_users` (
`id` bigint(10) NOT NULL,
  `externalserviceid` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `iprestriction` varchar(255) DEFAULT NULL,
  `validuntil` bigint(10) DEFAULT NULL,
  `timecreated` bigint(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='users allowed to use services with restricted users flag';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_external_tokens`
--

CREATE TABLE IF NOT EXISTS `mdl_external_tokens` (
`id` bigint(10) NOT NULL,
  `token` varchar(128) NOT NULL DEFAULT '',
  `tokentype` smallint(4) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `externalserviceid` bigint(10) NOT NULL,
  `sid` varchar(128) DEFAULT NULL,
  `contextid` bigint(10) NOT NULL,
  `creatorid` bigint(10) NOT NULL DEFAULT '1',
  `iprestriction` varchar(255) DEFAULT NULL,
  `validuntil` bigint(10) DEFAULT NULL,
  `timecreated` bigint(10) NOT NULL,
  `lastaccess` bigint(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Security tokens for accessing of external services';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_feedback`
--

CREATE TABLE IF NOT EXISTS `mdl_feedback` (
`id` bigint(10) NOT NULL,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `intro` longtext NOT NULL,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `anonymous` tinyint(1) NOT NULL DEFAULT '1',
  `email_notification` tinyint(1) NOT NULL DEFAULT '1',
  `multiple_submit` tinyint(1) NOT NULL DEFAULT '1',
  `autonumbering` tinyint(1) NOT NULL DEFAULT '1',
  `site_after_submit` varchar(255) NOT NULL DEFAULT '',
  `page_after_submit` longtext NOT NULL,
  `page_after_submitformat` tinyint(2) NOT NULL DEFAULT '0',
  `publish_stats` tinyint(1) NOT NULL DEFAULT '0',
  `timeopen` bigint(10) NOT NULL DEFAULT '0',
  `timeclose` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `completionsubmit` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='all feedbacks';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_feedback_completed`
--

CREATE TABLE IF NOT EXISTS `mdl_feedback_completed` (
`id` bigint(10) NOT NULL,
  `feedback` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `random_response` bigint(10) NOT NULL DEFAULT '0',
  `anonymous_response` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='filled out feedback';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_feedback_completedtmp`
--

CREATE TABLE IF NOT EXISTS `mdl_feedback_completedtmp` (
`id` bigint(10) NOT NULL,
  `feedback` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `guestid` varchar(255) NOT NULL DEFAULT '',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `random_response` bigint(10) NOT NULL DEFAULT '0',
  `anonymous_response` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='filled out feedback';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_feedback_item`
--

CREATE TABLE IF NOT EXISTS `mdl_feedback_item` (
`id` bigint(10) NOT NULL,
  `feedback` bigint(10) NOT NULL DEFAULT '0',
  `template` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `label` varchar(255) NOT NULL DEFAULT '',
  `presentation` longtext NOT NULL,
  `typ` varchar(255) NOT NULL DEFAULT '',
  `hasvalue` tinyint(1) NOT NULL DEFAULT '0',
  `position` smallint(3) NOT NULL DEFAULT '0',
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `dependitem` bigint(10) NOT NULL DEFAULT '0',
  `dependvalue` varchar(255) NOT NULL DEFAULT '',
  `options` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='feedback_items';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_feedback_sitecourse_map`
--

CREATE TABLE IF NOT EXISTS `mdl_feedback_sitecourse_map` (
`id` bigint(10) NOT NULL,
  `feedbackid` bigint(10) NOT NULL DEFAULT '0',
  `courseid` bigint(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='feedback sitecourse map';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_feedback_template`
--

CREATE TABLE IF NOT EXISTS `mdl_feedback_template` (
`id` bigint(10) NOT NULL,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `ispublic` tinyint(1) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='templates of feedbackstructures';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_feedback_tracking`
--

CREATE TABLE IF NOT EXISTS `mdl_feedback_tracking` (
`id` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `feedback` bigint(10) NOT NULL DEFAULT '0',
  `completed` bigint(10) NOT NULL DEFAULT '0',
  `tmp_completed` bigint(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='feedback trackingdata';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_feedback_value`
--

CREATE TABLE IF NOT EXISTS `mdl_feedback_value` (
`id` bigint(10) NOT NULL,
  `course_id` bigint(10) NOT NULL DEFAULT '0',
  `item` bigint(10) NOT NULL DEFAULT '0',
  `completed` bigint(10) NOT NULL DEFAULT '0',
  `tmp_completed` bigint(10) NOT NULL DEFAULT '0',
  `value` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='values of the completeds';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_feedback_valuetmp`
--

CREATE TABLE IF NOT EXISTS `mdl_feedback_valuetmp` (
`id` bigint(10) NOT NULL,
  `course_id` bigint(10) NOT NULL DEFAULT '0',
  `item` bigint(10) NOT NULL DEFAULT '0',
  `completed` bigint(10) NOT NULL DEFAULT '0',
  `tmp_completed` bigint(10) NOT NULL DEFAULT '0',
  `value` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='values of the completedstmp';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_files`
--

CREATE TABLE IF NOT EXISTS `mdl_files` (
`id` bigint(10) NOT NULL,
  `contenthash` varchar(40) NOT NULL DEFAULT '',
  `pathnamehash` varchar(40) NOT NULL DEFAULT '',
  `contextid` bigint(10) NOT NULL,
  `component` varchar(100) NOT NULL DEFAULT '',
  `filearea` varchar(50) NOT NULL DEFAULT '',
  `itemid` bigint(10) NOT NULL,
  `filepath` varchar(255) NOT NULL DEFAULT '',
  `filename` varchar(255) NOT NULL DEFAULT '',
  `userid` bigint(10) DEFAULT NULL,
  `filesize` bigint(10) NOT NULL,
  `mimetype` varchar(100) DEFAULT NULL,
  `status` bigint(10) NOT NULL DEFAULT '0',
  `source` longtext,
  `author` varchar(255) DEFAULT NULL,
  `license` varchar(255) DEFAULT NULL,
  `timecreated` bigint(10) NOT NULL,
  `timemodified` bigint(10) NOT NULL,
  `sortorder` bigint(10) NOT NULL DEFAULT '0',
  `referencefileid` bigint(10) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8 COMMENT='description of files, content is stored in sha1 file pool';

--
-- Dumping data for table `mdl_files`
--

INSERT INTO `mdl_files` (`id`, `contenthash`, `pathnamehash`, `contextid`, `component`, `filearea`, `itemid`, `filepath`, `filename`, `userid`, `filesize`, `mimetype`, `status`, `source`, `author`, `license`, `timecreated`, `timemodified`, `sortorder`, `referencefileid`) VALUES
(1, '41cfeee5884a43a4650a851f4f85e7b28316fcc9', 'a48e186a2cc853a9e94e9305f4e9bc086391212d', 1, 'theme_more', 'backgroundimage', 0, '/', 'background.jpg', 2, 4451, 'image/jpeg', 0, NULL, NULL, NULL, 1415061022, 1415061022, 0, NULL),
(2, 'da39a3ee5e6b4b0d3255bfef95601890afd80709', 'd1da7ab1bb9c08a926037367bf8ce9a838034ead', 1, 'theme_more', 'backgroundimage', 0, '/', '.', 2, 0, NULL, 0, NULL, NULL, NULL, 1415061022, 1415061022, 0, NULL),
(3, 'fb262df98d67c4e2a5c9802403821e00cf2992af', '508e674d49c30d4fde325fe6c7f6fd3d56b247e1', 1, 'assignfeedback_editpdf', 'stamps', 0, '/', 'smile.png', 2, 1600, 'image/png', 0, NULL, NULL, NULL, 1415061024, 1415061024, 0, NULL),
(4, 'da39a3ee5e6b4b0d3255bfef95601890afd80709', '70b7cdade7b4e27d4e83f0cdaad10d6a3c0cccb5', 1, 'assignfeedback_editpdf', 'stamps', 0, '/', '.', 2, 0, NULL, 0, NULL, NULL, NULL, 1415061024, 1415061024, 0, NULL),
(5, 'a4f146f120e7e00d21291b924e26aaabe9f4297a', '68317eab56c67d32aeaee5acf509a0c4aa828b6b', 1, 'assignfeedback_editpdf', 'stamps', 0, '/', 'sad.png', 2, 1702, 'image/png', 0, NULL, NULL, NULL, 1415061024, 1415061024, 0, NULL),
(6, '33957e31ba9c763a74638b825f0a9154acf475e1', '695a55ff780e61c9e59428aa425430b0d6bde53b', 1, 'assignfeedback_editpdf', 'stamps', 0, '/', 'tick.png', 2, 1187, 'image/png', 0, NULL, NULL, NULL, 1415061024, 1415061024, 0, NULL),
(7, 'd613d55f37bb76d38d4ffb4b7b83e6c694778c30', '373e63af262a9b8466ba8632551520be793c37ff', 1, 'assignfeedback_editpdf', 'stamps', 0, '/', 'cross.png', 2, 1230, 'image/png', 0, NULL, NULL, NULL, 1415061024, 1415061024, 0, NULL),
(8, '41cb3a548c7ff91b9557b0438524a1edb80634a7', '0b866bc5f4fe682205e9fef6bb77c693f3ec6c68', 5, 'user', 'draft', 665106674, '/', 'capacita_logo.gif', 2, 3165, 'image/gif', 0, 'O:8:"stdClass":1:{s:6:"source";s:17:"capacita_logo.gif";}', 'Admin User', 'allrightsreserved', 1415156393, 1415156393, 0, NULL),
(9, 'da39a3ee5e6b4b0d3255bfef95601890afd80709', '4f51a3418cb88f0e3ea7277df540a1ebd818826b', 5, 'user', 'draft', 665106674, '/', '.', 2, 0, NULL, 0, NULL, NULL, NULL, 1415156395, 1415156395, 0, NULL),
(10, '60868ce373c37764bea111f8e89e52e20a7e638c', '819638b85dc0821f166970b69a38df5fd694e801', 1, 'core', 'preview', 0, '/thumb/', '41cb3a548c7ff91b9557b0438524a1edb80634a7', NULL, 3095, 'image/png', 0, NULL, NULL, NULL, 1415156416, 1415156416, 0, NULL),
(11, 'da39a3ee5e6b4b0d3255bfef95601890afd80709', '74c104d54c05b5f8c633a36da516d37e6c5279e4', 1, 'core', 'preview', 0, '/thumb/', '.', NULL, 0, NULL, 0, NULL, NULL, NULL, 1415156416, 1415156416, 0, NULL),
(12, 'da39a3ee5e6b4b0d3255bfef95601890afd80709', '884555719c50529b9df662a38619d04b5b11e25c', 1, 'core', 'preview', 0, '/', '.', NULL, 0, NULL, 0, NULL, NULL, NULL, 1415156416, 1415156416, 0, NULL),
(14, 'da39a3ee5e6b4b0d3255bfef95601890afd80709', '1c6d4391fe8ab2a22c63f76ce93ee57f72b5eb04', 1, 'theme_clean', 'logo', 0, '/', '.', 2, 0, 'document/unknown', 0, NULL, NULL, NULL, 1415156395, 1419009757, 0, NULL),
(15, '41cb3a548c7ff91b9557b0438524a1edb80634a7', '7a2fc67720510959fc2b515255d092214c78f5be', 5, 'user', 'draft', 761522548, '/', 'capacita_logo.gif', 2, 3165, 'image/gif', 0, 'O:8:"stdClass":2:{s:6:"source";s:17:"capacita_logo.gif";s:8:"original";s:224:"YTo2OntzOjk6ImNvbnRleHRpZCI7aToxO3M6OToiY29tcG9uZW50IjtzOjExOiJ0aGVtZV9jbGVhbiI7czo2OiJpdGVtaWQiO2k6MDtzOjg6ImZpbGVhcmVhIjtzOjQ6ImxvZ28iO3M6ODoiZmlsZXBhdGgiO3M6MToiLyI7czo4OiJmaWxlbmFtZSI7czoxNzoiY2FwYWNpdGFfbG9nby5naWYiO30=";}', 'Admin User', 'allrightsreserved', 1415156393, 1415156949, 0, NULL),
(16, 'da39a3ee5e6b4b0d3255bfef95601890afd80709', '9bfab9078259c6065630462e82c4f7f725bad78f', 5, 'user', 'draft', 761522548, '/', '.', 2, 0, NULL, 0, NULL, NULL, NULL, 1415420080, 1415420080, 0, NULL),
(17, '41cb3a548c7ff91b9557b0438524a1edb80634a7', '21050eeaf576eeed8e46490be562074f33f23a34', 5, 'user', 'draft', 722677609, '/', 'capacita_logo.gif', 2, 3165, 'image/gif', 0, 'O:8:"stdClass":2:{s:6:"source";s:17:"capacita_logo.gif";s:8:"original";s:224:"YTo2OntzOjk6ImNvbnRleHRpZCI7aToxO3M6OToiY29tcG9uZW50IjtzOjExOiJ0aGVtZV9jbGVhbiI7czo2OiJpdGVtaWQiO2k6MDtzOjg6ImZpbGVhcmVhIjtzOjQ6ImxvZ28iO3M6ODoiZmlsZXBhdGgiO3M6MToiLyI7czo4OiJmaWxlbmFtZSI7czoxNzoiY2FwYWNpdGFfbG9nby5naWYiO30=";}', 'Admin User', 'allrightsreserved', 1415156393, 1415156949, 0, NULL),
(18, 'da39a3ee5e6b4b0d3255bfef95601890afd80709', '34081efea5246bab09a85df3d896ce36f041dd57', 5, 'user', 'draft', 722677609, '/', '.', 2, 0, NULL, 0, NULL, NULL, NULL, 1415682218, 1415682218, 0, NULL),
(19, '41cb3a548c7ff91b9557b0438524a1edb80634a7', 'b00fbd47a222643b1c98e1b8f9e922479b594891', 5, 'user', 'draft', 807761307, '/', 'capacita_logo.gif', 2, 3165, 'image/gif', 0, 'O:8:"stdClass":2:{s:6:"source";s:17:"capacita_logo.gif";s:8:"original";s:224:"YTo2OntzOjk6ImNvbnRleHRpZCI7aToxO3M6OToiY29tcG9uZW50IjtzOjExOiJ0aGVtZV9jbGVhbiI7czo2OiJpdGVtaWQiO2k6MDtzOjg6ImZpbGVhcmVhIjtzOjQ6ImxvZ28iO3M6ODoiZmlsZXBhdGgiO3M6MToiLyI7czo4OiJmaWxlbmFtZSI7czoxNzoiY2FwYWNpdGFfbG9nby5naWYiO30=";}', 'Admin User', 'allrightsreserved', 1415156393, 1415156949, 0, NULL),
(20, 'da39a3ee5e6b4b0d3255bfef95601890afd80709', '5110e7aef9e4a25668d63632f336fb5ea735f1a4', 5, 'user', 'draft', 807761307, '/', '.', 2, 0, NULL, 0, NULL, NULL, NULL, 1415682941, 1415682941, 0, NULL),
(21, '41cb3a548c7ff91b9557b0438524a1edb80634a7', '6e45db05ff250e3b7144d298a8c8afe0428a7ef1', 5, 'user', 'draft', 349197720, '/', 'capacita_logo.gif', 2, 3165, 'image/gif', 0, 'O:8:"stdClass":2:{s:6:"source";s:17:"capacita_logo.gif";s:8:"original";s:224:"YTo2OntzOjk6ImNvbnRleHRpZCI7aToxO3M6OToiY29tcG9uZW50IjtzOjExOiJ0aGVtZV9jbGVhbiI7czo2OiJpdGVtaWQiO2k6MDtzOjg6ImZpbGVhcmVhIjtzOjQ6ImxvZ28iO3M6ODoiZmlsZXBhdGgiO3M6MToiLyI7czo4OiJmaWxlbmFtZSI7czoxNzoiY2FwYWNpdGFfbG9nby5naWYiO30=";}', 'Admin User', 'allrightsreserved', 1415156393, 1415156949, 0, NULL),
(22, 'da39a3ee5e6b4b0d3255bfef95601890afd80709', 'a2ecdfd2c6dad5c6668108dfa037b1643a3bcba6', 5, 'user', 'draft', 349197720, '/', '.', 2, 0, NULL, 0, NULL, NULL, NULL, 1415682945, 1415682945, 0, NULL),
(23, '41cb3a548c7ff91b9557b0438524a1edb80634a7', 'e63044dd3716fcf7f3347655a3d4a28e87fce343', 5, 'user', 'draft', 360059795, '/', 'capacita_logo.gif', 2, 3165, 'image/gif', 0, 'O:8:"stdClass":2:{s:6:"source";s:17:"capacita_logo.gif";s:8:"original";s:224:"YTo2OntzOjk6ImNvbnRleHRpZCI7aToxO3M6OToiY29tcG9uZW50IjtzOjExOiJ0aGVtZV9jbGVhbiI7czo2OiJpdGVtaWQiO2k6MDtzOjg6ImZpbGVhcmVhIjtzOjQ6ImxvZ28iO3M6ODoiZmlsZXBhdGgiO3M6MToiLyI7czo4OiJmaWxlbmFtZSI7czoxNzoiY2FwYWNpdGFfbG9nby5naWYiO30=";}', 'Admin User', 'allrightsreserved', 1415156393, 1415156949, 0, NULL),
(24, 'da39a3ee5e6b4b0d3255bfef95601890afd80709', 'dca9516f03a4ebdec2fb67b15217347ef68ae830', 5, 'user', 'draft', 360059795, '/', '.', 2, 0, NULL, 0, NULL, NULL, NULL, 1415683066, 1415683066, 0, NULL),
(25, '41cb3a548c7ff91b9557b0438524a1edb80634a7', '53365d1903b177da6262783b70d626394aa98fd2', 5, 'user', 'draft', 529930190, '/', 'capacita_logo.gif', 2, 3165, 'image/gif', 0, 'O:8:"stdClass":2:{s:6:"source";s:17:"capacita_logo.gif";s:8:"original";s:224:"YTo2OntzOjk6ImNvbnRleHRpZCI7aToxO3M6OToiY29tcG9uZW50IjtzOjExOiJ0aGVtZV9jbGVhbiI7czo2OiJpdGVtaWQiO2k6MDtzOjg6ImZpbGVhcmVhIjtzOjQ6ImxvZ28iO3M6ODoiZmlsZXBhdGgiO3M6MToiLyI7czo4OiJmaWxlbmFtZSI7czoxNzoiY2FwYWNpdGFfbG9nby5naWYiO30=";}', 'Admin User', 'allrightsreserved', 1415156393, 1415156949, 0, NULL),
(26, 'da39a3ee5e6b4b0d3255bfef95601890afd80709', '82229728b21e9c70b1d4d77d6f09ce886c6f5757', 5, 'user', 'draft', 529930190, '/', '.', 2, 0, NULL, 0, NULL, NULL, NULL, 1415683331, 1415683331, 0, NULL),
(28, 'da39a3ee5e6b4b0d3255bfef95601890afd80709', 'c19c36815fbecf42808c229ee1650f7e538618f8', 5, 'user', 'draft', 219782270, '/', '.', 2, 0, NULL, 0, NULL, NULL, NULL, 1416178451, 1416178451, 0, NULL),
(29, 'd100b22853447ffc49b3ae575a2fac5e2eabe6e9', 'b70ad0b4e20e9ed7a6ba274612e0411a03143fd4', 5, 'user', 'draft', 90237304, '/', 'Files.zip', 2, 3302, 'application/zip', 0, NULL, NULL, NULL, 1416178484, 1416178484, 0, NULL),
(30, 'da39a3ee5e6b4b0d3255bfef95601890afd80709', 'b1719d5176ce7e1a349b075a97ad8eea78a77196', 5, 'user', 'draft', 90237304, '/', '.', 2, 0, NULL, 0, NULL, NULL, NULL, 1416178484, 1416178484, 0, NULL),
(31, '41cb3a548c7ff91b9557b0438524a1edb80634a7', '847e2a4ad23fdcf080d54a0b6f2ae1f0cc566d0c', 5, 'user', 'draft', 219782270, '/', 'capacita_logo.gif', 2, 3165, 'image/gif', 0, 'O:8:"stdClass":1:{s:6:"source";s:17:"capacita_logo.gif";}', 'Admin User', 'allrightsreserved', 1416178665, 1416178665, 0, NULL),
(33, '41cb3a548c7ff91b9557b0438524a1edb80634a7', '1e5bc8dce39e926e1fda49afd5e1b5a22a6e1af3', 1, 'theme_clean', 'logo', 0, '/', 'capacita_logo.gif', 2, 3165, 'image/gif', 0, 'capacita_logo.gif', 'Admin User', 'allrightsreserved', 1416178665, 1416178700, 0, NULL),
(34, 'cd59e6948221a3ff26f061f6d09ed544870554cd', 'a5b59f1306fe106156a9a45575e53cba9b09d010', 5, 'user', 'draft', 171738324, '/', 'quickmail.zip', 2, 118917, 'application/zip', 0, 'O:8:"stdClass":1:{s:6:"source";s:39:"block_quickmail_moodle27_2014042914.zip";}', 'Admin User', 'allrightsreserved', 1417664168, 1417664168, 0, NULL),
(35, 'da39a3ee5e6b4b0d3255bfef95601890afd80709', '23a241eb05e7a519ecd2c0ffdbb9300703d59735', 5, 'user', 'draft', 171738324, '/', '.', 2, 0, NULL, 0, NULL, NULL, NULL, 1417664168, 1417664168, 0, NULL),
(36, '41cb3a548c7ff91b9557b0438524a1edb80634a7', 'c25c65618214adf94c27003bce945f4abbac96b0', 5, 'user', 'draft', 485552112, '/', 'capacita_logo.gif', 2, 3165, 'image/gif', 0, 'O:8:"stdClass":2:{s:6:"source";s:17:"capacita_logo.gif";s:8:"original";s:224:"YTo2OntzOjk6ImNvbnRleHRpZCI7aToxO3M6OToiY29tcG9uZW50IjtzOjExOiJ0aGVtZV9jbGVhbiI7czo2OiJpdGVtaWQiO2k6MDtzOjg6ImZpbGVhcmVhIjtzOjQ6ImxvZ28iO3M6ODoiZmlsZXBhdGgiO3M6MToiLyI7czo4OiJmaWxlbmFtZSI7czoxNzoiY2FwYWNpdGFfbG9nby5naWYiO30=";}', 'Admin User', 'allrightsreserved', 1416178665, 1416178700, 0, NULL),
(37, 'da39a3ee5e6b4b0d3255bfef95601890afd80709', '04d68b75d5a909f73dc778ebe046cd753822503e', 5, 'user', 'draft', 485552112, '/', '.', 2, 0, NULL, 0, NULL, NULL, NULL, 1418101611, 1418101611, 0, NULL),
(38, '41cb3a548c7ff91b9557b0438524a1edb80634a7', '2ad4b569423d60fceee170038bd8d19c74958556', 5, 'user', 'draft', 785182987, '/', 'capacita_logo.gif', 2, 3165, 'image/gif', 0, 'O:8:"stdClass":2:{s:6:"source";s:17:"capacita_logo.gif";s:8:"original";s:224:"YTo2OntzOjk6ImNvbnRleHRpZCI7aToxO3M6OToiY29tcG9uZW50IjtzOjExOiJ0aGVtZV9jbGVhbiI7czo2OiJpdGVtaWQiO2k6MDtzOjg6ImZpbGVhcmVhIjtzOjQ6ImxvZ28iO3M6ODoiZmlsZXBhdGgiO3M6MToiLyI7czo4OiJmaWxlbmFtZSI7czoxNzoiY2FwYWNpdGFfbG9nby5naWYiO30=";}', 'Admin User', 'allrightsreserved', 1416178665, 1416178700, 0, NULL),
(39, 'da39a3ee5e6b4b0d3255bfef95601890afd80709', '6a642bb77042c7ccee15f0e6abb1e513b28aac5b', 5, 'user', 'draft', 785182987, '/', '.', 2, 0, NULL, 0, NULL, NULL, NULL, 1418102020, 1418102020, 0, NULL),
(40, 'da39a3ee5e6b4b0d3255bfef95601890afd80709', 'd5a5d32f7bf6686471a1af6416514da2c355d56b', 22, 'user', 'draft', 422302740, '/Nueva carpeta/', '.', NULL, 0, NULL, 0, NULL, NULL, NULL, 1418138435, 1418138435, 0, NULL),
(41, 'da39a3ee5e6b4b0d3255bfef95601890afd80709', 'd821e03ec112d0bc5ff758838bc0f9c764937273', 22, 'user', 'draft', 422302740, '/', '.', NULL, 0, NULL, 0, NULL, NULL, NULL, 1418138435, 1418138435, 0, NULL),
(42, '41cb3a548c7ff91b9557b0438524a1edb80634a7', 'ae63b88b5b27c7f70c14c29b7c05b3de9fa6a266', 5, 'user', 'draft', 1746882, '/', 'capacita_logo.gif', 2, 3165, 'image/gif', 0, 'O:8:"stdClass":2:{s:6:"source";s:17:"capacita_logo.gif";s:8:"original";s:224:"YTo2OntzOjk6ImNvbnRleHRpZCI7aToxO3M6OToiY29tcG9uZW50IjtzOjExOiJ0aGVtZV9jbGVhbiI7czo2OiJpdGVtaWQiO2k6MDtzOjg6ImZpbGVhcmVhIjtzOjQ6ImxvZ28iO3M6ODoiZmlsZXBhdGgiO3M6MToiLyI7czo4OiJmaWxlbmFtZSI7czoxNzoiY2FwYWNpdGFfbG9nby5naWYiO30=";}', 'Admin User', 'allrightsreserved', 1416178665, 1416178700, 0, NULL),
(43, 'da39a3ee5e6b4b0d3255bfef95601890afd80709', 'bddb4dd785a2373cadee99dba6c229ef699efd60', 5, 'user', 'draft', 1746882, '/', '.', 2, 0, NULL, 0, NULL, NULL, NULL, 1419009757, 1419009757, 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_files_reference`
--

CREATE TABLE IF NOT EXISTS `mdl_files_reference` (
`id` bigint(10) NOT NULL,
  `repositoryid` bigint(10) NOT NULL,
  `lastsync` bigint(10) DEFAULT NULL,
  `reference` longtext,
  `referencehash` varchar(40) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Store files references';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_filter_active`
--

CREATE TABLE IF NOT EXISTS `mdl_filter_active` (
`id` bigint(10) NOT NULL,
  `filter` varchar(32) NOT NULL DEFAULT '',
  `contextid` bigint(10) NOT NULL,
  `active` smallint(4) NOT NULL,
  `sortorder` bigint(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='Stores information about which filters are active in which c';

--
-- Dumping data for table `mdl_filter_active`
--

INSERT INTO `mdl_filter_active` (`id`, `filter`, `contextid`, `active`, `sortorder`) VALUES
(1, 'activitynames', 1, 1, 2),
(2, 'mathjaxloader', 1, 1, 1),
(3, 'mediaplugin', 1, 1, 3);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_filter_config`
--

CREATE TABLE IF NOT EXISTS `mdl_filter_config` (
`id` bigint(10) NOT NULL,
  `filter` varchar(32) NOT NULL DEFAULT '',
  `contextid` bigint(10) NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `value` longtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores per-context configuration settings for filters which ';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_folder`
--

CREATE TABLE IF NOT EXISTS `mdl_folder` (
`id` bigint(10) NOT NULL,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `intro` longtext,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `revision` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `display` smallint(4) NOT NULL DEFAULT '0',
  `showexpanded` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='each record is one folder resource';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_forum`
--

CREATE TABLE IF NOT EXISTS `mdl_forum` (
`id` bigint(10) NOT NULL,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `type` varchar(20) NOT NULL DEFAULT 'general',
  `name` varchar(255) NOT NULL DEFAULT '',
  `intro` longtext NOT NULL,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `assessed` bigint(10) NOT NULL DEFAULT '0',
  `assesstimestart` bigint(10) NOT NULL DEFAULT '0',
  `assesstimefinish` bigint(10) NOT NULL DEFAULT '0',
  `scale` bigint(10) NOT NULL DEFAULT '0',
  `maxbytes` bigint(10) NOT NULL DEFAULT '0',
  `maxattachments` bigint(10) NOT NULL DEFAULT '1',
  `forcesubscribe` tinyint(1) NOT NULL DEFAULT '0',
  `trackingtype` tinyint(2) NOT NULL DEFAULT '1',
  `rsstype` tinyint(2) NOT NULL DEFAULT '0',
  `rssarticles` tinyint(2) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `warnafter` bigint(10) NOT NULL DEFAULT '0',
  `blockafter` bigint(10) NOT NULL DEFAULT '0',
  `blockperiod` bigint(10) NOT NULL DEFAULT '0',
  `completiondiscussions` int(9) NOT NULL DEFAULT '0',
  `completionreplies` int(9) NOT NULL DEFAULT '0',
  `completionposts` int(9) NOT NULL DEFAULT '0',
  `displaywordcount` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='Forums contain and structure discussion';

--
-- Dumping data for table `mdl_forum`
--

INSERT INTO `mdl_forum` (`id`, `course`, `type`, `name`, `intro`, `introformat`, `assessed`, `assesstimestart`, `assesstimefinish`, `scale`, `maxbytes`, `maxattachments`, `forcesubscribe`, `trackingtype`, `rsstype`, `rssarticles`, `timemodified`, `warnafter`, `blockafter`, `blockperiod`, `completiondiscussions`, `completionreplies`, `completionposts`, `displaywordcount`) VALUES
(1, 2, 'news', 'News forum', 'General news and announcements', 0, 0, 0, 0, 1, 0, 1, 1, 1, 0, 0, 1415912226, 0, 0, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_forum_digests`
--

CREATE TABLE IF NOT EXISTS `mdl_forum_digests` (
`id` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `forum` bigint(10) NOT NULL,
  `maildigest` tinyint(1) NOT NULL DEFAULT '-1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Keeps track of user mail delivery preferences for each forum';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_forum_discussions`
--

CREATE TABLE IF NOT EXISTS `mdl_forum_discussions` (
`id` bigint(10) NOT NULL,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `forum` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `firstpost` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `groupid` bigint(10) NOT NULL DEFAULT '-1',
  `assessed` tinyint(1) NOT NULL DEFAULT '1',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `usermodified` bigint(10) NOT NULL DEFAULT '0',
  `timestart` bigint(10) NOT NULL DEFAULT '0',
  `timeend` bigint(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Forums are composed of discussions';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_forum_posts`
--

CREATE TABLE IF NOT EXISTS `mdl_forum_posts` (
`id` bigint(10) NOT NULL,
  `discussion` bigint(10) NOT NULL DEFAULT '0',
  `parent` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `created` bigint(10) NOT NULL DEFAULT '0',
  `modified` bigint(10) NOT NULL DEFAULT '0',
  `mailed` tinyint(2) NOT NULL DEFAULT '0',
  `subject` varchar(255) NOT NULL DEFAULT '',
  `message` longtext NOT NULL,
  `messageformat` tinyint(2) NOT NULL DEFAULT '0',
  `messagetrust` tinyint(2) NOT NULL DEFAULT '0',
  `attachment` varchar(100) NOT NULL DEFAULT '',
  `totalscore` smallint(4) NOT NULL DEFAULT '0',
  `mailnow` bigint(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='All posts are stored in this table';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_forum_queue`
--

CREATE TABLE IF NOT EXISTS `mdl_forum_queue` (
`id` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `discussionid` bigint(10) NOT NULL DEFAULT '0',
  `postid` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='For keeping track of posts that will be mailed in digest for';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_forum_read`
--

CREATE TABLE IF NOT EXISTS `mdl_forum_read` (
`id` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `forumid` bigint(10) NOT NULL DEFAULT '0',
  `discussionid` bigint(10) NOT NULL DEFAULT '0',
  `postid` bigint(10) NOT NULL DEFAULT '0',
  `firstread` bigint(10) NOT NULL DEFAULT '0',
  `lastread` bigint(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tracks each users read posts';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_forum_subscriptions`
--

CREATE TABLE IF NOT EXISTS `mdl_forum_subscriptions` (
`id` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `forum` bigint(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Keeps track of who is subscribed to what forum';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_forum_track_prefs`
--

CREATE TABLE IF NOT EXISTS `mdl_forum_track_prefs` (
`id` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `forumid` bigint(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tracks each users untracked forums';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_glossary`
--

CREATE TABLE IF NOT EXISTS `mdl_glossary` (
`id` bigint(10) NOT NULL,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `intro` longtext NOT NULL,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `allowduplicatedentries` tinyint(2) NOT NULL DEFAULT '0',
  `displayformat` varchar(50) NOT NULL DEFAULT 'dictionary',
  `mainglossary` tinyint(2) NOT NULL DEFAULT '0',
  `showspecial` tinyint(2) NOT NULL DEFAULT '1',
  `showalphabet` tinyint(2) NOT NULL DEFAULT '1',
  `showall` tinyint(2) NOT NULL DEFAULT '1',
  `allowcomments` tinyint(2) NOT NULL DEFAULT '0',
  `allowprintview` tinyint(2) NOT NULL DEFAULT '1',
  `usedynalink` tinyint(2) NOT NULL DEFAULT '1',
  `defaultapproval` tinyint(2) NOT NULL DEFAULT '1',
  `approvaldisplayformat` varchar(50) NOT NULL DEFAULT 'default',
  `globalglossary` tinyint(2) NOT NULL DEFAULT '0',
  `entbypage` smallint(3) NOT NULL DEFAULT '10',
  `editalways` tinyint(2) NOT NULL DEFAULT '0',
  `rsstype` tinyint(2) NOT NULL DEFAULT '0',
  `rssarticles` tinyint(2) NOT NULL DEFAULT '0',
  `assessed` bigint(10) NOT NULL DEFAULT '0',
  `assesstimestart` bigint(10) NOT NULL DEFAULT '0',
  `assesstimefinish` bigint(10) NOT NULL DEFAULT '0',
  `scale` bigint(10) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `completionentries` int(9) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='all glossaries';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_glossary_alias`
--

CREATE TABLE IF NOT EXISTS `mdl_glossary_alias` (
`id` bigint(10) NOT NULL,
  `entryid` bigint(10) NOT NULL DEFAULT '0',
  `alias` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='entries alias';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_glossary_categories`
--

CREATE TABLE IF NOT EXISTS `mdl_glossary_categories` (
`id` bigint(10) NOT NULL,
  `glossaryid` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `usedynalink` tinyint(2) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='all categories for glossary entries';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_glossary_entries`
--

CREATE TABLE IF NOT EXISTS `mdl_glossary_entries` (
`id` bigint(10) NOT NULL,
  `glossaryid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `concept` varchar(255) NOT NULL DEFAULT '',
  `definition` longtext NOT NULL,
  `definitionformat` tinyint(2) NOT NULL DEFAULT '0',
  `definitiontrust` tinyint(2) NOT NULL DEFAULT '0',
  `attachment` varchar(100) NOT NULL DEFAULT '',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `teacherentry` tinyint(2) NOT NULL DEFAULT '0',
  `sourceglossaryid` bigint(10) NOT NULL DEFAULT '0',
  `usedynalink` tinyint(2) NOT NULL DEFAULT '1',
  `casesensitive` tinyint(2) NOT NULL DEFAULT '0',
  `fullmatch` tinyint(2) NOT NULL DEFAULT '1',
  `approved` tinyint(2) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='all glossary entries';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_glossary_entries_categories`
--

CREATE TABLE IF NOT EXISTS `mdl_glossary_entries_categories` (
`id` bigint(10) NOT NULL,
  `categoryid` bigint(10) NOT NULL DEFAULT '0',
  `entryid` bigint(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='categories of each glossary entry';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_glossary_formats`
--

CREATE TABLE IF NOT EXISTS `mdl_glossary_formats` (
`id` bigint(10) NOT NULL,
  `name` varchar(50) NOT NULL DEFAULT '',
  `popupformatname` varchar(50) NOT NULL DEFAULT '',
  `visible` tinyint(2) NOT NULL DEFAULT '1',
  `showgroup` tinyint(2) NOT NULL DEFAULT '1',
  `defaultmode` varchar(50) NOT NULL DEFAULT '',
  `defaulthook` varchar(50) NOT NULL DEFAULT '',
  `sortkey` varchar(50) NOT NULL DEFAULT '',
  `sortorder` varchar(50) NOT NULL DEFAULT ''
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='Setting of the display formats';

--
-- Dumping data for table `mdl_glossary_formats`
--

INSERT INTO `mdl_glossary_formats` (`id`, `name`, `popupformatname`, `visible`, `showgroup`, `defaultmode`, `defaulthook`, `sortkey`, `sortorder`) VALUES
(1, 'continuous', 'continuous', 1, 1, '', '', '', ''),
(2, 'dictionary', 'dictionary', 1, 1, '', '', '', ''),
(3, 'encyclopedia', 'encyclopedia', 1, 1, '', '', '', ''),
(4, 'entrylist', 'entrylist', 1, 1, '', '', '', ''),
(5, 'faq', 'faq', 1, 1, '', '', '', ''),
(6, 'fullwithauthor', 'fullwithauthor', 1, 1, '', '', '', ''),
(7, 'fullwithoutauthor', 'fullwithoutauthor', 1, 1, '', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `mdl_grade_categories`
--

CREATE TABLE IF NOT EXISTS `mdl_grade_categories` (
`id` bigint(10) NOT NULL,
  `courseid` bigint(10) NOT NULL,
  `parent` bigint(10) DEFAULT NULL,
  `depth` bigint(10) NOT NULL DEFAULT '0',
  `path` varchar(255) DEFAULT NULL,
  `fullname` varchar(255) NOT NULL DEFAULT '',
  `aggregation` bigint(10) NOT NULL DEFAULT '0',
  `keephigh` bigint(10) NOT NULL DEFAULT '0',
  `droplow` bigint(10) NOT NULL DEFAULT '0',
  `aggregateonlygraded` tinyint(1) NOT NULL DEFAULT '0',
  `aggregateoutcomes` tinyint(1) NOT NULL DEFAULT '0',
  `aggregatesubcats` tinyint(1) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) NOT NULL,
  `timemodified` bigint(10) NOT NULL,
  `hidden` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='This table keeps information about categories, used for grou';

--
-- Dumping data for table `mdl_grade_categories`
--

INSERT INTO `mdl_grade_categories` (`id`, `courseid`, `parent`, `depth`, `path`, `fullname`, `aggregation`, `keephigh`, `droplow`, `aggregateonlygraded`, `aggregateoutcomes`, `aggregatesubcats`, `timecreated`, `timemodified`, `hidden`) VALUES
(1, 2, NULL, 1, '/1/', '?', 11, 0, 0, 1, 0, 0, 1418138891, 1418138891, 0);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_grade_categories_history`
--

CREATE TABLE IF NOT EXISTS `mdl_grade_categories_history` (
`id` bigint(10) NOT NULL,
  `action` bigint(10) NOT NULL DEFAULT '0',
  `oldid` bigint(10) NOT NULL,
  `source` varchar(255) DEFAULT NULL,
  `timemodified` bigint(10) DEFAULT NULL,
  `loggeduser` bigint(10) DEFAULT NULL,
  `courseid` bigint(10) NOT NULL,
  `parent` bigint(10) DEFAULT NULL,
  `depth` bigint(10) NOT NULL DEFAULT '0',
  `path` varchar(255) DEFAULT NULL,
  `fullname` varchar(255) NOT NULL DEFAULT '',
  `aggregation` bigint(10) NOT NULL DEFAULT '0',
  `keephigh` bigint(10) NOT NULL DEFAULT '0',
  `droplow` bigint(10) NOT NULL DEFAULT '0',
  `aggregateonlygraded` tinyint(1) NOT NULL DEFAULT '0',
  `aggregateoutcomes` tinyint(1) NOT NULL DEFAULT '0',
  `aggregatesubcats` tinyint(1) NOT NULL DEFAULT '0',
  `hidden` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='History of grade_categories';

--
-- Dumping data for table `mdl_grade_categories_history`
--

INSERT INTO `mdl_grade_categories_history` (`id`, `action`, `oldid`, `source`, `timemodified`, `loggeduser`, `courseid`, `parent`, `depth`, `path`, `fullname`, `aggregation`, `keephigh`, `droplow`, `aggregateonlygraded`, `aggregateoutcomes`, `aggregatesubcats`, `hidden`) VALUES
(1, 1, 1, 'system', 1418138891, 4, 2, NULL, 0, NULL, '?', 11, 0, 0, 1, 0, 0, 0),
(2, 2, 1, 'system', 1418138891, 4, 2, NULL, 1, '/1/', '?', 11, 0, 0, 1, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_grade_grades`
--

CREATE TABLE IF NOT EXISTS `mdl_grade_grades` (
`id` bigint(10) NOT NULL,
  `itemid` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `rawgrade` decimal(10,5) DEFAULT NULL,
  `rawgrademax` decimal(10,5) NOT NULL DEFAULT '100.00000',
  `rawgrademin` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `rawscaleid` bigint(10) DEFAULT NULL,
  `usermodified` bigint(10) DEFAULT NULL,
  `finalgrade` decimal(10,5) DEFAULT NULL,
  `hidden` bigint(10) NOT NULL DEFAULT '0',
  `locked` bigint(10) NOT NULL DEFAULT '0',
  `locktime` bigint(10) NOT NULL DEFAULT '0',
  `exported` bigint(10) NOT NULL DEFAULT '0',
  `overridden` bigint(10) NOT NULL DEFAULT '0',
  `excluded` bigint(10) NOT NULL DEFAULT '0',
  `feedback` longtext,
  `feedbackformat` bigint(10) NOT NULL DEFAULT '0',
  `information` longtext,
  `informationformat` bigint(10) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) DEFAULT NULL,
  `timemodified` bigint(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='grade_grades  This table keeps individual grades for each us';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_grade_grades_history`
--

CREATE TABLE IF NOT EXISTS `mdl_grade_grades_history` (
`id` bigint(10) NOT NULL,
  `action` bigint(10) NOT NULL DEFAULT '0',
  `oldid` bigint(10) NOT NULL,
  `source` varchar(255) DEFAULT NULL,
  `timemodified` bigint(10) DEFAULT NULL,
  `loggeduser` bigint(10) DEFAULT NULL,
  `itemid` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `rawgrade` decimal(10,5) DEFAULT NULL,
  `rawgrademax` decimal(10,5) NOT NULL DEFAULT '100.00000',
  `rawgrademin` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `rawscaleid` bigint(10) DEFAULT NULL,
  `usermodified` bigint(10) DEFAULT NULL,
  `finalgrade` decimal(10,5) DEFAULT NULL,
  `hidden` bigint(10) NOT NULL DEFAULT '0',
  `locked` bigint(10) NOT NULL DEFAULT '0',
  `locktime` bigint(10) NOT NULL DEFAULT '0',
  `exported` bigint(10) NOT NULL DEFAULT '0',
  `overridden` bigint(10) NOT NULL DEFAULT '0',
  `excluded` bigint(10) NOT NULL DEFAULT '0',
  `feedback` longtext,
  `feedbackformat` bigint(10) NOT NULL DEFAULT '0',
  `information` longtext,
  `informationformat` bigint(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='History table';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_grade_import_newitem`
--

CREATE TABLE IF NOT EXISTS `mdl_grade_import_newitem` (
`id` bigint(10) NOT NULL,
  `itemname` varchar(255) NOT NULL DEFAULT '',
  `importcode` bigint(10) NOT NULL,
  `importer` bigint(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='temporary table for storing new grade_item names from grade ';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_grade_import_values`
--

CREATE TABLE IF NOT EXISTS `mdl_grade_import_values` (
`id` bigint(10) NOT NULL,
  `itemid` bigint(10) DEFAULT NULL,
  `newgradeitem` bigint(10) DEFAULT NULL,
  `userid` bigint(10) NOT NULL,
  `finalgrade` decimal(10,5) DEFAULT NULL,
  `feedback` longtext,
  `importcode` bigint(10) NOT NULL,
  `importer` bigint(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Temporary table for importing grades';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_grade_items`
--

CREATE TABLE IF NOT EXISTS `mdl_grade_items` (
`id` bigint(10) NOT NULL,
  `courseid` bigint(10) DEFAULT NULL,
  `categoryid` bigint(10) DEFAULT NULL,
  `itemname` varchar(255) DEFAULT NULL,
  `itemtype` varchar(30) NOT NULL DEFAULT '',
  `itemmodule` varchar(30) DEFAULT NULL,
  `iteminstance` bigint(10) DEFAULT NULL,
  `itemnumber` bigint(10) DEFAULT NULL,
  `iteminfo` longtext,
  `idnumber` varchar(255) DEFAULT NULL,
  `calculation` longtext,
  `gradetype` smallint(4) NOT NULL DEFAULT '1',
  `grademax` decimal(10,5) NOT NULL DEFAULT '100.00000',
  `grademin` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `scaleid` bigint(10) DEFAULT NULL,
  `outcomeid` bigint(10) DEFAULT NULL,
  `gradepass` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `multfactor` decimal(10,5) NOT NULL DEFAULT '1.00000',
  `plusfactor` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `aggregationcoef` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `sortorder` bigint(10) NOT NULL DEFAULT '0',
  `display` bigint(10) NOT NULL DEFAULT '0',
  `decimals` tinyint(1) DEFAULT NULL,
  `hidden` bigint(10) NOT NULL DEFAULT '0',
  `locked` bigint(10) NOT NULL DEFAULT '0',
  `locktime` bigint(10) NOT NULL DEFAULT '0',
  `needsupdate` bigint(10) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) DEFAULT NULL,
  `timemodified` bigint(10) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='This table keeps information about gradeable items (ie colum';

--
-- Dumping data for table `mdl_grade_items`
--

INSERT INTO `mdl_grade_items` (`id`, `courseid`, `categoryid`, `itemname`, `itemtype`, `itemmodule`, `iteminstance`, `itemnumber`, `iteminfo`, `idnumber`, `calculation`, `gradetype`, `grademax`, `grademin`, `scaleid`, `outcomeid`, `gradepass`, `multfactor`, `plusfactor`, `aggregationcoef`, `sortorder`, `display`, `decimals`, `hidden`, `locked`, `locktime`, `needsupdate`, `timecreated`, `timemodified`) VALUES
(1, 2, NULL, NULL, 'course', NULL, 1, NULL, NULL, NULL, NULL, 1, 100.00000, 0.00000, NULL, NULL, 0.00000, 1.00000, 0.00000, 0.00000, 1, 0, NULL, 0, 0, 0, 0, 1418138891, 1418138891),
(3, 2, 1, 'Quiz 1', 'mod', 'quiz', 1, 0, NULL, '', NULL, 1, 2.00000, 0.00000, NULL, NULL, 0.00000, 1.00000, 0.00000, 0.00000, 2, 0, NULL, 0, 0, 0, 0, 1419704462, 1419704532);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_grade_items_history`
--

CREATE TABLE IF NOT EXISTS `mdl_grade_items_history` (
`id` bigint(10) NOT NULL,
  `action` bigint(10) NOT NULL DEFAULT '0',
  `oldid` bigint(10) NOT NULL,
  `source` varchar(255) DEFAULT NULL,
  `timemodified` bigint(10) DEFAULT NULL,
  `loggeduser` bigint(10) DEFAULT NULL,
  `courseid` bigint(10) DEFAULT NULL,
  `categoryid` bigint(10) DEFAULT NULL,
  `itemname` varchar(255) DEFAULT NULL,
  `itemtype` varchar(30) NOT NULL DEFAULT '',
  `itemmodule` varchar(30) DEFAULT NULL,
  `iteminstance` bigint(10) DEFAULT NULL,
  `itemnumber` bigint(10) DEFAULT NULL,
  `iteminfo` longtext,
  `idnumber` varchar(255) DEFAULT NULL,
  `calculation` longtext,
  `gradetype` smallint(4) NOT NULL DEFAULT '1',
  `grademax` decimal(10,5) NOT NULL DEFAULT '100.00000',
  `grademin` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `scaleid` bigint(10) DEFAULT NULL,
  `outcomeid` bigint(10) DEFAULT NULL,
  `gradepass` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `multfactor` decimal(10,5) NOT NULL DEFAULT '1.00000',
  `plusfactor` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `aggregationcoef` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `sortorder` bigint(10) NOT NULL DEFAULT '0',
  `hidden` bigint(10) NOT NULL DEFAULT '0',
  `locked` bigint(10) NOT NULL DEFAULT '0',
  `locktime` bigint(10) NOT NULL DEFAULT '0',
  `needsupdate` bigint(10) NOT NULL DEFAULT '0',
  `display` bigint(10) NOT NULL DEFAULT '0',
  `decimals` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='History of grade_items';

--
-- Dumping data for table `mdl_grade_items_history`
--

INSERT INTO `mdl_grade_items_history` (`id`, `action`, `oldid`, `source`, `timemodified`, `loggeduser`, `courseid`, `categoryid`, `itemname`, `itemtype`, `itemmodule`, `iteminstance`, `itemnumber`, `iteminfo`, `idnumber`, `calculation`, `gradetype`, `grademax`, `grademin`, `scaleid`, `outcomeid`, `gradepass`, `multfactor`, `plusfactor`, `aggregationcoef`, `sortorder`, `hidden`, `locked`, `locktime`, `needsupdate`, `display`, `decimals`) VALUES
(1, 1, 1, 'system', 1418138891, 4, 2, NULL, NULL, 'course', NULL, 1, NULL, NULL, NULL, NULL, 1, 100.00000, 0.00000, NULL, NULL, 0.00000, 1.00000, 0.00000, 0.00000, 1, 0, 0, 0, 1, 0, NULL),
(2, 1, 2, NULL, 1418230163, 2, 2, 1, 'Lección 01', 'mod', 'lesson', 1, 0, NULL, '', NULL, 1, 100.00000, 0.00000, NULL, NULL, 0.00000, 1.00000, 0.00000, 0.00000, 2, 0, 0, 0, 1, 0, NULL),
(3, 2, 2, NULL, 1418230163, 2, 2, 1, 'Lección 01', 'mod', 'lesson', 1, 0, NULL, '', NULL, 1, 100.00000, 0.00000, NULL, NULL, 0.00000, 1.00000, 0.00000, 0.00000, 2, 0, 0, 0, 1, 0, NULL),
(4, 3, 2, 'mod/lesson', 1418230206, 2, 2, 1, 'Lección 01', 'mod', 'lesson', 1, 0, NULL, '', NULL, 1, 100.00000, 0.00000, NULL, NULL, 0.00000, 1.00000, 0.00000, 0.00000, 2, 0, 0, 0, 1, 0, NULL),
(5, 1, 3, NULL, 1419704462, 2, 2, 1, 'Quiz 1', 'mod', 'quiz', 1, 0, NULL, '', NULL, 1, 10.00000, 0.00000, NULL, NULL, 0.00000, 1.00000, 0.00000, 0.00000, 2, 0, 0, 0, 1, 0, NULL),
(6, 2, 3, NULL, 1419704462, 2, 2, 1, 'Quiz 1', 'mod', 'quiz', 1, 0, NULL, '', NULL, 1, 10.00000, 0.00000, NULL, NULL, 0.00000, 1.00000, 0.00000, 0.00000, 2, 0, 0, 0, 1, 0, NULL),
(7, 2, 3, NULL, 1419704532, 2, 2, 1, 'Quiz 1', 'mod', 'quiz', 1, 0, NULL, '', NULL, 1, 2.00000, 0.00000, NULL, NULL, 0.00000, 1.00000, 0.00000, 0.00000, 2, 0, 0, 0, 1, 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_grade_letters`
--

CREATE TABLE IF NOT EXISTS `mdl_grade_letters` (
`id` bigint(10) NOT NULL,
  `contextid` bigint(10) NOT NULL,
  `lowerboundary` decimal(10,5) NOT NULL,
  `letter` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Repository for grade letters, for courses and other moodle e';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_grade_outcomes`
--

CREATE TABLE IF NOT EXISTS `mdl_grade_outcomes` (
`id` bigint(10) NOT NULL,
  `courseid` bigint(10) DEFAULT NULL,
  `shortname` varchar(255) NOT NULL DEFAULT '',
  `fullname` longtext NOT NULL,
  `scaleid` bigint(10) DEFAULT NULL,
  `description` longtext,
  `descriptionformat` tinyint(2) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) DEFAULT NULL,
  `timemodified` bigint(10) DEFAULT NULL,
  `usermodified` bigint(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='This table describes the outcomes used in the system. An out';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_grade_outcomes_courses`
--

CREATE TABLE IF NOT EXISTS `mdl_grade_outcomes_courses` (
`id` bigint(10) NOT NULL,
  `courseid` bigint(10) NOT NULL,
  `outcomeid` bigint(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='stores what outcomes are used in what courses.';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_grade_outcomes_history`
--

CREATE TABLE IF NOT EXISTS `mdl_grade_outcomes_history` (
`id` bigint(10) NOT NULL,
  `action` bigint(10) NOT NULL DEFAULT '0',
  `oldid` bigint(10) NOT NULL,
  `source` varchar(255) DEFAULT NULL,
  `timemodified` bigint(10) DEFAULT NULL,
  `loggeduser` bigint(10) DEFAULT NULL,
  `courseid` bigint(10) DEFAULT NULL,
  `shortname` varchar(255) NOT NULL DEFAULT '',
  `fullname` longtext NOT NULL,
  `scaleid` bigint(10) DEFAULT NULL,
  `description` longtext,
  `descriptionformat` tinyint(2) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='History table';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_grade_settings`
--

CREATE TABLE IF NOT EXISTS `mdl_grade_settings` (
`id` bigint(10) NOT NULL,
  `courseid` bigint(10) NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `value` longtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='gradebook settings';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_gradingform_guide_comments`
--

CREATE TABLE IF NOT EXISTS `mdl_gradingform_guide_comments` (
`id` bigint(10) NOT NULL,
  `definitionid` bigint(10) NOT NULL,
  `sortorder` bigint(10) NOT NULL,
  `description` longtext,
  `descriptionformat` tinyint(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='frequently used comments used in marking guide';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_gradingform_guide_criteria`
--

CREATE TABLE IF NOT EXISTS `mdl_gradingform_guide_criteria` (
`id` bigint(10) NOT NULL,
  `definitionid` bigint(10) NOT NULL,
  `sortorder` bigint(10) NOT NULL,
  `shortname` varchar(255) NOT NULL DEFAULT '',
  `description` longtext,
  `descriptionformat` tinyint(2) DEFAULT NULL,
  `descriptionmarkers` longtext,
  `descriptionmarkersformat` tinyint(2) DEFAULT NULL,
  `maxscore` decimal(10,5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores the rows of the criteria grid.';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_gradingform_guide_fillings`
--

CREATE TABLE IF NOT EXISTS `mdl_gradingform_guide_fillings` (
`id` bigint(10) NOT NULL,
  `instanceid` bigint(10) NOT NULL,
  `criterionid` bigint(10) NOT NULL,
  `remark` longtext,
  `remarkformat` tinyint(2) DEFAULT NULL,
  `score` decimal(10,5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores the data of how the guide is filled by a particular r';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_gradingform_rubric_criteria`
--

CREATE TABLE IF NOT EXISTS `mdl_gradingform_rubric_criteria` (
`id` bigint(10) NOT NULL,
  `definitionid` bigint(10) NOT NULL,
  `sortorder` bigint(10) NOT NULL,
  `description` longtext,
  `descriptionformat` tinyint(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores the rows of the rubric grid.';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_gradingform_rubric_fillings`
--

CREATE TABLE IF NOT EXISTS `mdl_gradingform_rubric_fillings` (
`id` bigint(10) NOT NULL,
  `instanceid` bigint(10) NOT NULL,
  `criterionid` bigint(10) NOT NULL,
  `levelid` bigint(10) DEFAULT NULL,
  `remark` longtext,
  `remarkformat` tinyint(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores the data of how the rubric is filled by a particular ';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_gradingform_rubric_levels`
--

CREATE TABLE IF NOT EXISTS `mdl_gradingform_rubric_levels` (
`id` bigint(10) NOT NULL,
  `criterionid` bigint(10) NOT NULL,
  `score` decimal(10,5) NOT NULL,
  `definition` longtext,
  `definitionformat` bigint(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores the columns of the rubric grid.';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_grading_areas`
--

CREATE TABLE IF NOT EXISTS `mdl_grading_areas` (
`id` bigint(10) NOT NULL,
  `contextid` bigint(10) NOT NULL,
  `component` varchar(100) NOT NULL DEFAULT '',
  `areaname` varchar(100) NOT NULL DEFAULT '',
  `activemethod` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Identifies gradable areas where advanced grading can happen.';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_grading_definitions`
--

CREATE TABLE IF NOT EXISTS `mdl_grading_definitions` (
`id` bigint(10) NOT NULL,
  `areaid` bigint(10) NOT NULL,
  `method` varchar(100) NOT NULL DEFAULT '',
  `name` varchar(255) NOT NULL DEFAULT '',
  `description` longtext,
  `descriptionformat` tinyint(2) DEFAULT NULL,
  `status` bigint(10) NOT NULL DEFAULT '0',
  `copiedfromid` bigint(10) DEFAULT NULL,
  `timecreated` bigint(10) NOT NULL,
  `usercreated` bigint(10) NOT NULL,
  `timemodified` bigint(10) NOT NULL,
  `usermodified` bigint(10) NOT NULL,
  `timecopied` bigint(10) DEFAULT '0',
  `options` longtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Contains the basic information about an advanced grading for';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_grading_instances`
--

CREATE TABLE IF NOT EXISTS `mdl_grading_instances` (
`id` bigint(10) NOT NULL,
  `definitionid` bigint(10) NOT NULL,
  `raterid` bigint(10) NOT NULL,
  `itemid` bigint(10) DEFAULT NULL,
  `rawgrade` decimal(10,5) DEFAULT NULL,
  `status` bigint(10) NOT NULL DEFAULT '0',
  `feedback` longtext,
  `feedbackformat` tinyint(2) DEFAULT NULL,
  `timemodified` bigint(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Grading form instance is an assessment record for one gradab';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_groupings`
--

CREATE TABLE IF NOT EXISTS `mdl_groupings` (
`id` bigint(10) NOT NULL,
  `courseid` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `idnumber` varchar(100) NOT NULL DEFAULT '',
  `description` longtext,
  `descriptionformat` tinyint(2) NOT NULL DEFAULT '0',
  `configdata` longtext,
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='A grouping is a collection of groups. WAS: groups_groupings';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_groupings_groups`
--

CREATE TABLE IF NOT EXISTS `mdl_groupings_groups` (
`id` bigint(10) NOT NULL,
  `groupingid` bigint(10) NOT NULL DEFAULT '0',
  `groupid` bigint(10) NOT NULL DEFAULT '0',
  `timeadded` bigint(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Link a grouping to a group (note, groups can be in multiple ';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_groups`
--

CREATE TABLE IF NOT EXISTS `mdl_groups` (
`id` bigint(10) NOT NULL,
  `courseid` bigint(10) NOT NULL,
  `idnumber` varchar(100) NOT NULL DEFAULT '',
  `name` varchar(254) NOT NULL DEFAULT '',
  `description` longtext,
  `descriptionformat` tinyint(2) NOT NULL DEFAULT '0',
  `enrolmentkey` varchar(50) DEFAULT NULL,
  `picture` bigint(10) NOT NULL DEFAULT '0',
  `hidepicture` tinyint(1) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Each record represents a group.';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_groups_members`
--

CREATE TABLE IF NOT EXISTS `mdl_groups_members` (
`id` bigint(10) NOT NULL,
  `groupid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `timeadded` bigint(10) NOT NULL DEFAULT '0',
  `component` varchar(100) NOT NULL DEFAULT '',
  `itemid` bigint(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Link a user to a group.';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_imscp`
--

CREATE TABLE IF NOT EXISTS `mdl_imscp` (
`id` bigint(10) NOT NULL,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `intro` longtext,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `revision` bigint(10) NOT NULL DEFAULT '0',
  `keepold` bigint(10) NOT NULL DEFAULT '-1',
  `structure` longtext,
  `timemodified` bigint(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='each record is one imscp resource';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_label`
--

CREATE TABLE IF NOT EXISTS `mdl_label` (
`id` bigint(10) NOT NULL,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `intro` longtext NOT NULL,
  `introformat` smallint(4) DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Defines labels';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_lesson`
--

CREATE TABLE IF NOT EXISTS `mdl_lesson` (
`id` bigint(10) NOT NULL,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `practice` smallint(3) NOT NULL DEFAULT '0',
  `modattempts` smallint(3) NOT NULL DEFAULT '0',
  `usepassword` smallint(3) NOT NULL DEFAULT '0',
  `password` varchar(32) NOT NULL DEFAULT '',
  `dependency` bigint(10) NOT NULL DEFAULT '0',
  `conditions` longtext NOT NULL,
  `grade` smallint(3) NOT NULL DEFAULT '0',
  `custom` smallint(3) NOT NULL DEFAULT '0',
  `ongoing` smallint(3) NOT NULL DEFAULT '0',
  `usemaxgrade` smallint(3) NOT NULL DEFAULT '0',
  `maxanswers` smallint(3) NOT NULL DEFAULT '4',
  `maxattempts` smallint(3) NOT NULL DEFAULT '5',
  `review` smallint(3) NOT NULL DEFAULT '0',
  `nextpagedefault` smallint(3) NOT NULL DEFAULT '0',
  `feedback` smallint(3) NOT NULL DEFAULT '1',
  `minquestions` smallint(3) NOT NULL DEFAULT '0',
  `maxpages` smallint(3) NOT NULL DEFAULT '0',
  `timed` smallint(3) NOT NULL DEFAULT '0',
  `maxtime` bigint(10) NOT NULL DEFAULT '0',
  `retake` smallint(3) NOT NULL DEFAULT '1',
  `activitylink` bigint(10) NOT NULL DEFAULT '0',
  `mediafile` varchar(255) NOT NULL DEFAULT '',
  `mediaheight` bigint(10) NOT NULL DEFAULT '100',
  `mediawidth` bigint(10) NOT NULL DEFAULT '650',
  `mediaclose` smallint(3) NOT NULL DEFAULT '0',
  `slideshow` smallint(3) NOT NULL DEFAULT '0',
  `width` bigint(10) NOT NULL DEFAULT '640',
  `height` bigint(10) NOT NULL DEFAULT '480',
  `bgcolor` varchar(7) NOT NULL DEFAULT '#FFFFFF',
  `displayleft` smallint(3) NOT NULL DEFAULT '0',
  `displayleftif` smallint(3) NOT NULL DEFAULT '0',
  `progressbar` smallint(3) NOT NULL DEFAULT '0',
  `highscores` smallint(3) NOT NULL DEFAULT '0',
  `maxhighscores` bigint(10) NOT NULL DEFAULT '0',
  `available` bigint(10) NOT NULL DEFAULT '0',
  `deadline` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='Defines lesson';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_lesson_answers`
--

CREATE TABLE IF NOT EXISTS `mdl_lesson_answers` (
`id` bigint(10) NOT NULL,
  `lessonid` bigint(10) NOT NULL DEFAULT '0',
  `pageid` bigint(10) NOT NULL DEFAULT '0',
  `jumpto` bigint(11) NOT NULL DEFAULT '0',
  `grade` smallint(4) NOT NULL DEFAULT '0',
  `score` bigint(10) NOT NULL DEFAULT '0',
  `flags` smallint(3) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `answer` longtext,
  `answerformat` tinyint(2) NOT NULL DEFAULT '0',
  `response` longtext,
  `responseformat` tinyint(2) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Defines lesson_answers';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_lesson_attempts`
--

CREATE TABLE IF NOT EXISTS `mdl_lesson_attempts` (
`id` bigint(10) NOT NULL,
  `lessonid` bigint(10) NOT NULL DEFAULT '0',
  `pageid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `answerid` bigint(10) NOT NULL DEFAULT '0',
  `retry` smallint(3) NOT NULL DEFAULT '0',
  `correct` bigint(10) NOT NULL DEFAULT '0',
  `useranswer` longtext,
  `timeseen` bigint(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Defines lesson_attempts';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_lesson_branch`
--

CREATE TABLE IF NOT EXISTS `mdl_lesson_branch` (
`id` bigint(10) NOT NULL,
  `lessonid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `pageid` bigint(10) NOT NULL DEFAULT '0',
  `retry` bigint(10) NOT NULL DEFAULT '0',
  `flag` smallint(3) NOT NULL DEFAULT '0',
  `timeseen` bigint(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='branches for each lesson/user';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_lesson_grades`
--

CREATE TABLE IF NOT EXISTS `mdl_lesson_grades` (
`id` bigint(10) NOT NULL,
  `lessonid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `grade` double NOT NULL DEFAULT '0',
  `late` smallint(3) NOT NULL DEFAULT '0',
  `completed` bigint(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Defines lesson_grades';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_lesson_high_scores`
--

CREATE TABLE IF NOT EXISTS `mdl_lesson_high_scores` (
`id` bigint(10) NOT NULL,
  `lessonid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `gradeid` bigint(10) NOT NULL DEFAULT '0',
  `nickname` varchar(5) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='high scores for each lesson';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_lesson_pages`
--

CREATE TABLE IF NOT EXISTS `mdl_lesson_pages` (
`id` bigint(10) NOT NULL,
  `lessonid` bigint(10) NOT NULL DEFAULT '0',
  `prevpageid` bigint(10) NOT NULL DEFAULT '0',
  `nextpageid` bigint(10) NOT NULL DEFAULT '0',
  `qtype` smallint(3) NOT NULL DEFAULT '0',
  `qoption` smallint(3) NOT NULL DEFAULT '0',
  `layout` smallint(3) NOT NULL DEFAULT '1',
  `display` smallint(3) NOT NULL DEFAULT '1',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL DEFAULT '',
  `contents` longtext NOT NULL,
  `contentsformat` tinyint(2) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Defines lesson_pages';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_lesson_timer`
--

CREATE TABLE IF NOT EXISTS `mdl_lesson_timer` (
`id` bigint(10) NOT NULL,
  `lessonid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `starttime` bigint(10) NOT NULL DEFAULT '0',
  `lessontime` bigint(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='lesson timer for each lesson';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_license`
--

CREATE TABLE IF NOT EXISTS `mdl_license` (
`id` bigint(10) NOT NULL,
  `shortname` varchar(255) DEFAULT NULL,
  `fullname` longtext,
  `source` varchar(255) DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `version` bigint(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='store licenses used by moodle';

--
-- Dumping data for table `mdl_license`
--

INSERT INTO `mdl_license` (`id`, `shortname`, `fullname`, `source`, `enabled`, `version`) VALUES
(1, 'unknown', 'Unknown license', '', 1, 2010033100),
(2, 'allrightsreserved', 'All rights reserved', 'http://en.wikipedia.org/wiki/All_rights_reserved', 1, 2010033100),
(3, 'public', 'Public Domain', 'http://creativecommons.org/licenses/publicdomain/', 1, 2010033100),
(4, 'cc', 'Creative Commons', 'http://creativecommons.org/licenses/by/3.0/', 1, 2010033100),
(5, 'cc-nd', 'Creative Commons - NoDerivs', 'http://creativecommons.org/licenses/by-nd/3.0/', 1, 2010033100),
(6, 'cc-nc-nd', 'Creative Commons - No Commercial NoDerivs', 'http://creativecommons.org/licenses/by-nc-nd/3.0/', 1, 2010033100),
(7, 'cc-nc', 'Creative Commons - No Commercial', 'http://creativecommons.org/licenses/by-nc/3.0/', 1, 2013051500),
(8, 'cc-nc-sa', 'Creative Commons - No Commercial ShareAlike', 'http://creativecommons.org/licenses/by-nc-sa/3.0/', 1, 2010033100),
(9, 'cc-sa', 'Creative Commons - ShareAlike', 'http://creativecommons.org/licenses/by-sa/3.0/', 1, 2010033100);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_lock_db`
--

CREATE TABLE IF NOT EXISTS `mdl_lock_db` (
`id` bigint(10) NOT NULL,
  `resourcekey` varchar(255) NOT NULL DEFAULT '',
  `expires` bigint(10) DEFAULT NULL,
  `owner` varchar(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores active and inactive lock types for db locking method.';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_log`
--

CREATE TABLE IF NOT EXISTS `mdl_log` (
`id` bigint(10) NOT NULL,
  `time` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `ip` varchar(45) NOT NULL DEFAULT '',
  `course` bigint(10) NOT NULL DEFAULT '0',
  `module` varchar(20) NOT NULL DEFAULT '',
  `cmid` bigint(10) NOT NULL DEFAULT '0',
  `action` varchar(40) NOT NULL DEFAULT '',
  `url` varchar(100) NOT NULL DEFAULT '',
  `info` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Every action is logged as far as possible';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_logstore_standard_log`
--

CREATE TABLE IF NOT EXISTS `mdl_logstore_standard_log` (
`id` bigint(10) NOT NULL,
  `eventname` varchar(255) NOT NULL DEFAULT '',
  `component` varchar(100) NOT NULL DEFAULT '',
  `action` varchar(100) NOT NULL DEFAULT '',
  `target` varchar(100) NOT NULL DEFAULT '',
  `objecttable` varchar(50) DEFAULT NULL,
  `objectid` bigint(10) DEFAULT NULL,
  `crud` varchar(1) NOT NULL DEFAULT '',
  `edulevel` tinyint(1) NOT NULL,
  `contextid` bigint(10) NOT NULL,
  `contextlevel` bigint(10) NOT NULL,
  `contextinstanceid` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `courseid` bigint(10) DEFAULT NULL,
  `relateduserid` bigint(10) DEFAULT NULL,
  `anonymous` tinyint(1) NOT NULL DEFAULT '0',
  `other` longtext,
  `timecreated` bigint(10) NOT NULL,
  `origin` varchar(10) DEFAULT NULL,
  `ip` varchar(45) DEFAULT NULL,
  `realuserid` bigint(10) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=329 DEFAULT CHARSET=utf8 COMMENT='Standard log table';

--
-- Dumping data for table `mdl_logstore_standard_log`
--

INSERT INTO `mdl_logstore_standard_log` (`id`, `eventname`, `component`, `action`, `target`, `objecttable`, `objectid`, `crud`, `edulevel`, `contextid`, `contextlevel`, `contextinstanceid`, `userid`, `courseid`, `relateduserid`, `anonymous`, `other`, `timecreated`, `origin`, `ip`, `realuserid`) VALUES
(1, '\\core\\event\\user_loggedin', 'core', 'loggedin', 'user', 'user', 2, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"username";s:5:"admin";}', 1415061037, 'web', '127.0.0.1', NULL),
(2, '\\core\\event\\user_password_updated', 'core', 'updated', 'user_password', NULL, NULL, 'u', 0, 5, 30, 2, 2, 0, 2, 0, 'a:1:{s:14:"forgottenreset";b:0;}', 1415061118, 'web', '127.0.0.1', NULL),
(3, '\\core\\event\\user_updated', 'core', 'updated', 'user', 'user', 2, 'u', 0, 5, 30, 2, 2, 0, 2, 0, 'N;', 1415061118, 'web', '127.0.0.1', NULL),
(4, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 2, 1, NULL, 0, 'N;', 1415061185, 'web', '127.0.0.1', NULL),
(5, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 2, 1, NULL, 0, 'N;', 1415061199, 'web', '127.0.0.1', NULL),
(6, '\\core\\event\\user_loggedout', 'core', 'loggedout', 'user', 'user', 2, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:9:"sessionid";s:32:"d76322b4695898b06558b6af154e85a0";}', 1415061233, 'web', '127.0.0.1', NULL),
(7, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 0, 1, NULL, 0, 'N;', 1415061234, 'web', '127.0.0.1', NULL),
(8, '\\core\\event\\user_loggedin', 'core', 'loggedin', 'user', 'user', 2, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"username";s:5:"admin";}', 1415061415, 'web', '127.0.0.1', NULL),
(9, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 2, 1, NULL, 0, 'N;', 1415061416, 'web', '127.0.0.1', NULL),
(10, '\\core\\event\\user_loggedout', 'core', 'loggedout', 'user', 'user', 2, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:9:"sessionid";s:32:"2820c8452bc78a6b27e5e13069130f2e";}', 1415061504, 'web', '127.0.0.1', NULL),
(11, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 0, 1, NULL, 0, 'N;', 1415061504, 'web', '127.0.0.1', NULL),
(12, '\\core\\event\\user_loggedin', 'core', 'loggedin', 'user', 'user', 2, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"username";s:5:"admin";}', 1415061523, 'web', '127.0.0.1', NULL),
(13, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 2, 1, NULL, 0, 'N;', 1415061524, 'web', '127.0.0.1', NULL),
(14, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 2, 1, NULL, 0, 'N;', 1415061538, 'web', '127.0.0.1', NULL),
(15, '\\core\\event\\user_loggedout', 'core', 'loggedout', 'user', 'user', 2, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:9:"sessionid";s:32:"0f0f0268b6a81ef25fb41aaa073326e0";}', 1415062312, 'web', '127.0.0.1', NULL),
(16, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 0, 1, NULL, 0, 'N;', 1415062313, 'web', '127.0.0.1', NULL),
(17, '\\core\\event\\user_loggedin', 'core', 'loggedin', 'user', 'user', 2, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"username";s:5:"admin";}', 1415062428, 'web', '127.0.0.1', NULL),
(18, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 2, 1, NULL, 0, 'N;', 1415062428, 'web', '127.0.0.1', NULL),
(19, '\\core\\event\\user_loggedout', 'core', 'loggedout', 'user', 'user', 2, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:9:"sessionid";s:32:"9658f893f54275ed8320c6f8638d29b1";}', 1415062460, 'web', '127.0.0.1', NULL),
(20, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 0, 1, NULL, 0, 'N;', 1415062461, 'web', '127.0.0.1', NULL),
(21, '\\core\\event\\user_login_failed', 'core', 'failed', 'user_login', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:2:{s:8:"username";s:5:"admin";s:6:"reason";i:3;}', 1415062583, 'web', '127.0.0.1', NULL),
(22, '\\core\\event\\user_loggedin', 'core', 'loggedin', 'user', 'user', 2, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"username";s:5:"admin";}', 1415062593, 'web', '127.0.0.1', NULL),
(23, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 2, 1, NULL, 0, 'N;', 1415062594, 'web', '127.0.0.1', NULL),
(24, '\\core\\event\\user_loggedout', 'core', 'loggedout', 'user', 'user', 2, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:9:"sessionid";s:32:"e5c774be81ced8c453b7e99ec83f8122";}', 1415062660, 'web', '127.0.0.1', NULL),
(25, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 0, 1, NULL, 0, 'N;', 1415062660, 'web', '127.0.0.1', NULL),
(26, '\\core\\event\\user_loggedin', 'core', 'loggedin', 'user', 'user', 2, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"username";s:5:"admin";}', 1415062684, 'web', '127.0.0.1', NULL),
(27, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 2, 1, NULL, 0, 'N;', 1415062684, 'web', '127.0.0.1', NULL),
(28, '\\core\\event\\user_loggedout', 'core', 'loggedout', 'user', 'user', 2, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:9:"sessionid";s:32:"e4af7f53363f14ea7626dcb74d72001f";}', 1415062845, 'web', '127.0.0.1', NULL),
(29, '\\core\\event\\user_loggedin', 'core', 'loggedin', 'user', 'user', 2, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"username";s:5:"admin";}', 1415154530, 'web', '0:0:0:0:0:0:0:1', NULL),
(30, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 2, 1, NULL, 0, 'N;', 1415154552, 'web', '0:0:0:0:0:0:0:1', NULL),
(31, '\\core\\event\\user_loggedin', 'core', 'loggedin', 'user', 'user', 2, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"username";s:5:"admin";}', 1415195941, 'web', '201.195.209.206', NULL),
(32, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 2, 1, NULL, 0, 'N;', 1415196063, 'web', '201.195.209.206', NULL),
(33, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 2, 1, NULL, 0, 'N;', 1415196133, 'web', '201.195.209.206', NULL),
(34, '\\core\\event\\user_loggedout', 'core', 'loggedout', 'user', 'user', 2, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:9:"sessionid";s:26:"jp3e98lbhq8v0eie2mfkimc1i4";}', 1415197048, 'web', '201.195.209.206', NULL),
(35, '\\core\\event\\user_loggedin', 'core', 'loggedin', 'user', 'user', 2, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"username";s:5:"admin";}', 1415197068, 'web', '201.195.209.206', NULL),
(36, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 2, 1, NULL, 0, 'N;', 1415197070, 'web', '201.195.209.206', NULL),
(37, '\\core\\event\\user_loggedout', 'core', 'loggedout', 'user', 'user', 2, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:9:"sessionid";s:26:"faagtu06uk2jfrunbpln1it8t4";}', 1415197079, 'web', '201.195.209.206', NULL),
(38, '\\core\\event\\user_loggedin', 'core', 'loggedin', 'user', 'user', 2, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"username";s:5:"admin";}', 1415299741, 'web', '201.195.209.206', NULL),
(39, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 2, 1, NULL, 0, 'N;', 1415299746, 'web', '201.195.209.206', NULL),
(40, '\\core\\event\\role_capabilities_updated', 'core', 'updated', 'role_capabilities', 'role', 0, 'u', 0, 1, 10, 0, 2, 0, NULL, 0, 'N;', 1415300512, 'web', '201.195.209.206', NULL),
(41, '\\core\\event\\role_capabilities_updated', 'core', 'updated', 'role_capabilities', 'role', 0, 'u', 0, 1, 10, 0, 2, 0, NULL, 0, 'N;', 1415300767, 'web', '201.195.209.206', NULL),
(42, '\\core\\event\\user_loggedout', 'core', 'loggedout', 'user', 'user', 2, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:9:"sessionid";s:26:"oa851c7u0uectf1277ctcpo321";}', 1415300939, 'web', '201.195.209.206', NULL),
(43, '\\core\\event\\user_loggedin', 'core', 'loggedin', 'user', 'user', 2, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"username";s:5:"admin";}', 1415300968, 'web', '201.195.209.206', NULL),
(44, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 2, 1, NULL, 0, 'N;', 1415300971, 'web', '201.195.209.206', NULL),
(45, '\\core\\event\\user_loggedout', 'core', 'loggedout', 'user', 'user', 2, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:9:"sessionid";s:26:"k80mdnhc9ch41mss3qobndjau2";}', 1415300997, 'web', '201.195.209.206', NULL),
(46, '\\core\\event\\user_loggedin', 'core', 'loggedin', 'user', 'user', 2, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"username";s:5:"admin";}', 1415372380, 'web', '201.195.209.206', NULL),
(47, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 2, 1, NULL, 0, 'N;', 1415372385, 'web', '201.195.209.206', NULL),
(48, '\\core\\event\\course_category_created', 'core', 'created', 'course_category', 'course_categories', 2, 'c', 0, 15, 40, 2, 2, 0, NULL, 0, 'N;', 1415372547, 'web', '201.195.209.206', NULL),
(49, '\\core\\event\\course_category_updated', 'core', 'updated', 'course_category', 'course_categories', 1, 'u', 0, 3, 40, 1, 2, 0, NULL, 0, 'N;', 1415372567, 'web', '201.195.209.206', NULL),
(50, '\\core\\event\\course_category_updated', 'core', 'updated', 'course_category', 'course_categories', 1, 'u', 0, 3, 40, 1, 2, 0, NULL, 0, 'N;', 1415372571, 'web', '201.195.209.206', NULL),
(51, '\\core\\event\\course_created', 'core', 'created', 'course', 'course', 2, 'c', 1, 16, 50, 2, 2, 2, NULL, 0, 'a:2:{s:9:"shortname";s:5:"CP-01";s:8:"fullname";s:22:"Curso de prueba online";}', 1415372771, 'web', '201.195.209.206', NULL),
(52, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 2, 1, NULL, 0, 'N;', 1415373520, 'web', '201.195.209.206', NULL),
(53, '\\core\\event\\role_capabilities_updated', 'core', 'updated', 'role_capabilities', 'role', 9, 'u', 0, 1, 10, 0, 2, 0, NULL, 0, 'N;', 1415374672, 'web', '201.195.209.206', NULL),
(54, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 2, 1, NULL, 0, 'N;', 1415374720, 'web', '201.195.209.206', NULL),
(55, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 2, 1, NULL, 0, 'N;', 1415374743, 'web', '201.195.209.206', NULL),
(56, '\\core\\event\\user_loggedout', 'core', 'loggedout', 'user', 'user', 2, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:9:"sessionid";s:26:"7p7kh62jh9gukleh6vvjbkcsn4";}', 1415374816, 'web', '201.195.209.206', NULL),
(57, '\\core\\event\\user_loggedin', 'core', 'loggedin', 'user', 'user', 2, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"username";s:5:"admin";}', 1415420007, 'web', '201.195.217.90', NULL),
(58, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 2, 1, NULL, 0, 'N;', 1415420010, 'web', '201.195.217.90', NULL),
(59, '\\core\\event\\user_loggedin', 'core', 'loggedin', 'user', 'user', 2, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"username";s:5:"admin";}', 1415682151, 'web', '201.195.217.90', NULL),
(60, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 2, 1, NULL, 0, 'N;', 1415682154, 'web', '201.195.217.90', NULL),
(61, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 2, 1, NULL, 0, 'N;', 1415682964, 'web', '201.195.217.90', NULL),
(62, '\\core\\event\\user_loggedout', 'core', 'loggedout', 'user', 'user', 2, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:9:"sessionid";s:26:"grd8uscbmmiih70vmfs4mi8m74";}', 1415683499, 'web', '201.195.217.90', NULL),
(63, '\\core\\event\\user_loggedin', 'core', 'loggedin', 'user', 'user', 2, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"username";s:5:"admin";}', 1415748741, 'web', '181.193.19.161', NULL),
(64, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 2, 1, NULL, 0, 'N;', 1415748744, 'web', '181.193.19.161', NULL),
(65, '\\core\\event\\user_loggedout', 'core', 'loggedout', 'user', 'user', 2, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:9:"sessionid";s:26:"ntho0m26g34krqcn78t0nvmo63";}', 1415748957, 'web', '181.193.19.161', NULL),
(66, '\\core\\event\\user_loggedin', 'core', 'loggedin', 'user', 'user', 2, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"username";s:5:"admin";}', 1415832893, 'web', '201.195.209.206', NULL),
(67, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 2, 1, NULL, 0, 'N;', 1415832902, 'web', '201.195.209.206', NULL),
(68, '\\core\\event\\user_loggedin', 'core', 'loggedin', 'user', 'user', 2, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"username";s:5:"admin";}', 1415912203, 'web', '201.195.209.206', NULL),
(69, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 2, 1, NULL, 0, 'N;', 1415912210, 'web', '201.195.209.206', NULL),
(70, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 16, 50, 2, 2, 2, NULL, 0, 'N;', 1415912226, 'web', '201.195.209.206', NULL),
(71, '\\core\\event\\role_capabilities_updated', 'core', 'updated', 'role_capabilities', 'role', 9, 'u', 0, 1, 10, 0, 2, 0, NULL, 0, 'N;', 1415913130, 'web', '201.195.209.206', NULL),
(72, '\\core\\event\\role_capabilities_updated', 'core', 'updated', 'role_capabilities', 'role', 9, 'u', 0, 1, 10, 0, 2, 0, NULL, 0, 'N;', 1415913940, 'web', '201.195.209.206', NULL),
(73, '\\core\\event\\role_capabilities_updated', 'core', 'updated', 'role_capabilities', 'role', 9, 'u', 0, 1, 10, 0, 2, 0, NULL, 0, 'N;', 1415915911, 'web', '201.195.209.206', NULL),
(74, '\\core\\event\\user_created', 'core', 'created', 'user', 'user', 3, 'c', 0, 22, 30, 3, 2, 0, 3, 0, 'N;', 1415916145, 'web', '201.195.209.206', NULL),
(75, '\\core\\event\\user_created', 'core', 'created', 'user', 'user', 4, 'c', 0, 23, 30, 4, 2, 0, 4, 0, 'N;', 1415916307, 'web', '201.195.209.206', NULL),
(76, '\\core\\event\\user_updated', 'core', 'updated', 'user', 'user', 4, 'u', 0, 23, 30, 4, 2, 0, 4, 0, 'N;', 1415916360, 'web', '201.195.209.206', NULL),
(77, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 2, 1, NULL, 0, 'N;', 1415916518, 'web', '201.195.209.206', NULL),
(78, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 16, 50, 2, 2, 2, NULL, 0, 'N;', 1415916729, 'web', '201.195.209.206', NULL),
(79, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 16, 50, 2, 2, 2, NULL, 0, 'N;', 1415916792, 'web', '201.195.209.206', NULL),
(80, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 16, 50, 2, 2, 2, NULL, 0, 'N;', 1415916831, 'web', '201.195.209.206', NULL),
(81, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 16, 50, 2, 2, 2, NULL, 0, 'N;', 1415916845, 'web', '201.195.209.206', NULL),
(82, '\\core\\event\\course_updated', 'core', 'updated', 'course', 'course', 2, 'u', 1, 16, 50, 2, 2, 2, NULL, 0, 'a:2:{s:9:"shortname";s:5:"CP-01";s:8:"fullname";s:22:"Curso de prueba online";}', 1415917035, 'web', '201.195.209.206', NULL),
(83, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 16, 50, 2, 2, 2, NULL, 0, 'N;', 1415917039, 'web', '201.195.209.206', NULL),
(84, '\\core\\event\\user_enrolment_created', 'core', 'created', 'user_enrolment', 'user_enrolments', 1, 'c', 0, 16, 50, 2, 2, 2, 3, 0, 'a:1:{s:5:"enrol";s:6:"manual";}', 1415917218, 'web', '201.195.209.206', NULL),
(85, '\\core\\event\\role_assigned', 'core', 'assigned', 'role', 'role', 5, 'c', 0, 16, 50, 2, 2, 2, 3, 0, 'a:3:{s:2:"id";i:1;s:9:"component";s:0:"";s:6:"itemid";i:0;}', 1415917218, 'web', '201.195.209.206', NULL),
(86, '\\core\\event\\user_enrolment_created', 'core', 'created', 'user_enrolment', 'user_enrolments', 2, 'c', 0, 16, 50, 2, 2, 2, 4, 0, 'a:1:{s:5:"enrol";s:6:"manual";}', 1415917221, 'web', '201.195.209.206', NULL),
(87, '\\core\\event\\role_assigned', 'core', 'assigned', 'role', 'role', 5, 'c', 0, 16, 50, 2, 2, 2, 4, 0, 'a:3:{s:2:"id";i:2;s:9:"component";s:0:"";s:6:"itemid";i:0;}', 1415917221, 'web', '201.195.209.206', NULL),
(88, '\\core\\event\\role_assigned', 'core', 'assigned', 'role', 'role', 9, 'c', 0, 16, 50, 2, 2, 2, 3, 0, 'a:3:{s:2:"id";i:3;s:9:"component";s:0:"";s:6:"itemid";i:0;}', 1415917247, 'web', '201.195.209.206', NULL),
(89, '\\core\\event\\role_unassigned', 'core', 'unassigned', 'role', 'role', 5, 'd', 0, 16, 50, 2, 2, 2, 3, 0, 'a:3:{s:2:"id";s:1:"1";s:9:"component";s:0:"";s:6:"itemid";s:1:"0";}', 1415917254, 'web', '201.195.209.206', NULL),
(90, '\\core\\event\\role_unassigned', 'core', 'unassigned', 'role', 'role', 5, 'd', 0, 16, 50, 2, 2, 2, 4, 0, 'a:3:{s:2:"id";s:1:"2";s:9:"component";s:0:"";s:6:"itemid";s:1:"0";}', 1415917266, 'web', '201.195.209.206', NULL),
(91, '\\core\\event\\role_assigned', 'core', 'assigned', 'role', 'role', 10, 'c', 0, 16, 50, 2, 2, 2, 4, 0, 'a:3:{s:2:"id";i:4;s:9:"component";s:0:"";s:6:"itemid";i:0;}', 1415917274, 'web', '201.195.209.206', NULL),
(92, '\\core\\event\\user_list_viewed', 'core', 'viewed', 'user_list', 'course', 2, 'r', 0, 16, 50, 2, 2, 2, NULL, 0, 'a:2:{s:15:"courseshortname";s:5:"CP-01";s:14:"coursefullname";s:22:"Curso de prueba online";}', 1415917298, 'web', '201.195.209.206', NULL),
(93, '\\core\\event\\user_loggedout', 'core', 'loggedout', 'user', 'user', 2, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:9:"sessionid";s:26:"d4qa3cl3tsst8c8ojctmd9p245";}', 1415917319, 'web', '201.195.209.206', NULL),
(94, '\\core\\event\\user_loggedin', 'core', 'loggedin', 'user', 'user', 2, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"username";s:5:"admin";}', 1416160712, 'web', '201.195.209.206', NULL),
(95, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 2, 1, NULL, 0, 'N;', 1416160716, 'web', '201.195.209.206', NULL),
(96, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 2, 1, NULL, 0, 'N;', 1416162894, 'web', '201.195.209.206', NULL),
(97, '\\core\\event\\role_capabilities_updated', 'core', 'updated', 'role_capabilities', 'role', 10, 'u', 0, 1, 10, 0, 2, 0, NULL, 0, 'N;', 1416163599, 'web', '201.195.209.206', NULL),
(98, '\\core\\event\\role_allow_switch_updated', 'core', 'updated', 'role_allow_switch', NULL, NULL, 'u', 0, 1, 10, 0, 2, 0, NULL, 0, 'N;', 1416163690, 'web', '201.195.209.206', NULL),
(99, '\\core\\event\\role_capabilities_updated', 'core', 'updated', 'role_capabilities', 'role', 10, 'u', 0, 1, 10, 0, 2, 0, NULL, 0, 'N;', 1416169355, 'web', '201.195.209.206', NULL),
(100, '\\core\\event\\role_capabilities_updated', 'core', 'updated', 'role_capabilities', 'role', 9, 'u', 0, 1, 10, 0, 2, 0, NULL, 0, 'N;', 1416169394, 'web', '201.195.209.206', NULL),
(101, '\\core\\event\\user_loggedout', 'core', 'loggedout', 'user', 'user', 2, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:9:"sessionid";s:26:"4jplvt2hkq2uonnlr4lcanf1s6";}', 1416172518, 'web', '201.195.209.206', NULL),
(102, '\\core\\event\\user_password_updated', 'core', 'updated', 'user_password', NULL, NULL, 'u', 0, 22, 30, 3, 0, 0, 3, 0, 'a:1:{s:14:"forgottenreset";b:0;}', 1416172525, 'web', '201.195.209.206', NULL),
(103, '\\core\\event\\user_password_updated', 'core', 'updated', 'user_password', NULL, NULL, 'u', 0, 22, 30, 3, 0, 0, 3, 0, 'a:1:{s:14:"forgottenreset";b:0;}', 1416172525, 'web', '201.195.209.206', NULL),
(104, '\\core\\event\\user_loggedin', 'core', 'loggedin', 'user', 'user', 3, 'r', 0, 1, 10, 0, 3, 0, NULL, 0, 'a:1:{s:8:"username";s:5:"profe";}', 1416172525, 'web', '201.195.209.206', NULL),
(105, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 3, 1, NULL, 0, 'N;', 1416172526, 'web', '201.195.209.206', NULL),
(106, '\\core\\event\\blog_entries_viewed', 'core', 'viewed', 'blog_entries', NULL, NULL, 'r', 2, 1, 10, 0, 3, 0, NULL, 0, 'a:8:{s:7:"entryid";N;s:5:"tagid";N;s:6:"userid";N;s:5:"modid";N;s:7:"groupid";N;s:6:"search";N;s:9:"fromstart";i:0;s:8:"courseid";i:0;}', 1416172546, 'web', '201.195.209.206', NULL),
(107, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 3, 1, NULL, 0, 'N;', 1416172550, 'web', '201.195.209.206', NULL),
(108, '\\core\\event\\user_loggedout', 'core', 'loggedout', 'user', 'user', 3, 'r', 0, 1, 10, 0, 3, 0, NULL, 0, 'a:1:{s:9:"sessionid";s:26:"a8a07933ug83glinlemfem5f27";}', 1416172557, 'web', '201.195.209.206', NULL),
(109, '\\core\\event\\user_password_updated', 'core', 'updated', 'user_password', NULL, NULL, 'u', 0, 23, 30, 4, 0, 0, 4, 0, 'a:1:{s:14:"forgottenreset";b:0;}', 1416172563, 'web', '201.195.209.206', NULL),
(110, '\\core\\event\\user_password_updated', 'core', 'updated', 'user_password', NULL, NULL, 'u', 0, 23, 30, 4, 0, 0, 4, 0, 'a:1:{s:14:"forgottenreset";b:0;}', 1416172564, 'web', '201.195.209.206', NULL),
(111, '\\core\\event\\user_loggedin', 'core', 'loggedin', 'user', 'user', 4, 'r', 0, 1, 10, 0, 4, 0, NULL, 0, 'a:1:{s:8:"username";s:10:"estudiante";}', 1416172564, 'web', '201.195.209.206', NULL),
(112, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 4, 1, NULL, 0, 'N;', 1416172565, 'web', '201.195.209.206', NULL),
(113, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 16, 50, 2, 4, 2, NULL, 0, 'N;', 1416172581, 'web', '201.195.209.206', NULL),
(114, '\\mod_forum\\event\\course_module_viewed', 'mod_forum', 'viewed', 'course_module', 'forum', 1, 'r', 2, 21, 70, 1, 4, 2, NULL, 0, 'N;', 1416172614, 'web', '201.195.209.206', NULL),
(115, '\\mod_forum\\event\\course_module_viewed', 'mod_forum', 'viewed', 'course_module', 'forum', 1, 'r', 2, 21, 70, 1, 4, 2, NULL, 0, 'N;', 1416172632, 'web', '201.195.209.206', NULL),
(116, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 16, 50, 2, 4, 2, NULL, 0, 'N;', 1416172650, 'web', '201.195.209.206', NULL),
(117, '\\core\\event\\user_loggedout', 'core', 'loggedout', 'user', 'user', 4, 'r', 0, 1, 10, 0, 4, 0, NULL, 0, 'a:1:{s:9:"sessionid";s:26:"3igtttgjumuvpgt3ji3nsbec74";}', 1416172667, 'web', '201.195.209.206', NULL),
(118, '\\core\\event\\user_loggedin', 'core', 'loggedin', 'user', 'user', 2, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"username";s:5:"admin";}', 1416172677, 'web', '201.195.209.206', NULL),
(119, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 2, 1, NULL, 0, 'N;', 1416172680, 'web', '201.195.209.206', NULL),
(120, '\\core\\event\\user_loggedout', 'core', 'loggedout', 'user', 'user', 2, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:9:"sessionid";s:26:"nc1a5tr48tfhqsjnonnh9p5n66";}', 1416172908, 'web', '201.195.209.206', NULL),
(121, '\\core\\event\\user_loggedin', 'core', 'loggedin', 'user', 'user', 3, 'r', 0, 1, 10, 0, 3, 0, NULL, 0, 'a:1:{s:8:"username";s:5:"profe";}', 1416172925, 'web', '201.195.209.206', NULL),
(122, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 3, 1, NULL, 0, 'N;', 1416172926, 'web', '201.195.209.206', NULL),
(123, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 3, 1, NULL, 0, 'N;', 1416172938, 'web', '201.195.209.206', NULL),
(124, '\\core\\event\\user_loggedout', 'core', 'loggedout', 'user', 'user', 3, 'r', 0, 1, 10, 0, 3, 0, NULL, 0, 'a:1:{s:9:"sessionid";s:26:"4l8142ucc002752chpk2t25ih4";}', 1416173047, 'web', '201.195.209.206', NULL),
(125, '\\core\\event\\user_loggedin', 'core', 'loggedin', 'user', 'user', 2, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"username";s:5:"admin";}', 1416173058, 'web', '201.195.209.206', NULL),
(126, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 2, 1, NULL, 0, 'N;', 1416173059, 'web', '201.195.209.206', NULL),
(127, '\\core\\event\\blog_entries_viewed', 'core', 'viewed', 'blog_entries', NULL, NULL, 'r', 2, 1, 10, 0, 2, 0, NULL, 0, 'a:8:{s:7:"entryid";N;s:5:"tagid";N;s:6:"userid";N;s:5:"modid";N;s:7:"groupid";N;s:6:"search";N;s:9:"fromstart";i:0;s:8:"courseid";i:0;}', 1416173087, 'web', '201.195.209.206', NULL),
(128, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 16, 50, 2, 2, 2, NULL, 0, 'N;', 1416173173, 'web', '201.195.209.206', NULL),
(129, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 16, 50, 2, 2, 2, NULL, 0, 'N;', 1416173184, 'web', '201.195.209.206', NULL),
(130, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 2, 1, NULL, 0, 'N;', 1416173230, 'web', '201.195.209.206', NULL),
(131, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 16, 50, 2, 2, 2, NULL, 0, 'N;', 1416173233, 'web', '201.195.209.206', NULL),
(132, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 16, 50, 2, 2, 2, NULL, 0, 'N;', 1416173239, 'web', '201.195.209.206', NULL),
(133, '\\core\\event\\user_loggedout', 'core', 'loggedout', 'user', 'user', 2, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:9:"sessionid";s:26:"9tp17a877734ld83gmb8q0uc94";}', 1416174363, 'web', '201.195.209.206', NULL),
(134, '\\core\\event\\user_login_failed', 'core', 'failed', 'user_login', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:2:{s:8:"username";s:5:"admin";s:6:"reason";i:3;}', 1416178375, 'web', '201.195.209.206', NULL),
(135, '\\core\\event\\user_loggedin', 'core', 'loggedin', 'user', 'user', 2, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"username";s:5:"admin";}', 1416178387, 'web', '201.195.209.206', NULL),
(136, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 2, 1, NULL, 0, 'N;', 1416178390, 'web', '201.195.209.206', NULL),
(137, '\\core\\event\\user_login_failed', 'core', 'failed', 'user_login', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:2:{s:8:"username";s:5:"admin";s:6:"reason";i:3;}', 1416178814, 'web', '201.195.209.206', NULL),
(138, '\\core\\event\\user_login_failed', 'core', 'failed', 'user_login', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:2:{s:8:"username";s:5:"admin";s:6:"reason";i:3;}', 1416178821, 'web', '201.195.209.206', NULL),
(139, '\\core\\event\\user_loggedin', 'core', 'loggedin', 'user', 'user', 2, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"username";s:5:"admin";}', 1416178830, 'web', '201.195.209.206', NULL),
(140, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 2, 1, NULL, 0, 'N;', 1416178831, 'web', '201.195.209.206', NULL),
(141, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 2, 1, NULL, 0, 'N;', 1416178873, 'web', '201.195.209.206', NULL),
(142, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 16, 50, 2, 2, 2, NULL, 0, 'N;', 1416179055, 'web', '201.195.209.206', NULL),
(143, '\\core\\event\\user_loggedout', 'core', 'loggedout', 'user', 'user', 2, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:9:"sessionid";s:26:"u62ock1uvmr5cq26ch3pppcf54";}', 1416179059, 'web', '201.195.209.206', NULL),
(144, '\\core\\event\\user_loggedin', 'core', 'loggedin', 'user', 'user', 2, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"username";s:5:"admin";}', 1417663658, 'web', '201.195.217.90', NULL),
(145, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 2, 1, NULL, 0, 'N;', 1417663662, 'web', '201.195.217.90', NULL),
(146, '\\core\\event\\user_password_updated', 'core', 'updated', 'user_password', NULL, NULL, 'u', 0, 24, 30, 5, 2, 0, 5, 0, 'a:1:{s:14:"forgottenreset";b:0;}', 1417667255, 'web', '201.195.217.90', NULL),
(147, '\\core\\event\\user_created', 'core', 'created', 'user', 'user', 5, 'c', 0, 24, 30, 5, 2, 0, 5, 0, 'N;', 1417667259, 'web', '201.195.217.90', NULL),
(148, '\\core\\event\\user_list_viewed', 'core', 'viewed', 'user_list', 'course', 1, 'r', 0, 2, 50, 1, 2, 1, NULL, 0, 'a:2:{s:15:"courseshortname";s:15:"Capacita Online";s:14:"coursefullname";s:15:"Capacita Online";}', 1417667422, 'web', '201.195.217.90', NULL),
(149, '\\core\\event\\email_failed', 'core', 'failed', 'email', NULL, NULL, 'c', 0, 1, 10, 0, 2, 0, 5, 0, 'a:3:{s:7:"subject";s:29:"Mensaje nuevo de (Admin User)";s:7:"message";s:229:"hola\n\n\n---------------------------------------------------------------------\nÉsta es una copia del mensaje que se le ha enviado en "Capacita Online". Vaya a http://capacita.co/moodle/message/index.php?user=5&id=2 para contestar.";s:9:"errorinfo";s:30:"SMTP Error: data not accepted.";}', 1417667590, 'web', '201.195.217.90', NULL),
(150, '\\core\\event\\message_sent', 'core', 'sent', 'message', NULL, NULL, 'c', 0, 1, 10, 0, 2, 0, 5, 0, 'a:1:{s:9:"messageid";b:0;}', 1417667590, 'web', '201.195.217.90', NULL),
(151, '\\core\\event\\user_list_viewed', 'core', 'viewed', 'user_list', 'course', 1, 'r', 0, 2, 50, 1, 2, 1, NULL, 0, 'a:2:{s:15:"courseshortname";s:15:"Capacita Online";s:14:"coursefullname";s:15:"Capacita Online";}', 1417667689, 'web', '201.195.217.90', NULL),
(152, '\\core\\event\\user_profile_viewed', 'core', 'viewed', 'user_profile', 'user', 5, 'r', 0, 24, 30, 5, 2, 0, 5, 0, 'N;', 1417667693, 'web', '201.195.217.90', NULL),
(153, '\\core\\event\\email_failed', 'core', 'failed', 'email', NULL, NULL, 'c', 0, 1, 10, 0, 2, 0, 5, 0, 'a:3:{s:7:"subject";s:29:"Mensaje nuevo de (Admin User)";s:7:"message";s:228:"hola\n\n---------------------------------------------------------------------\nÉsta es una copia del mensaje que se le ha enviado en "Capacita Online". Vaya a http://capacita.co/moodle/message/index.php?user=5&id=2 para contestar.";s:9:"errorinfo";s:30:"SMTP Error: data not accepted.";}', 1417667704, 'web', '201.195.217.90', NULL),
(154, '\\core\\event\\message_sent', 'core', 'sent', 'message', NULL, NULL, 'c', 0, 1, 10, 0, 2, 0, 5, 0, 'a:1:{s:9:"messageid";b:0;}', 1417667704, 'web', '201.195.217.90', NULL),
(155, '\\core\\event\\user_list_viewed', 'core', 'viewed', 'user_list', 'course', 1, 'r', 0, 2, 50, 1, 2, 1, NULL, 0, 'a:2:{s:15:"courseshortname";s:15:"Capacita Online";s:14:"coursefullname";s:15:"Capacita Online";}', 1417667723, 'web', '201.195.217.90', NULL),
(156, '\\core\\event\\email_failed', 'core', 'failed', 'email', NULL, NULL, 'c', 0, 1, 10, 0, 2, 0, 5, 0, 'a:3:{s:7:"subject";s:29:"Mensaje nuevo de (Admin User)";s:7:"message";s:235:"hola mundo\n\n\n---------------------------------------------------------------------\nÉsta es una copia del mensaje que se le ha enviado en "Capacita Online". Vaya a http://capacita.co/moodle/message/index.php?user=5&id=2 para contestar.";s:9:"errorinfo";s:30:"SMTP Error: data not accepted.";}', 1417667744, 'web', '201.195.217.90', NULL),
(157, '\\core\\event\\message_sent', 'core', 'sent', 'message', NULL, NULL, 'c', 0, 1, 10, 0, 2, 0, 5, 0, 'a:1:{s:9:"messageid";b:0;}', 1417667744, 'web', '201.195.217.90', NULL),
(158, '\\core\\event\\user_loggedin', 'core', 'loggedin', 'user', 'user', 2, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"username";s:5:"admin";}', 1417870746, 'web', '201.195.209.206', NULL),
(159, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 2, 1, NULL, 0, 'N;', 1417870749, 'web', '201.195.209.206', NULL),
(160, '\\core\\event\\user_loggedout', 'core', 'loggedout', 'user', 'user', 2, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:9:"sessionid";s:26:"hmpah4bsrm66jqhan8qlvupsd1";}', 1417872441, 'web', '201.195.209.206', NULL),
(161, '\\core\\event\\user_loggedin', 'core', 'loggedin', 'user', 'user', 2, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"username";s:5:"admin";}', 1418101546, 'web', '201.195.217.90', NULL),
(162, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 2, 1, NULL, 0, 'N;', 1418101552, 'web', '201.195.217.90', NULL),
(163, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 2, 1, NULL, 0, 'N;', 1418101569, 'web', '201.195.217.90', NULL),
(164, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 2, 1, NULL, 0, 'N;', 1418102015, 'web', '201.195.217.90', NULL),
(165, '\\core\\event\\user_loggedin', 'core', 'loggedin', 'user', 'user', 2, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"username";s:5:"admin";}', 1418134167, 'web', '186.177.163.99', NULL),
(166, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 2, 1, NULL, 0, 'N;', 1418134171, 'web', '186.177.163.99', NULL),
(167, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 16, 50, 2, 2, 2, NULL, 0, 'N;', 1418134184, 'web', '186.177.163.99', NULL),
(168, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 16, 50, 2, 2, 2, NULL, 0, 'N;', 1418134201, 'web', '186.177.163.99', NULL),
(169, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 2, 1, NULL, 0, 'N;', 1418138297, 'web', '186.177.163.99', NULL),
(170, '\\core\\event\\user_loggedout', 'core', 'loggedout', 'user', 'user', 2, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:9:"sessionid";s:26:"he7edd39tc8lg3u83u7jl8ork4";}', 1418138302, 'web', '186.177.163.99', NULL),
(171, '\\core\\event\\user_password_updated', 'core', 'updated', 'user_password', NULL, NULL, 'u', 0, 22, 30, 3, 0, 0, 3, 0, 'a:1:{s:14:"forgottenreset";b:0;}', 1418138313, 'web', '186.177.163.99', NULL),
(172, '\\core\\event\\user_password_updated', 'core', 'updated', 'user_password', NULL, NULL, 'u', 0, 22, 30, 3, 0, 0, 3, 0, 'a:1:{s:14:"forgottenreset";b:0;}', 1418138313, 'web', '186.177.163.99', NULL),
(173, '\\core\\event\\user_loggedin', 'core', 'loggedin', 'user', 'user', 3, 'r', 0, 1, 10, 0, 3, 0, NULL, 0, 'a:1:{s:8:"username";s:5:"profe";}', 1418138313, 'web', '186.177.163.99', NULL),
(174, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 3, 1, NULL, 0, 'N;', 1418138315, 'web', '186.177.163.99', NULL),
(175, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 3, 1, NULL, 0, 'N;', 1418138346, 'web', '186.177.163.99', NULL),
(176, '\\core\\event\\user_password_updated', 'core', 'updated', 'user_password', NULL, NULL, 'u', 0, 23, 30, 4, 0, 0, 4, 0, 'a:1:{s:14:"forgottenreset";b:0;}', 1418138563, 'web', '186.177.163.99', NULL),
(177, '\\core\\event\\user_password_updated', 'core', 'updated', 'user_password', NULL, NULL, 'u', 0, 23, 30, 4, 0, 0, 4, 0, 'a:1:{s:14:"forgottenreset";b:0;}', 1418138563, 'web', '186.177.163.99', NULL),
(178, '\\core\\event\\user_loggedin', 'core', 'loggedin', 'user', 'user', 4, 'r', 0, 1, 10, 0, 4, 0, NULL, 0, 'a:1:{s:8:"username";s:10:"estudiante";}', 1418138564, 'web', '186.177.163.99', NULL),
(179, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 4, 1, NULL, 0, 'N;', 1418138566, 'web', '186.177.163.99', NULL),
(180, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 16, 50, 2, 4, 2, NULL, 0, 'N;', 1418138742, 'web', '186.177.163.99', NULL),
(181, '\\core\\event\\user_profile_viewed', 'core', 'viewed', 'user_profile', 'user', 4, 'r', 0, 16, 50, 2, 4, 2, 4, 0, 'a:3:{s:8:"courseid";s:1:"2";s:15:"courseshortname";s:5:"CP-01";s:14:"coursefullname";s:22:"Curso de prueba online";}', 1418138781, 'web', '186.177.163.99', NULL),
(182, '\\core\\event\\user_profile_viewed', 'core', 'viewed', 'user_profile', 'user', 4, 'r', 0, 23, 30, 4, 4, 0, 4, 0, 'N;', 1418139014, 'web', '186.177.163.99', NULL),
(183, '\\core\\event\\user_profile_viewed', 'core', 'viewed', 'user_profile', 'user', 4, 'r', 0, 23, 30, 4, 4, 0, 4, 0, 'N;', 1418139026, 'web', '186.177.163.99', NULL),
(184, '\\core\\event\\user_profile_viewed', 'core', 'viewed', 'user_profile', 'user', 4, 'r', 0, 23, 30, 4, 4, 0, 4, 0, 'N;', 1418139061, 'web', '186.177.163.99', NULL),
(185, '\\core\\event\\user_profile_viewed', 'core', 'viewed', 'user_profile', 'user', 4, 'r', 0, 23, 30, 4, 4, 0, 4, 0, 'N;', 1418139081, 'web', '186.177.163.99', NULL),
(186, '\\core\\event\\user_profile_viewed', 'core', 'viewed', 'user_profile', 'user', 4, 'r', 0, 23, 30, 4, 4, 0, 4, 0, 'N;', 1418139082, 'web', '186.177.163.99', NULL),
(187, '\\core\\event\\user_loggedout', 'core', 'loggedout', 'user', 'user', 3, 'r', 0, 1, 10, 0, 3, 0, NULL, 0, 'a:1:{s:9:"sessionid";s:26:"t7245f1el3qun76r5tr002hs06";}', 1418139127, 'web', '186.177.163.99', NULL),
(188, '\\core\\event\\user_loggedin', 'core', 'loggedin', 'user', 'user', 2, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"username";s:5:"admin";}', 1418178340, 'web', '201.195.209.206', NULL),
(189, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 2, 1, NULL, 0, 'N;', 1418178343, 'web', '201.195.209.206', NULL),
(190, '\\core\\event\\role_capabilities_updated', 'core', 'updated', 'role_capabilities', 'role', 10, 'u', 0, 1, 10, 0, 2, 0, NULL, 0, 'N;', 1418178534, 'web', '201.195.209.206', NULL),
(191, '\\core\\event\\user_loggedin', 'core', 'loggedin', 'user', 'user', 4, 'r', 0, 1, 10, 0, 4, 0, NULL, 0, 'a:1:{s:8:"username";s:10:"estudiante";}', 1418178571, 'web', '201.195.209.206', NULL),
(192, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 4, 1, NULL, 0, 'N;', 1418178572, 'web', '201.195.209.206', NULL),
(193, '\\core\\event\\role_capabilities_updated', 'core', 'updated', 'role_capabilities', 'role', 10, 'u', 0, 1, 10, 0, 2, 0, NULL, 0, 'N;', 1418178729, 'web', '201.195.209.206', NULL),
(194, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 4, 1, NULL, 0, 'N;', 1418178770, 'web', '201.195.209.206', NULL),
(195, '\\core\\event\\user_loggedin', 'core', 'loggedin', 'user', 'user', 2, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"username";s:5:"admin";}', 1418225792, 'web', '163.178.208.16', NULL),
(196, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 2, 1, NULL, 0, 'N;', 1418225796, 'web', '163.178.208.16', NULL),
(197, '\\core\\event\\role_capabilities_updated', 'core', 'updated', 'role_capabilities', 'role', 10, 'u', 0, 1, 10, 0, 2, 0, NULL, 0, 'N;', 1418226823, 'web', '163.178.208.16', NULL),
(198, '\\core\\event\\user_loggedout', 'core', 'loggedout', 'user', 'user', 2, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:9:"sessionid";s:26:"u04kg3ilrss5a3d0d16je35gu3";}', 1418226878, 'web', '163.178.208.16', NULL),
(199, '\\core\\event\\user_loggedin', 'core', 'loggedin', 'user', 'user', 4, 'r', 0, 1, 10, 0, 4, 0, NULL, 0, 'a:1:{s:8:"username";s:10:"estudiante";}', 1418226891, 'web', '163.178.208.16', NULL),
(200, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 4, 1, NULL, 0, 'N;', 1418226895, 'web', '163.178.208.16', NULL),
(201, '\\core\\event\\user_profile_viewed', 'core', 'viewed', 'user_profile', 'user', 4, 'r', 0, 23, 30, 4, 4, 0, 4, 0, 'N;', 1418226940, 'web', '163.178.208.16', NULL),
(202, '\\core\\event\\user_profile_viewed', 'core', 'viewed', 'user_profile', 'user', 4, 'r', 0, 23, 30, 4, 4, 0, 4, 0, 'N;', 1418226964, 'web', '163.178.208.16', NULL),
(203, '\\core\\event\\user_loggedout', 'core', 'loggedout', 'user', 'user', 4, 'r', 0, 1, 10, 0, 4, 0, NULL, 0, 'a:1:{s:9:"sessionid";s:26:"rm3bmq5keg9u3b8mu34d460de5";}', 1418227374, 'web', '163.178.208.16', NULL),
(204, '\\core\\event\\user_loggedin', 'core', 'loggedin', 'user', 'user', 2, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"username";s:5:"admin";}', 1418227396, 'web', '163.178.208.16', NULL),
(205, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 2, 1, NULL, 0, 'N;', 1418227398, 'web', '163.178.208.16', NULL),
(206, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 2, 1, NULL, 0, 'N;', 1418227992, 'web', '163.178.208.16', NULL),
(207, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 16, 50, 2, 2, 2, NULL, 0, 'N;', 1418227998, 'web', '163.178.208.16', NULL),
(208, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 2, 1, NULL, 0, 'N;', 1418228003, 'web', '163.178.208.16', NULL),
(209, '\\core\\event\\role_capabilities_updated', 'core', 'updated', 'role_capabilities', 'role', 10, 'u', 0, 1, 10, 0, 2, 0, NULL, 0, 'N;', 1418228288, 'web', '163.178.208.16', NULL),
(210, '\\core\\event\\user_loggedout', 'core', 'loggedout', 'user', 'user', 2, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:9:"sessionid";s:26:"56vq831trjjqrqicms98regv11";}', 1418228292, 'web', '163.178.208.16', NULL),
(211, '\\core\\event\\user_loggedin', 'core', 'loggedin', 'user', 'user', 4, 'r', 0, 1, 10, 0, 4, 0, NULL, 0, 'a:1:{s:8:"username";s:10:"estudiante";}', 1418228301, 'web', '163.178.208.16', NULL),
(212, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 4, 1, NULL, 0, 'N;', 1418228302, 'web', '163.178.208.16', NULL),
(213, '\\core\\event\\user_loggedout', 'core', 'loggedout', 'user', 'user', 4, 'r', 0, 1, 10, 0, 4, 0, NULL, 0, 'a:1:{s:9:"sessionid";s:26:"fo2fbb686r72gjr6pp2hh6aql2";}', 1418228319, 'web', '163.178.208.16', NULL),
(214, '\\core\\event\\user_loggedin', 'core', 'loggedin', 'user', 'user', 2, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"username";s:5:"admin";}', 1418228328, 'web', '163.178.208.16', NULL),
(215, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 2, 1, NULL, 0, 'N;', 1418228329, 'web', '163.178.208.16', NULL),
(216, '\\core\\event\\role_capabilities_updated', 'core', 'updated', 'role_capabilities', 'role', 10, 'u', 0, 1, 10, 0, 2, 0, NULL, 0, 'N;', 1418228367, 'web', '163.178.208.16', NULL),
(217, '\\core\\event\\role_capabilities_updated', 'core', 'updated', 'role_capabilities', 'role', 10, 'u', 0, 1, 10, 0, 2, 0, NULL, 0, 'N;', 1418228394, 'web', '163.178.208.16', NULL),
(218, '\\core\\event\\role_capabilities_updated', 'core', 'updated', 'role_capabilities', 'role', 10, 'u', 0, 1, 10, 0, 2, 0, NULL, 0, 'N;', 1418228425, 'web', '163.178.208.16', NULL),
(219, '\\core\\event\\user_loggedout', 'core', 'loggedout', 'user', 'user', 2, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:9:"sessionid";s:26:"g10cd7q5i1bmgfr2inerivomd0";}', 1418229541, 'web', '163.178.208.16', NULL),
(220, '\\core\\event\\user_loggedin', 'core', 'loggedin', 'user', 'user', 4, 'r', 0, 1, 10, 0, 4, 0, NULL, 0, 'a:1:{s:8:"username";s:10:"estudiante";}', 1418229549, 'web', '163.178.208.16', NULL),
(221, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 4, 1, NULL, 0, 'N;', 1418229550, 'web', '163.178.208.16', NULL),
(222, '\\core\\event\\user_profile_viewed', 'core', 'viewed', 'user_profile', 'user', 4, 'r', 0, 23, 30, 4, 4, 0, 4, 0, 'N;', 1418229561, 'web', '163.178.208.16', NULL),
(223, '\\core\\event\\user_loggedout', 'core', 'loggedout', 'user', 'user', 4, 'r', 0, 1, 10, 0, 4, 0, NULL, 0, 'a:1:{s:9:"sessionid";s:26:"ith0o7hhhpep73psp8b2d0qfu1";}', 1418229591, 'web', '163.178.208.16', NULL),
(224, '\\core\\event\\user_loggedin', 'core', 'loggedin', 'user', 'user', 2, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"username";s:5:"admin";}', 1418229617, 'web', '163.178.208.16', NULL),
(225, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 2, 1, NULL, 0, 'N;', 1418229618, 'web', '163.178.208.16', NULL),
(226, '\\core\\event\\user_loggedout', 'core', 'loggedout', 'user', 'user', 2, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:9:"sessionid";s:26:"13eto94qujqa9h4obdh2a30eo2";}', 1418229785, 'web', '163.178.208.16', NULL),
(227, '\\core\\event\\user_loggedin', 'core', 'loggedin', 'user', 'user', 4, 'r', 0, 1, 10, 0, 4, 0, NULL, 0, 'a:1:{s:8:"username";s:10:"estudiante";}', 1418229793, 'web', '163.178.208.16', NULL),
(228, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 4, 1, NULL, 0, 'N;', 1418229794, 'web', '163.178.208.16', NULL),
(229, '\\core\\event\\user_loggedout', 'core', 'loggedout', 'user', 'user', 4, 'r', 0, 1, 10, 0, 4, 0, NULL, 0, 'a:1:{s:9:"sessionid";s:26:"93huiqils555jrnt2k76iu0sm7";}', 1418229851, 'web', '163.178.208.16', NULL),
(230, '\\core\\event\\user_loggedin', 'core', 'loggedin', 'user', 'user', 2, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"username";s:5:"admin";}', 1418229862, 'web', '163.178.208.16', NULL),
(231, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 2, 1, NULL, 0, 'N;', 1418229863, 'web', '163.178.208.16', NULL),
(232, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 16, 50, 2, 2, 2, NULL, 0, 'N;', 1418229877, 'web', '163.178.208.16', NULL),
(233, '\\core\\event\\course_updated', 'core', 'updated', 'course', 'course', 2, 'u', 1, 16, 50, 2, 2, 2, NULL, 0, 'a:2:{s:9:"shortname";s:5:"CP-01";s:8:"fullname";s:22:"Curso de prueba online";}', 1418230004, 'web', '163.178.208.16', NULL),
(234, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 16, 50, 2, 2, 2, NULL, 0, 'N;', 1418230005, 'web', '163.178.208.16', NULL),
(235, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 16, 50, 2, 2, 2, NULL, 0, 'N;', 1418230045, 'web', '163.178.208.16', NULL),
(236, '\\core\\event\\course_module_created', 'core', 'created', 'course_module', 'course_modules', 2, 'c', 1, 25, 70, 2, 2, 2, NULL, 0, 'a:3:{s:10:"modulename";s:6:"lesson";s:10:"instanceid";s:1:"1";s:4:"name";s:11:"Lección 01";}', 1418230163, 'web', '163.178.208.16', NULL),
(237, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 16, 50, 2, 2, 2, NULL, 0, 'N;', 1418230164, 'web', '163.178.208.16', NULL),
(238, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 16, 50, 2, 2, 2, NULL, 0, 'N;', 1418230193, 'web', '163.178.208.16', NULL),
(239, '\\core\\event\\course_module_deleted', 'core', 'deleted', 'course_module', 'course_modules', 2, 'd', 1, 25, 70, 2, 2, 2, NULL, 0, 'a:2:{s:10:"modulename";s:6:"lesson";s:10:"instanceid";s:1:"1";}', 1418230206, 'web', '163.178.208.16', NULL),
(240, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 16, 50, 2, 2, 2, NULL, 0, 'N;', 1418230264, 'web', '163.178.208.16', NULL),
(241, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 16, 50, 2, 2, 2, NULL, 0, 'N;', 1418230270, 'web', '163.178.208.16', NULL),
(242, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 16, 50, 2, 2, 2, NULL, 0, 'N;', 1418230340, 'web', '163.178.208.16', NULL),
(243, '\\core\\event\\course_section_updated', 'core', 'updated', 'course_section', 'course_sections', 4, 'u', 1, 16, 50, 2, 2, 2, NULL, 0, 'a:1:{s:10:"sectionnum";s:1:"1";}', 1418230382, 'web', '163.178.208.16', NULL),
(244, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 16, 50, 2, 2, 2, NULL, 0, 'N;', 1418230383, 'web', '163.178.208.16', NULL),
(245, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 16, 50, 2, 2, 2, NULL, 0, 'N;', 1418230668, 'web', '163.178.208.16', NULL),
(246, '\\core\\event\\role_capabilities_updated', 'core', 'updated', 'role_capabilities', 'role', 7, 'u', 0, 1, 10, 0, 2, 0, NULL, 0, 'N;', 1418231124, 'web', '163.178.208.16', NULL),
(247, '\\core\\event\\role_capabilities_updated', 'core', 'updated', 'role_capabilities', 'role', 5, 'u', 0, 1, 10, 0, 2, 0, NULL, 0, 'N;', 1418231154, 'web', '163.178.208.16', NULL),
(248, '\\core\\event\\user_loggedout', 'core', 'loggedout', 'user', 'user', 2, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:9:"sessionid";s:26:"pv25oaktk37busrt0mnjsm9m03";}', 1418231167, 'web', '163.178.208.16', NULL),
(249, '\\core\\event\\user_loggedin', 'core', 'loggedin', 'user', 'user', 4, 'r', 0, 1, 10, 0, 4, 0, NULL, 0, 'a:1:{s:8:"username";s:10:"estudiante";}', 1418231183, 'web', '163.178.208.16', NULL),
(250, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 4, 1, NULL, 0, 'N;', 1418231183, 'web', '163.178.208.16', NULL),
(251, '\\core\\event\\user_loggedout', 'core', 'loggedout', 'user', 'user', 4, 'r', 0, 1, 10, 0, 4, 0, NULL, 0, 'a:1:{s:9:"sessionid";s:26:"ll684ugb0c954e29ba84vc4mg0";}', 1418231217, 'web', '163.178.208.16', NULL),
(252, '\\core\\event\\user_loggedin', 'core', 'loggedin', 'user', 'user', 2, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"username";s:5:"admin";}', 1418231228, 'web', '163.178.208.16', NULL),
(253, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 2, 1, NULL, 0, 'N;', 1418231231, 'web', '163.178.208.16', NULL),
(254, '\\core\\event\\user_loggedout', 'core', 'loggedout', 'user', 'user', 2, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:9:"sessionid";s:26:"c8c11ko3ng8j1a3fn2rm38i2q4";}', 1418231254, 'web', '163.178.208.16', NULL),
(255, '\\core\\event\\user_loggedin', 'core', 'loggedin', 'user', 'user', 4, 'r', 0, 1, 10, 0, 4, 0, NULL, 0, 'a:1:{s:8:"username";s:10:"estudiante";}', 1418231265, 'web', '163.178.208.16', NULL),
(256, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 4, 1, NULL, 0, 'N;', 1418231266, 'web', '163.178.208.16', NULL),
(257, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 4, 1, NULL, 0, 'N;', 1418231283, 'web', '163.178.208.16', NULL),
(258, '\\core\\event\\user_loggedout', 'core', 'loggedout', 'user', 'user', 4, 'r', 0, 1, 10, 0, 4, 0, NULL, 0, 'a:1:{s:9:"sessionid";s:26:"6lt17qdsdi6gc4pc1hu1u09lb5";}', 1418231305, 'web', '163.178.208.16', NULL),
(259, '\\core\\event\\user_login_failed', 'core', 'failed', 'user_login', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:2:{s:8:"username";s:5:"admin";s:6:"reason";i:3;}', 1418231318, 'web', '163.178.208.16', NULL),
(260, '\\core\\event\\user_loggedin', 'core', 'loggedin', 'user', 'user', 2, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"username";s:5:"admin";}', 1418231329, 'web', '163.178.208.16', NULL),
(261, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 2, 1, NULL, 0, 'N;', 1418231329, 'web', '163.178.208.16', NULL),
(262, '\\core\\event\\user_loggedout', 'core', 'loggedout', 'user', 'user', 2, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:9:"sessionid";s:26:"lr7odgnm0jenel6k14jjpjsd05";}', 1418231440, 'web', '163.178.208.16', NULL),
(263, '\\core\\event\\user_loggedin', 'core', 'loggedin', 'user', 'user', 3, 'r', 0, 1, 10, 0, 3, 0, NULL, 0, 'a:1:{s:8:"username";s:5:"profe";}', 1418231448, 'web', '163.178.208.16', NULL);
INSERT INTO `mdl_logstore_standard_log` (`id`, `eventname`, `component`, `action`, `target`, `objecttable`, `objectid`, `crud`, `edulevel`, `contextid`, `contextlevel`, `contextinstanceid`, `userid`, `courseid`, `relateduserid`, `anonymous`, `other`, `timecreated`, `origin`, `ip`, `realuserid`) VALUES
(264, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 3, 1, NULL, 0, 'N;', 1418231449, 'web', '163.178.208.16', NULL),
(265, '\\core\\event\\user_loggedout', 'core', 'loggedout', 'user', 'user', 3, 'r', 0, 1, 10, 0, 3, 0, NULL, 0, 'a:1:{s:9:"sessionid";s:26:"hp64kav8gnk168vrf4101v8eh3";}', 1418231634, 'web', '163.178.208.16', NULL),
(266, '\\core\\event\\user_loggedin', 'core', 'loggedin', 'user', 'user', 2, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"username";s:5:"admin";}', 1418232647, 'web', '163.178.208.16', NULL),
(267, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 2, 1, NULL, 0, 'N;', 1418232650, 'web', '163.178.208.16', NULL),
(268, '\\core\\event\\role_capabilities_updated', 'core', 'updated', 'role_capabilities', 'role', 7, 'u', 0, 1, 10, 0, 2, 0, NULL, 0, 'N;', 1418232744, 'web', '163.178.208.16', NULL),
(269, '\\core\\event\\user_loggedout', 'core', 'loggedout', 'user', 'user', 2, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:9:"sessionid";s:26:"gfgfgv28k8fi00makscajn2a17";}', 1418232801, 'web', '163.178.208.16', NULL),
(270, '\\core\\event\\user_loggedin', 'core', 'loggedin', 'user', 'user', 4, 'r', 0, 1, 10, 0, 4, 0, NULL, 0, 'a:1:{s:8:"username";s:10:"estudiante";}', 1418232815, 'web', '163.178.208.16', NULL),
(271, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 4, 1, NULL, 0, 'N;', 1418232816, 'web', '163.178.208.16', NULL),
(272, '\\core\\event\\user_loggedout', 'core', 'loggedout', 'user', 'user', 4, 'r', 0, 1, 10, 0, 4, 0, NULL, 0, 'a:1:{s:9:"sessionid";s:26:"7jaltg55g7u1d6hjbab60d69i7";}', 1418232826, 'web', '163.178.208.16', NULL),
(273, '\\core\\event\\user_loggedin', 'core', 'loggedin', 'user', 'user', 2, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"username";s:5:"admin";}', 1418232835, 'web', '163.178.208.16', NULL),
(274, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 2, 1, NULL, 0, 'N;', 1418232836, 'web', '163.178.208.16', NULL),
(275, '\\core\\event\\role_capabilities_updated', 'core', 'updated', 'role_capabilities', 'role', 5, 'u', 0, 1, 10, 0, 2, 0, NULL, 0, 'N;', 1418232917, 'web', '163.178.208.16', NULL),
(276, '\\core\\event\\user_loggedout', 'core', 'loggedout', 'user', 'user', 2, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:9:"sessionid";s:26:"ptt9gdhlhq3q7irlmmj14h9vu7";}', 1418232952, 'web', '163.178.208.16', NULL),
(277, '\\core\\event\\user_loggedin', 'core', 'loggedin', 'user', 'user', 4, 'r', 0, 1, 10, 0, 4, 0, NULL, 0, 'a:1:{s:8:"username";s:10:"estudiante";}', 1418232961, 'web', '163.178.208.16', NULL),
(278, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 4, 1, NULL, 0, 'N;', 1418232962, 'web', '163.178.208.16', NULL),
(279, '\\core\\event\\user_loggedout', 'core', 'loggedout', 'user', 'user', 4, 'r', 0, 1, 10, 0, 4, 0, NULL, 0, 'a:1:{s:9:"sessionid";s:26:"ecmovvtu700ne5das63rg5fbs6";}', 1418233118, 'web', '163.178.208.16', NULL),
(280, '\\core\\event\\user_loggedin', 'core', 'loggedin', 'user', 'user', 2, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"username";s:5:"admin";}', 1418233131, 'web', '163.178.208.16', NULL),
(281, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 2, 1, NULL, 0, 'N;', 1418233131, 'web', '163.178.208.16', NULL),
(282, '\\core\\event\\role_capabilities_updated', 'core', 'updated', 'role_capabilities', 'role', 5, 'u', 0, 1, 10, 0, 2, 0, NULL, 0, 'N;', 1418233227, 'web', '163.178.208.16', NULL),
(283, '\\core\\event\\role_capabilities_updated', 'core', 'updated', 'role_capabilities', 'role', 7, 'u', 0, 1, 10, 0, 2, 0, NULL, 0, 'N;', 1418233258, 'web', '163.178.208.16', NULL),
(284, '\\core\\event\\user_loggedout', 'core', 'loggedout', 'user', 'user', 2, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:9:"sessionid";s:26:"25rg7mf38foadna14urmsvshj3";}', 1418234237, 'web', '163.178.208.16', NULL),
(285, '\\core\\event\\user_loggedin', 'core', 'loggedin', 'user', 'user', 2, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"username";s:5:"admin";}', 1419009674, 'web', '201.195.209.206', NULL),
(286, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 2, 1, NULL, 0, 'N;', 1419009678, 'web', '201.195.209.206', NULL),
(287, '\\core\\event\\user_loggedin', 'core', 'loggedin', 'user', 'user', 2, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"username";s:5:"admin";}', 1419009928, 'web', '201.195.209.206', NULL),
(288, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 2, 1, NULL, 0, 'N;', 1419009929, 'web', '201.195.209.206', NULL),
(289, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 2, 1, NULL, 0, 'N;', 1419011039, 'web', '201.195.209.206', NULL),
(290, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 2, 1, NULL, 0, 'N;', 1419011039, 'web', '201.195.209.206', NULL),
(291, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 2, 1, NULL, 0, 'N;', 1419011138, 'web', '201.195.209.206', NULL),
(292, '\\core\\event\\user_loggedout', 'core', 'loggedout', 'user', 'user', 2, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:9:"sessionid";s:26:"3j9o0bimen7ro5n1b8vvl948q6";}', 1419011156, 'web', '201.195.209.206', NULL),
(293, '\\core\\event\\user_loggedin', 'core', 'loggedin', 'user', 'user', 2, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"username";s:5:"admin";}', 1419011167, 'web', '201.195.209.206', NULL),
(294, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 2, 1, NULL, 0, 'N;', 1419011168, 'web', '201.195.209.206', NULL),
(295, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 2, 1, NULL, 0, 'N;', 1419011190, 'web', '201.195.209.206', NULL),
(296, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 2, 1, NULL, 0, 'N;', 1419011197, 'web', '201.195.209.206', NULL),
(297, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 2, 1, NULL, 0, 'N;', 1419011672, 'web', '201.195.209.206', NULL),
(298, '\\core\\event\\user_loggedout', 'core', 'loggedout', 'user', 'user', 2, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:9:"sessionid";s:26:"vq9o3ar03i2ru78f71nl1g5sp5";}', 1419011747, 'web', '201.195.209.206', NULL),
(299, '\\core\\event\\user_loggedin', 'core', 'loggedin', 'user', 'user', 2, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"username";s:5:"admin";}', 1419698194, 'web', '201.195.217.90', NULL),
(300, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 2, 1, NULL, 0, 'N;', 1419698197, 'web', '201.195.217.90', NULL),
(301, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 16, 50, 2, 2, 2, NULL, 0, 'N;', 1419698212, 'web', '201.195.217.90', NULL),
(302, '\\core\\event\\question_category_created', 'core', 'created', 'question_category', 'question_categories', 5, 'c', 1, 16, 50, 2, 2, 2, NULL, 0, 'N;', 1419698808, 'web', '201.195.217.90', NULL),
(303, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 2, 1, NULL, 0, 'N;', 1419699630, 'web', '201.195.217.90', NULL),
(304, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 16, 50, 2, 2, 2, NULL, 0, 'N;', 1419704138, 'web', '201.195.217.90', NULL),
(305, '\\core\\event\\user_list_viewed', 'core', 'viewed', 'user_list', 'course', 2, 'r', 0, 16, 50, 2, 2, 2, NULL, 0, 'a:2:{s:15:"courseshortname";s:5:"CP-01";s:14:"coursefullname";s:22:"Curso de prueba online";}', 1419704145, 'web', '201.195.217.90', NULL),
(306, '\\core\\event\\user_profile_viewed', 'core', 'viewed', 'user_profile', 'user', 2, 'r', 0, 16, 50, 2, 2, 2, 2, 0, 'a:3:{s:8:"courseid";s:1:"2";s:15:"courseshortname";s:5:"CP-01";s:14:"coursefullname";s:22:"Curso de prueba online";}', 1419704271, 'web', '201.195.217.90', NULL),
(307, '\\core\\event\\user_profile_viewed', 'core', 'viewed', 'user_profile', 'user', 2, 'r', 0, 16, 50, 2, 2, 2, 2, 0, 'a:3:{s:8:"courseid";s:1:"2";s:15:"courseshortname";s:5:"CP-01";s:14:"coursefullname";s:22:"Curso de prueba online";}', 1419704292, 'web', '201.195.217.90', NULL),
(308, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 16, 50, 2, 2, 2, NULL, 0, 'N;', 1419704296, 'web', '201.195.217.90', NULL),
(309, '\\core\\event\\calendar_event_created', 'core', 'created', 'calendar_event', 'event', 1, 'c', 0, 16, 50, 2, 2, 2, NULL, 0, 'a:3:{s:8:"repeatid";i:0;s:9:"timestart";i:1419963480;s:4:"name";s:29:"Quiz 1 (Cuestionario cerrado)";}', 1419704462, 'web', '201.195.217.90', NULL),
(310, '\\core\\event\\course_module_created', 'core', 'created', 'course_module', 'course_modules', 3, 'c', 1, 26, 70, 3, 2, 2, NULL, 0, 'a:3:{s:10:"modulename";s:4:"quiz";s:10:"instanceid";i:1;s:4:"name";s:6:"Quiz 1";}', 1419704462, 'web', '201.195.217.90', NULL),
(311, '\\mod_quiz\\event\\course_module_viewed', 'mod_quiz', 'viewed', 'course_module', 'quiz', 1, 'r', 2, 26, 70, 3, 2, 2, NULL, 0, 'N;', 1419704463, 'web', '201.195.217.90', NULL),
(312, '\\mod_quiz\\event\\edit_page_viewed', 'mod_quiz', 'viewed', 'edit_page', NULL, NULL, 'r', 1, 26, 70, 3, 2, 2, NULL, 0, 'a:1:{s:6:"quizid";s:1:"1";}', 1419704467, 'web', '201.195.217.90', NULL),
(313, '\\mod_quiz\\event\\edit_page_viewed', 'mod_quiz', 'viewed', 'edit_page', NULL, NULL, 'r', 1, 26, 70, 3, 2, 2, NULL, 0, 'a:1:{s:6:"quizid";s:1:"1";}', 1419704478, 'web', '201.195.217.90', NULL),
(314, '\\mod_quiz\\event\\edit_page_viewed', 'mod_quiz', 'viewed', 'edit_page', NULL, NULL, 'r', 1, 26, 70, 3, 2, 2, NULL, 0, 'a:1:{s:6:"quizid";s:1:"1";}', 1419704487, 'web', '201.195.217.90', NULL),
(315, '\\mod_quiz\\event\\edit_page_viewed', 'mod_quiz', 'viewed', 'edit_page', NULL, NULL, 'r', 1, 26, 70, 3, 2, 2, NULL, 0, 'a:1:{s:6:"quizid";s:1:"1";}', 1419704488, 'web', '201.195.217.90', NULL),
(316, '\\mod_quiz\\event\\edit_page_viewed', 'mod_quiz', 'viewed', 'edit_page', NULL, NULL, 'r', 1, 26, 70, 3, 2, 2, NULL, 0, 'a:1:{s:6:"quizid";s:1:"1";}', 1419704532, 'web', '201.195.217.90', NULL),
(317, '\\mod_quiz\\event\\edit_page_viewed', 'mod_quiz', 'viewed', 'edit_page', NULL, NULL, 'r', 1, 26, 70, 3, 2, 2, NULL, 0, 'a:1:{s:6:"quizid";s:1:"1";}', 1419704532, 'web', '201.195.217.90', NULL),
(318, '\\mod_quiz\\event\\edit_page_viewed', 'mod_quiz', 'viewed', 'edit_page', NULL, NULL, 'r', 1, 26, 70, 3, 2, 2, NULL, 0, 'a:1:{s:6:"quizid";s:1:"1";}', 1419704542, 'web', '201.195.217.90', NULL),
(319, '\\mod_quiz\\event\\edit_page_viewed', 'mod_quiz', 'viewed', 'edit_page', NULL, NULL, 'r', 1, 26, 70, 3, 2, 2, NULL, 0, 'a:1:{s:6:"quizid";s:1:"1";}', 1419704550, 'web', '201.195.217.90', NULL),
(320, '\\mod_quiz\\event\\course_module_viewed', 'mod_quiz', 'viewed', 'course_module', 'quiz', 1, 'r', 2, 26, 70, 3, 2, 2, NULL, 0, 'N;', 1419704555, 'web', '201.195.217.90', NULL),
(321, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 16, 50, 2, 2, 2, NULL, 0, 'N;', 1419704561, 'web', '201.195.217.90', NULL),
(322, '\\mod_quiz\\event\\course_module_viewed', 'mod_quiz', 'viewed', 'course_module', 'quiz', 1, 'r', 2, 26, 70, 3, 2, 2, NULL, 0, 'N;', 1419704566, 'web', '201.195.217.90', NULL),
(323, '\\mod_quiz\\event\\attempt_preview_started', 'mod_quiz', 'started', 'attempt_preview', 'quiz_attempts', 1, 'r', 1, 26, 70, 3, 2, 2, 2, 0, 'a:1:{s:6:"quizid";s:1:"1";}', 1419704573, 'web', '201.195.217.90', NULL),
(324, '\\mod_quiz\\event\\attempt_viewed', 'mod_quiz', 'viewed', 'attempt', 'quiz_attempts', 1, 'r', 2, 26, 70, 3, 2, 2, 2, 0, 'a:1:{s:6:"quizid";s:1:"1";}', 1419704573, 'web', '201.195.217.90', NULL),
(325, '\\mod_quiz\\event\\attempt_summary_viewed', 'mod_quiz', 'viewed', 'attempt_summary', 'quiz_attempts', 1, 'r', 1, 26, 70, 3, 2, 2, 2, 0, 'a:1:{s:6:"quizid";s:1:"1";}', 1419704603, 'web', '201.195.217.90', NULL),
(326, '\\mod_quiz\\event\\attempt_reviewed', 'mod_quiz', 'reviewed', 'attempt', 'quiz_attempts', 1, 'r', 1, 26, 70, 3, 2, 2, 2, 0, 'a:1:{s:6:"quizid";s:1:"1";}', 1419704609, 'web', '201.195.217.90', NULL),
(327, '\\core\\event\\user_loggedin', 'core', 'loggedin', 'user', 'user', 2, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"username";s:5:"admin";}', 1420730790, 'web', '201.195.209.206', NULL),
(328, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 2, 1, NULL, 0, 'N;', 1420730795, 'web', '201.195.209.206', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_log_display`
--

CREATE TABLE IF NOT EXISTS `mdl_log_display` (
`id` bigint(10) NOT NULL,
  `module` varchar(20) NOT NULL DEFAULT '',
  `action` varchar(40) NOT NULL DEFAULT '',
  `mtable` varchar(30) NOT NULL DEFAULT '',
  `field` varchar(200) NOT NULL DEFAULT '',
  `component` varchar(100) NOT NULL DEFAULT ''
) ENGINE=InnoDB AUTO_INCREMENT=188 DEFAULT CHARSET=utf8 COMMENT='For a particular module/action, specifies a moodle table/fie';

--
-- Dumping data for table `mdl_log_display`
--

INSERT INTO `mdl_log_display` (`id`, `module`, `action`, `mtable`, `field`, `component`) VALUES
(1, 'course', 'user report', 'user', 'CONCAT(firstname, '' '', lastname)', 'moodle'),
(2, 'course', 'view', 'course', 'fullname', 'moodle'),
(3, 'course', 'view section', 'course_sections', 'name', 'moodle'),
(4, 'course', 'update', 'course', 'fullname', 'moodle'),
(5, 'course', 'hide', 'course', 'fullname', 'moodle'),
(6, 'course', 'show', 'course', 'fullname', 'moodle'),
(7, 'course', 'move', 'course', 'fullname', 'moodle'),
(8, 'course', 'enrol', 'course', 'fullname', 'moodle'),
(9, 'course', 'unenrol', 'course', 'fullname', 'moodle'),
(10, 'course', 'report log', 'course', 'fullname', 'moodle'),
(11, 'course', 'report live', 'course', 'fullname', 'moodle'),
(12, 'course', 'report outline', 'course', 'fullname', 'moodle'),
(13, 'course', 'report participation', 'course', 'fullname', 'moodle'),
(14, 'course', 'report stats', 'course', 'fullname', 'moodle'),
(15, 'category', 'add', 'course_categories', 'name', 'moodle'),
(16, 'category', 'hide', 'course_categories', 'name', 'moodle'),
(17, 'category', 'move', 'course_categories', 'name', 'moodle'),
(18, 'category', 'show', 'course_categories', 'name', 'moodle'),
(19, 'category', 'update', 'course_categories', 'name', 'moodle'),
(20, 'message', 'write', 'user', 'CONCAT(firstname, '' '', lastname)', 'moodle'),
(21, 'message', 'read', 'user', 'CONCAT(firstname, '' '', lastname)', 'moodle'),
(22, 'message', 'add contact', 'user', 'CONCAT(firstname, '' '', lastname)', 'moodle'),
(23, 'message', 'remove contact', 'user', 'CONCAT(firstname, '' '', lastname)', 'moodle'),
(24, 'message', 'block contact', 'user', 'CONCAT(firstname, '' '', lastname)', 'moodle'),
(25, 'message', 'unblock contact', 'user', 'CONCAT(firstname, '' '', lastname)', 'moodle'),
(26, 'group', 'view', 'groups', 'name', 'moodle'),
(27, 'tag', 'update', 'tag', 'name', 'moodle'),
(28, 'tag', 'flag', 'tag', 'name', 'moodle'),
(29, 'user', 'view', 'user', 'CONCAT(firstname, '' '', lastname)', 'moodle'),
(30, 'assign', 'add', 'assign', 'name', 'mod_assign'),
(31, 'assign', 'delete mod', 'assign', 'name', 'mod_assign'),
(32, 'assign', 'download all submissions', 'assign', 'name', 'mod_assign'),
(33, 'assign', 'grade submission', 'assign', 'name', 'mod_assign'),
(34, 'assign', 'lock submission', 'assign', 'name', 'mod_assign'),
(35, 'assign', 'reveal identities', 'assign', 'name', 'mod_assign'),
(36, 'assign', 'revert submission to draft', 'assign', 'name', 'mod_assign'),
(37, 'assign', 'set marking workflow state', 'assign', 'name', 'mod_assign'),
(38, 'assign', 'submission statement accepted', 'assign', 'name', 'mod_assign'),
(39, 'assign', 'submit', 'assign', 'name', 'mod_assign'),
(40, 'assign', 'submit for grading', 'assign', 'name', 'mod_assign'),
(41, 'assign', 'unlock submission', 'assign', 'name', 'mod_assign'),
(42, 'assign', 'update', 'assign', 'name', 'mod_assign'),
(43, 'assign', 'upload', 'assign', 'name', 'mod_assign'),
(44, 'assign', 'view', 'assign', 'name', 'mod_assign'),
(45, 'assign', 'view all', 'course', 'fullname', 'mod_assign'),
(46, 'assign', 'view confirm submit assignment form', 'assign', 'name', 'mod_assign'),
(47, 'assign', 'view grading form', 'assign', 'name', 'mod_assign'),
(48, 'assign', 'view submission', 'assign', 'name', 'mod_assign'),
(49, 'assign', 'view submission grading table', 'assign', 'name', 'mod_assign'),
(50, 'assign', 'view submit assignment form', 'assign', 'name', 'mod_assign'),
(51, 'assign', 'view feedback', 'assign', 'name', 'mod_assign'),
(52, 'assign', 'view batch set marking workflow state', 'assign', 'name', 'mod_assign'),
(53, 'assignment', 'view', 'assignment', 'name', 'mod_assignment'),
(54, 'assignment', 'add', 'assignment', 'name', 'mod_assignment'),
(55, 'assignment', 'update', 'assignment', 'name', 'mod_assignment'),
(56, 'assignment', 'view submission', 'assignment', 'name', 'mod_assignment'),
(57, 'assignment', 'upload', 'assignment', 'name', 'mod_assignment'),
(58, 'book', 'add', 'book', 'name', 'mod_book'),
(59, 'book', 'update', 'book', 'name', 'mod_book'),
(60, 'book', 'view', 'book', 'name', 'mod_book'),
(61, 'book', 'add chapter', 'book_chapters', 'title', 'mod_book'),
(62, 'book', 'update chapter', 'book_chapters', 'title', 'mod_book'),
(63, 'book', 'view chapter', 'book_chapters', 'title', 'mod_book'),
(64, 'chat', 'view', 'chat', 'name', 'mod_chat'),
(65, 'chat', 'add', 'chat', 'name', 'mod_chat'),
(66, 'chat', 'update', 'chat', 'name', 'mod_chat'),
(67, 'chat', 'report', 'chat', 'name', 'mod_chat'),
(68, 'chat', 'talk', 'chat', 'name', 'mod_chat'),
(69, 'choice', 'view', 'choice', 'name', 'mod_choice'),
(70, 'choice', 'update', 'choice', 'name', 'mod_choice'),
(71, 'choice', 'add', 'choice', 'name', 'mod_choice'),
(72, 'choice', 'report', 'choice', 'name', 'mod_choice'),
(73, 'choice', 'choose', 'choice', 'name', 'mod_choice'),
(74, 'choice', 'choose again', 'choice', 'name', 'mod_choice'),
(75, 'data', 'view', 'data', 'name', 'mod_data'),
(76, 'data', 'add', 'data', 'name', 'mod_data'),
(77, 'data', 'update', 'data', 'name', 'mod_data'),
(78, 'data', 'record delete', 'data', 'name', 'mod_data'),
(79, 'data', 'fields add', 'data_fields', 'name', 'mod_data'),
(80, 'data', 'fields update', 'data_fields', 'name', 'mod_data'),
(81, 'data', 'templates saved', 'data', 'name', 'mod_data'),
(82, 'data', 'templates def', 'data', 'name', 'mod_data'),
(83, 'feedback', 'startcomplete', 'feedback', 'name', 'mod_feedback'),
(84, 'feedback', 'submit', 'feedback', 'name', 'mod_feedback'),
(85, 'feedback', 'delete', 'feedback', 'name', 'mod_feedback'),
(86, 'feedback', 'view', 'feedback', 'name', 'mod_feedback'),
(87, 'feedback', 'view all', 'course', 'shortname', 'mod_feedback'),
(88, 'folder', 'view', 'folder', 'name', 'mod_folder'),
(89, 'folder', 'view all', 'folder', 'name', 'mod_folder'),
(90, 'folder', 'update', 'folder', 'name', 'mod_folder'),
(91, 'folder', 'add', 'folder', 'name', 'mod_folder'),
(92, 'forum', 'add', 'forum', 'name', 'mod_forum'),
(93, 'forum', 'update', 'forum', 'name', 'mod_forum'),
(94, 'forum', 'add discussion', 'forum_discussions', 'name', 'mod_forum'),
(95, 'forum', 'add post', 'forum_posts', 'subject', 'mod_forum'),
(96, 'forum', 'update post', 'forum_posts', 'subject', 'mod_forum'),
(97, 'forum', 'user report', 'user', 'CONCAT(firstname, '' '', lastname)', 'mod_forum'),
(98, 'forum', 'move discussion', 'forum_discussions', 'name', 'mod_forum'),
(99, 'forum', 'view subscribers', 'forum', 'name', 'mod_forum'),
(100, 'forum', 'view discussion', 'forum_discussions', 'name', 'mod_forum'),
(101, 'forum', 'view forum', 'forum', 'name', 'mod_forum'),
(102, 'forum', 'subscribe', 'forum', 'name', 'mod_forum'),
(103, 'forum', 'unsubscribe', 'forum', 'name', 'mod_forum'),
(104, 'glossary', 'add', 'glossary', 'name', 'mod_glossary'),
(105, 'glossary', 'update', 'glossary', 'name', 'mod_glossary'),
(106, 'glossary', 'view', 'glossary', 'name', 'mod_glossary'),
(107, 'glossary', 'view all', 'glossary', 'name', 'mod_glossary'),
(108, 'glossary', 'add entry', 'glossary', 'name', 'mod_glossary'),
(109, 'glossary', 'update entry', 'glossary', 'name', 'mod_glossary'),
(110, 'glossary', 'add category', 'glossary', 'name', 'mod_glossary'),
(111, 'glossary', 'update category', 'glossary', 'name', 'mod_glossary'),
(112, 'glossary', 'delete category', 'glossary', 'name', 'mod_glossary'),
(113, 'glossary', 'approve entry', 'glossary', 'name', 'mod_glossary'),
(114, 'glossary', 'disapprove entry', 'glossary', 'name', 'mod_glossary'),
(115, 'glossary', 'view entry', 'glossary_entries', 'concept', 'mod_glossary'),
(116, 'imscp', 'view', 'imscp', 'name', 'mod_imscp'),
(117, 'imscp', 'view all', 'imscp', 'name', 'mod_imscp'),
(118, 'imscp', 'update', 'imscp', 'name', 'mod_imscp'),
(119, 'imscp', 'add', 'imscp', 'name', 'mod_imscp'),
(120, 'label', 'add', 'label', 'name', 'mod_label'),
(121, 'label', 'update', 'label', 'name', 'mod_label'),
(122, 'lesson', 'start', 'lesson', 'name', 'mod_lesson'),
(123, 'lesson', 'end', 'lesson', 'name', 'mod_lesson'),
(124, 'lesson', 'view', 'lesson_pages', 'title', 'mod_lesson'),
(125, 'lti', 'view', 'lti', 'name', 'mod_lti'),
(126, 'lti', 'launch', 'lti', 'name', 'mod_lti'),
(127, 'lti', 'view all', 'lti', 'name', 'mod_lti'),
(128, 'page', 'view', 'page', 'name', 'mod_page'),
(129, 'page', 'view all', 'page', 'name', 'mod_page'),
(130, 'page', 'update', 'page', 'name', 'mod_page'),
(131, 'page', 'add', 'page', 'name', 'mod_page'),
(132, 'quiz', 'add', 'quiz', 'name', 'mod_quiz'),
(133, 'quiz', 'update', 'quiz', 'name', 'mod_quiz'),
(134, 'quiz', 'view', 'quiz', 'name', 'mod_quiz'),
(135, 'quiz', 'report', 'quiz', 'name', 'mod_quiz'),
(136, 'quiz', 'attempt', 'quiz', 'name', 'mod_quiz'),
(137, 'quiz', 'submit', 'quiz', 'name', 'mod_quiz'),
(138, 'quiz', 'review', 'quiz', 'name', 'mod_quiz'),
(139, 'quiz', 'editquestions', 'quiz', 'name', 'mod_quiz'),
(140, 'quiz', 'preview', 'quiz', 'name', 'mod_quiz'),
(141, 'quiz', 'start attempt', 'quiz', 'name', 'mod_quiz'),
(142, 'quiz', 'close attempt', 'quiz', 'name', 'mod_quiz'),
(143, 'quiz', 'continue attempt', 'quiz', 'name', 'mod_quiz'),
(144, 'quiz', 'edit override', 'quiz', 'name', 'mod_quiz'),
(145, 'quiz', 'delete override', 'quiz', 'name', 'mod_quiz'),
(146, 'quiz', 'view summary', 'quiz', 'name', 'mod_quiz'),
(147, 'resource', 'view', 'resource', 'name', 'mod_resource'),
(148, 'resource', 'view all', 'resource', 'name', 'mod_resource'),
(149, 'resource', 'update', 'resource', 'name', 'mod_resource'),
(150, 'resource', 'add', 'resource', 'name', 'mod_resource'),
(151, 'scorm', 'view', 'scorm', 'name', 'mod_scorm'),
(152, 'scorm', 'review', 'scorm', 'name', 'mod_scorm'),
(153, 'scorm', 'update', 'scorm', 'name', 'mod_scorm'),
(154, 'scorm', 'add', 'scorm', 'name', 'mod_scorm'),
(155, 'survey', 'add', 'survey', 'name', 'mod_survey'),
(156, 'survey', 'update', 'survey', 'name', 'mod_survey'),
(157, 'survey', 'download', 'survey', 'name', 'mod_survey'),
(158, 'survey', 'view form', 'survey', 'name', 'mod_survey'),
(159, 'survey', 'view graph', 'survey', 'name', 'mod_survey'),
(160, 'survey', 'view report', 'survey', 'name', 'mod_survey'),
(161, 'survey', 'submit', 'survey', 'name', 'mod_survey'),
(162, 'url', 'view', 'url', 'name', 'mod_url'),
(163, 'url', 'view all', 'url', 'name', 'mod_url'),
(164, 'url', 'update', 'url', 'name', 'mod_url'),
(165, 'url', 'add', 'url', 'name', 'mod_url'),
(166, 'workshop', 'add', 'workshop', 'name', 'mod_workshop'),
(167, 'workshop', 'update', 'workshop', 'name', 'mod_workshop'),
(168, 'workshop', 'view', 'workshop', 'name', 'mod_workshop'),
(169, 'workshop', 'view all', 'workshop', 'name', 'mod_workshop'),
(170, 'workshop', 'add submission', 'workshop_submissions', 'title', 'mod_workshop'),
(171, 'workshop', 'update submission', 'workshop_submissions', 'title', 'mod_workshop'),
(172, 'workshop', 'view submission', 'workshop_submissions', 'title', 'mod_workshop'),
(173, 'workshop', 'add assessment', 'workshop_submissions', 'title', 'mod_workshop'),
(174, 'workshop', 'update assessment', 'workshop_submissions', 'title', 'mod_workshop'),
(175, 'workshop', 'add example', 'workshop_submissions', 'title', 'mod_workshop'),
(176, 'workshop', 'update example', 'workshop_submissions', 'title', 'mod_workshop'),
(177, 'workshop', 'view example', 'workshop_submissions', 'title', 'mod_workshop'),
(178, 'workshop', 'add reference assessment', 'workshop_submissions', 'title', 'mod_workshop'),
(179, 'workshop', 'update reference assessment', 'workshop_submissions', 'title', 'mod_workshop'),
(180, 'workshop', 'add example assessment', 'workshop_submissions', 'title', 'mod_workshop'),
(181, 'workshop', 'update example assessment', 'workshop_submissions', 'title', 'mod_workshop'),
(182, 'workshop', 'update aggregate grades', 'workshop', 'name', 'mod_workshop'),
(183, 'workshop', 'update clear aggregated grades', 'workshop', 'name', 'mod_workshop'),
(184, 'workshop', 'update clear assessments', 'workshop', 'name', 'mod_workshop'),
(185, 'book', 'exportimscp', 'book', 'name', 'booktool_exportimscp'),
(186, 'book', 'print', 'book', 'name', 'booktool_print'),
(187, 'book', 'print chapter', 'book_chapters', 'title', 'booktool_print');

-- --------------------------------------------------------

--
-- Table structure for table `mdl_log_queries`
--

CREATE TABLE IF NOT EXISTS `mdl_log_queries` (
`id` bigint(10) NOT NULL,
  `qtype` mediumint(5) NOT NULL,
  `sqltext` longtext NOT NULL,
  `sqlparams` longtext,
  `error` mediumint(5) NOT NULL DEFAULT '0',
  `info` longtext,
  `backtrace` longtext,
  `exectime` decimal(10,5) NOT NULL,
  `timelogged` bigint(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Logged database queries.';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_lti`
--

CREATE TABLE IF NOT EXISTS `mdl_lti` (
`id` bigint(10) NOT NULL,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `intro` longtext,
  `introformat` smallint(4) DEFAULT '0',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `typeid` bigint(10) DEFAULT NULL,
  `toolurl` longtext NOT NULL,
  `securetoolurl` longtext,
  `instructorchoicesendname` tinyint(1) DEFAULT NULL,
  `instructorchoicesendemailaddr` tinyint(1) DEFAULT NULL,
  `instructorchoiceallowroster` tinyint(1) DEFAULT NULL,
  `instructorchoiceallowsetting` tinyint(1) DEFAULT NULL,
  `instructorcustomparameters` varchar(255) DEFAULT NULL,
  `instructorchoiceacceptgrades` tinyint(1) DEFAULT NULL,
  `grade` decimal(10,5) NOT NULL DEFAULT '100.00000',
  `launchcontainer` tinyint(2) NOT NULL DEFAULT '1',
  `resourcekey` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `debuglaunch` tinyint(1) NOT NULL DEFAULT '0',
  `showtitlelaunch` tinyint(1) NOT NULL DEFAULT '0',
  `showdescriptionlaunch` tinyint(1) NOT NULL DEFAULT '0',
  `servicesalt` varchar(40) DEFAULT NULL,
  `icon` longtext,
  `secureicon` longtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='This table contains Basic LTI activities instances';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_lti_submission`
--

CREATE TABLE IF NOT EXISTS `mdl_lti_submission` (
`id` bigint(10) NOT NULL,
  `ltiid` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `datesubmitted` bigint(10) NOT NULL,
  `dateupdated` bigint(10) NOT NULL,
  `gradepercent` decimal(10,5) NOT NULL,
  `originalgrade` decimal(10,5) NOT NULL,
  `launchid` bigint(10) NOT NULL,
  `state` tinyint(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Keeps track of individual submissions for LTI activities.';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_lti_types`
--

CREATE TABLE IF NOT EXISTS `mdl_lti_types` (
`id` bigint(10) NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT 'basiclti Activity',
  `baseurl` longtext NOT NULL,
  `tooldomain` varchar(255) NOT NULL DEFAULT '',
  `state` tinyint(2) NOT NULL DEFAULT '2',
  `course` bigint(10) NOT NULL,
  `coursevisible` tinyint(1) NOT NULL DEFAULT '0',
  `createdby` bigint(10) NOT NULL,
  `timecreated` bigint(10) NOT NULL,
  `timemodified` bigint(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Basic LTI pre-configured activities';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_lti_types_config`
--

CREATE TABLE IF NOT EXISTS `mdl_lti_types_config` (
`id` bigint(10) NOT NULL,
  `typeid` bigint(10) NOT NULL,
  `name` varchar(100) NOT NULL DEFAULT '',
  `value` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Basic LTI types configuration';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_message`
--

CREATE TABLE IF NOT EXISTS `mdl_message` (
`id` bigint(10) NOT NULL,
  `useridfrom` bigint(10) NOT NULL DEFAULT '0',
  `useridto` bigint(10) NOT NULL DEFAULT '0',
  `subject` longtext,
  `fullmessage` longtext,
  `fullmessageformat` smallint(4) DEFAULT '0',
  `fullmessagehtml` longtext,
  `smallmessage` longtext,
  `notification` tinyint(1) DEFAULT '0',
  `contexturl` longtext,
  `contexturlname` longtext,
  `timecreated` bigint(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='Stores all unread messages';

--
-- Dumping data for table `mdl_message`
--

INSERT INTO `mdl_message` (`id`, `useridfrom`, `useridto`, `subject`, `fullmessage`, `fullmessageformat`, `fullmessagehtml`, `smallmessage`, `notification`, `contexturl`, `contexturlname`, `timecreated`) VALUES
(1, 2, 5, 'Mensaje nuevo de (Admin User)', 'hola\n\n\n---------------------------------------------------------------------\nÉsta es una copia del mensaje que se le ha enviado en "Capacita Online". Vaya a http://capacita.co/moodle/message/index.php?user=5&id=2 para contestar.', 1, '<p>hola<br /></p><br /><br />---------------------------------------------------------------------<br />Ésta es una copia del mensaje que se le ha enviado en "Capacita Online". Vaya a http://capacita.co/moodle/message/index.php?user=5&id=2 para contestar.', '<p>hola<br /></p>', 0, NULL, NULL, 1417667588),
(2, 2, 5, 'Mensaje nuevo de (Admin User)', 'hola\n\n---------------------------------------------------------------------\nÉsta es una copia del mensaje que se le ha enviado en "Capacita Online". Vaya a http://capacita.co/moodle/message/index.php?user=5&id=2 para contestar.', 0, '', 'hola', 0, NULL, NULL, 1417667702),
(3, 2, 5, 'Mensaje nuevo de (Admin User)', 'hola mundo\n\n\n---------------------------------------------------------------------\nÉsta es una copia del mensaje que se le ha enviado en "Capacita Online". Vaya a http://capacita.co/moodle/message/index.php?user=5&id=2 para contestar.', 1, '<p>hola mundo<br /></p><br /><br />---------------------------------------------------------------------<br />Ésta es una copia del mensaje que se le ha enviado en "Capacita Online". Vaya a http://capacita.co/moodle/message/index.php?user=5&id=2 para contestar.', '<p>hola mundo<br /></p>', 0, NULL, NULL, 1417667742);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_message_airnotifier_devices`
--

CREATE TABLE IF NOT EXISTS `mdl_message_airnotifier_devices` (
`id` bigint(10) NOT NULL,
  `userdeviceid` bigint(10) NOT NULL,
  `enable` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Store information about the devices registered in Airnotifie';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_message_contacts`
--

CREATE TABLE IF NOT EXISTS `mdl_message_contacts` (
`id` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `contactid` bigint(10) NOT NULL DEFAULT '0',
  `blocked` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Maintains lists of relationships between users';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_message_processors`
--

CREATE TABLE IF NOT EXISTS `mdl_message_processors` (
`id` bigint(10) NOT NULL,
  `name` varchar(166) NOT NULL DEFAULT '',
  `enabled` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='List of message output plugins';

--
-- Dumping data for table `mdl_message_processors`
--

INSERT INTO `mdl_message_processors` (`id`, `name`, `enabled`) VALUES
(1, 'airnotifier', 0),
(2, 'email', 1),
(3, 'jabber', 1),
(4, 'popup', 1);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_message_providers`
--

CREATE TABLE IF NOT EXISTS `mdl_message_providers` (
`id` bigint(10) NOT NULL,
  `name` varchar(100) NOT NULL DEFAULT '',
  `component` varchar(200) NOT NULL DEFAULT '',
  `capability` varchar(255) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COMMENT='This table stores the message providers (modules and core sy';

--
-- Dumping data for table `mdl_message_providers`
--

INSERT INTO `mdl_message_providers` (`id`, `name`, `component`, `capability`) VALUES
(1, 'notices', 'moodle', 'moodle/site:config'),
(2, 'errors', 'moodle', 'moodle/site:config'),
(3, 'availableupdate', 'moodle', 'moodle/site:config'),
(4, 'instantmessage', 'moodle', NULL),
(5, 'backup', 'moodle', 'moodle/site:config'),
(6, 'courserequested', 'moodle', 'moodle/site:approvecourse'),
(7, 'courserequestapproved', 'moodle', 'moodle/course:request'),
(8, 'courserequestrejected', 'moodle', 'moodle/course:request'),
(9, 'badgerecipientnotice', 'moodle', 'moodle/badges:earnbadge'),
(10, 'badgecreatornotice', 'moodle', NULL),
(11, 'assign_notification', 'mod_assign', NULL),
(12, 'assignment_updates', 'mod_assignment', NULL),
(13, 'submission', 'mod_feedback', NULL),
(14, 'message', 'mod_feedback', NULL),
(15, 'posts', 'mod_forum', NULL),
(16, 'graded_essay', 'mod_lesson', NULL),
(17, 'submission', 'mod_quiz', 'mod/quiz:emailnotifysubmission'),
(18, 'confirmation', 'mod_quiz', 'mod/quiz:emailconfirmsubmission'),
(19, 'attempt_overdue', 'mod_quiz', 'mod/quiz:emailwarnoverdue'),
(20, 'flatfile_enrolment', 'enrol_flatfile', NULL),
(21, 'imsenterprise_enrolment', 'enrol_imsenterprise', NULL),
(22, 'expiry_notification', 'enrol_manual', NULL),
(23, 'paypal_enrolment', 'enrol_paypal', NULL),
(24, 'expiry_notification', 'enrol_self', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_message_read`
--

CREATE TABLE IF NOT EXISTS `mdl_message_read` (
`id` bigint(10) NOT NULL,
  `useridfrom` bigint(10) NOT NULL DEFAULT '0',
  `useridto` bigint(10) NOT NULL DEFAULT '0',
  `subject` longtext,
  `fullmessage` longtext,
  `fullmessageformat` smallint(4) DEFAULT '0',
  `fullmessagehtml` longtext,
  `smallmessage` longtext,
  `notification` tinyint(1) DEFAULT '0',
  `contexturl` longtext,
  `contexturlname` longtext,
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timeread` bigint(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores all messages that have been read';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_message_working`
--

CREATE TABLE IF NOT EXISTS `mdl_message_working` (
`id` bigint(10) NOT NULL,
  `unreadmessageid` bigint(10) NOT NULL,
  `processorid` bigint(10) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='Lists all the messages and processors that need to be proces';

--
-- Dumping data for table `mdl_message_working`
--

INSERT INTO `mdl_message_working` (`id`, `unreadmessageid`, `processorid`) VALUES
(1, 1, 4),
(2, 2, 4),
(3, 3, 4);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_mnetservice_enrol_courses`
--

CREATE TABLE IF NOT EXISTS `mdl_mnetservice_enrol_courses` (
`id` bigint(10) NOT NULL,
  `hostid` bigint(10) NOT NULL,
  `remoteid` bigint(10) NOT NULL,
  `categoryid` bigint(10) NOT NULL,
  `categoryname` varchar(255) NOT NULL DEFAULT '',
  `sortorder` bigint(10) NOT NULL DEFAULT '0',
  `fullname` varchar(254) NOT NULL DEFAULT '',
  `shortname` varchar(100) NOT NULL DEFAULT '',
  `idnumber` varchar(100) NOT NULL DEFAULT '',
  `summary` longtext NOT NULL,
  `summaryformat` smallint(3) DEFAULT '0',
  `startdate` bigint(10) NOT NULL,
  `roleid` bigint(10) NOT NULL,
  `rolename` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Caches the information fetched via XML-RPC about courses on ';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_mnetservice_enrol_enrolments`
--

CREATE TABLE IF NOT EXISTS `mdl_mnetservice_enrol_enrolments` (
`id` bigint(10) NOT NULL,
  `hostid` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `remotecourseid` bigint(10) NOT NULL,
  `rolename` varchar(255) NOT NULL DEFAULT '',
  `enroltime` bigint(10) NOT NULL DEFAULT '0',
  `enroltype` varchar(20) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Caches the information about enrolments of our local users i';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_mnet_application`
--

CREATE TABLE IF NOT EXISTS `mdl_mnet_application` (
`id` bigint(10) NOT NULL,
  `name` varchar(50) NOT NULL DEFAULT '',
  `display_name` varchar(50) NOT NULL DEFAULT '',
  `xmlrpc_server_url` varchar(255) NOT NULL DEFAULT '',
  `sso_land_url` varchar(255) NOT NULL DEFAULT '',
  `sso_jump_url` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='Information about applications on remote hosts';

--
-- Dumping data for table `mdl_mnet_application`
--

INSERT INTO `mdl_mnet_application` (`id`, `name`, `display_name`, `xmlrpc_server_url`, `sso_land_url`, `sso_jump_url`) VALUES
(1, 'moodle', 'Moodle', '/mnet/xmlrpc/server.php', '/auth/mnet/land.php', '/auth/mnet/jump.php'),
(2, 'mahara', 'Mahara', '/api/xmlrpc/server.php', '/auth/xmlrpc/land.php', '/auth/xmlrpc/jump.php');

-- --------------------------------------------------------

--
-- Table structure for table `mdl_mnet_host`
--

CREATE TABLE IF NOT EXISTS `mdl_mnet_host` (
`id` bigint(10) NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `wwwroot` varchar(255) NOT NULL DEFAULT '',
  `ip_address` varchar(45) NOT NULL DEFAULT '',
  `name` varchar(80) NOT NULL DEFAULT '',
  `public_key` longtext NOT NULL,
  `public_key_expires` bigint(10) NOT NULL DEFAULT '0',
  `transport` tinyint(2) NOT NULL DEFAULT '0',
  `portno` mediumint(5) NOT NULL DEFAULT '0',
  `last_connect_time` bigint(10) NOT NULL DEFAULT '0',
  `last_log_id` bigint(10) NOT NULL DEFAULT '0',
  `force_theme` tinyint(1) NOT NULL DEFAULT '0',
  `theme` varchar(100) DEFAULT NULL,
  `applicationid` bigint(10) NOT NULL DEFAULT '1'
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='Information about the local and remote hosts for RPC';

--
-- Dumping data for table `mdl_mnet_host`
--

INSERT INTO `mdl_mnet_host` (`id`, `deleted`, `wwwroot`, `ip_address`, `name`, `public_key`, `public_key_expires`, `transport`, `portno`, `last_connect_time`, `last_log_id`, `force_theme`, `theme`, `applicationid`) VALUES
(1, 0, 'http://localhost:8888/moodle', '127.0.0.1', '', '', 0, 0, 0, 0, 0, 0, NULL, 1),
(2, 0, '', '', 'All Hosts', '', 0, 0, 0, 0, 0, 0, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_mnet_host2service`
--

CREATE TABLE IF NOT EXISTS `mdl_mnet_host2service` (
`id` bigint(10) NOT NULL,
  `hostid` bigint(10) NOT NULL DEFAULT '0',
  `serviceid` bigint(10) NOT NULL DEFAULT '0',
  `publish` tinyint(1) NOT NULL DEFAULT '0',
  `subscribe` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Information about the services for a given host';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_mnet_log`
--

CREATE TABLE IF NOT EXISTS `mdl_mnet_log` (
`id` bigint(10) NOT NULL,
  `hostid` bigint(10) NOT NULL DEFAULT '0',
  `remoteid` bigint(10) NOT NULL DEFAULT '0',
  `time` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `ip` varchar(45) NOT NULL DEFAULT '',
  `course` bigint(10) NOT NULL DEFAULT '0',
  `coursename` varchar(40) NOT NULL DEFAULT '',
  `module` varchar(20) NOT NULL DEFAULT '',
  `cmid` bigint(10) NOT NULL DEFAULT '0',
  `action` varchar(40) NOT NULL DEFAULT '',
  `url` varchar(100) NOT NULL DEFAULT '',
  `info` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Store session data from users migrating to other sites';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_mnet_remote_rpc`
--

CREATE TABLE IF NOT EXISTS `mdl_mnet_remote_rpc` (
`id` bigint(10) NOT NULL,
  `functionname` varchar(40) NOT NULL DEFAULT '',
  `xmlrpcpath` varchar(80) NOT NULL DEFAULT '',
  `plugintype` varchar(20) NOT NULL DEFAULT '',
  `pluginname` varchar(20) NOT NULL DEFAULT '',
  `enabled` tinyint(1) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COMMENT='This table describes functions that might be called remotely';

--
-- Dumping data for table `mdl_mnet_remote_rpc`
--

INSERT INTO `mdl_mnet_remote_rpc` (`id`, `functionname`, `xmlrpcpath`, `plugintype`, `pluginname`, `enabled`) VALUES
(1, 'user_authorise', 'auth/mnet/auth.php/user_authorise', 'auth', 'mnet', 1),
(2, 'keepalive_server', 'auth/mnet/auth.php/keepalive_server', 'auth', 'mnet', 1),
(3, 'kill_children', 'auth/mnet/auth.php/kill_children', 'auth', 'mnet', 1),
(4, 'refresh_log', 'auth/mnet/auth.php/refresh_log', 'auth', 'mnet', 1),
(5, 'fetch_user_image', 'auth/mnet/auth.php/fetch_user_image', 'auth', 'mnet', 1),
(6, 'fetch_theme_info', 'auth/mnet/auth.php/fetch_theme_info', 'auth', 'mnet', 1),
(7, 'update_enrolments', 'auth/mnet/auth.php/update_enrolments', 'auth', 'mnet', 1),
(8, 'keepalive_client', 'auth/mnet/auth.php/keepalive_client', 'auth', 'mnet', 1),
(9, 'kill_child', 'auth/mnet/auth.php/kill_child', 'auth', 'mnet', 1),
(10, 'available_courses', 'enrol/mnet/enrol.php/available_courses', 'enrol', 'mnet', 1),
(11, 'user_enrolments', 'enrol/mnet/enrol.php/user_enrolments', 'enrol', 'mnet', 1),
(12, 'enrol_user', 'enrol/mnet/enrol.php/enrol_user', 'enrol', 'mnet', 1),
(13, 'unenrol_user', 'enrol/mnet/enrol.php/unenrol_user', 'enrol', 'mnet', 1),
(14, 'course_enrolments', 'enrol/mnet/enrol.php/course_enrolments', 'enrol', 'mnet', 1),
(15, 'send_content_intent', 'portfolio/mahara/lib.php/send_content_intent', 'portfolio', 'mahara', 1),
(16, 'send_content_ready', 'portfolio/mahara/lib.php/send_content_ready', 'portfolio', 'mahara', 1);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_mnet_remote_service2rpc`
--

CREATE TABLE IF NOT EXISTS `mdl_mnet_remote_service2rpc` (
`id` bigint(10) NOT NULL,
  `serviceid` bigint(10) NOT NULL DEFAULT '0',
  `rpcid` bigint(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COMMENT='Group functions or methods under a service';

--
-- Dumping data for table `mdl_mnet_remote_service2rpc`
--

INSERT INTO `mdl_mnet_remote_service2rpc` (`id`, `serviceid`, `rpcid`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 1, 3),
(4, 1, 4),
(5, 1, 5),
(6, 1, 6),
(7, 1, 7),
(8, 2, 8),
(9, 2, 9),
(10, 3, 10),
(11, 3, 11),
(12, 3, 12),
(13, 3, 13),
(14, 3, 14),
(15, 4, 15),
(16, 4, 16);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_mnet_rpc`
--

CREATE TABLE IF NOT EXISTS `mdl_mnet_rpc` (
`id` bigint(10) NOT NULL,
  `functionname` varchar(40) NOT NULL DEFAULT '',
  `xmlrpcpath` varchar(80) NOT NULL DEFAULT '',
  `plugintype` varchar(20) NOT NULL DEFAULT '',
  `pluginname` varchar(20) NOT NULL DEFAULT '',
  `enabled` tinyint(1) NOT NULL DEFAULT '0',
  `help` longtext NOT NULL,
  `profile` longtext NOT NULL,
  `filename` varchar(100) NOT NULL DEFAULT '',
  `classname` varchar(150) DEFAULT NULL,
  `static` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COMMENT='Functions or methods that we may publish or subscribe to';

--
-- Dumping data for table `mdl_mnet_rpc`
--

INSERT INTO `mdl_mnet_rpc` (`id`, `functionname`, `xmlrpcpath`, `plugintype`, `pluginname`, `enabled`, `help`, `profile`, `filename`, `classname`, `static`) VALUES
(1, 'user_authorise', 'auth/mnet/auth.php/user_authorise', 'auth', 'mnet', 1, 'Return user data for the provided token, compare with user_agent string.', 'a:2:{s:10:"parameters";a:2:{i:0;a:3:{s:4:"name";s:5:"token";s:4:"type";s:6:"string";s:11:"description";s:37:"The unique ID provided by remotehost.";}i:1;a:3:{s:4:"name";s:9:"useragent";s:4:"type";s:6:"string";s:11:"description";s:0:"";}}s:6:"return";a:2:{s:4:"type";s:5:"array";s:11:"description";s:44:"$userdata Array of user info for remote host";}}', 'auth.php', 'auth_plugin_mnet', 0),
(2, 'keepalive_server', 'auth/mnet/auth.php/keepalive_server', 'auth', 'mnet', 1, 'Receives an array of usernames from a remote machine and prods their\nsessions to keep them alive', 'a:2:{s:10:"parameters";a:1:{i:0;a:3:{s:4:"name";s:5:"array";s:4:"type";s:5:"array";s:11:"description";s:21:"An array of usernames";}}s:6:"return";a:2:{s:4:"type";s:6:"string";s:11:"description";s:28:""All ok" or an error message";}}', 'auth.php', 'auth_plugin_mnet', 0),
(3, 'kill_children', 'auth/mnet/auth.php/kill_children', 'auth', 'mnet', 1, 'The IdP uses this function to kill child sessions on other hosts', 'a:2:{s:10:"parameters";a:2:{i:0;a:3:{s:4:"name";s:8:"username";s:4:"type";s:6:"string";s:11:"description";s:28:"Username for session to kill";}i:1;a:3:{s:4:"name";s:9:"useragent";s:4:"type";s:6:"string";s:11:"description";s:0:"";}}s:6:"return";a:2:{s:4:"type";s:6:"string";s:11:"description";s:39:"A plaintext report of what has happened";}}', 'auth.php', 'auth_plugin_mnet', 0),
(4, 'refresh_log', 'auth/mnet/auth.php/refresh_log', 'auth', 'mnet', 1, 'Receives an array of log entries from an SP and adds them to the mnet_log\ntable', 'a:2:{s:10:"parameters";a:1:{i:0;a:3:{s:4:"name";s:5:"array";s:4:"type";s:5:"array";s:11:"description";s:21:"An array of usernames";}}s:6:"return";a:2:{s:4:"type";s:6:"string";s:11:"description";s:28:""All ok" or an error message";}}', 'auth.php', 'auth_plugin_mnet', 0),
(5, 'fetch_user_image', 'auth/mnet/auth.php/fetch_user_image', 'auth', 'mnet', 1, 'Returns the user''s profile image info\nIf the user exists and has a profile picture, the returned array will contain keys:\n f1          - the content of the default 100x100px image\n f1_mimetype - the mimetype of the f1 file\n f2          - the content of the 35x35px variant of the image\n f2_mimetype - the mimetype of the f2 file\nThe mimetype information was added in Moodle 2.0. In Moodle 1.x, images are always jpegs.', 'a:2:{s:10:"parameters";a:1:{i:0;a:3:{s:4:"name";s:8:"username";s:4:"type";s:3:"int";s:11:"description";s:18:"The id of the user";}}s:6:"return";a:2:{s:4:"type";s:5:"array";s:11:"description";s:84:"false if user not found, empty array if no picture exists, array with data otherwise";}}', 'auth.php', 'auth_plugin_mnet', 0),
(6, 'fetch_theme_info', 'auth/mnet/auth.php/fetch_theme_info', 'auth', 'mnet', 1, 'Returns the theme information and logo url as strings.', 'a:2:{s:10:"parameters";a:0:{}s:6:"return";a:2:{s:4:"type";s:6:"string";s:11:"description";s:14:"The theme info";}}', 'auth.php', 'auth_plugin_mnet', 0),
(7, 'update_enrolments', 'auth/mnet/auth.php/update_enrolments', 'auth', 'mnet', 1, 'Invoke this function _on_ the IDP to update it with enrolment info local to\nthe SP right after calling user_authorise()\nNormally called by the SP after calling user_authorise()', 'a:2:{s:10:"parameters";a:2:{i:0;a:3:{s:4:"name";s:8:"username";s:4:"type";s:6:"string";s:11:"description";s:12:"The username";}i:1;a:3:{s:4:"name";s:7:"courses";s:4:"type";s:5:"array";s:11:"description";s:0:"";}}s:6:"return";a:2:{s:4:"type";s:4:"bool";s:11:"description";s:0:"";}}', 'auth.php', 'auth_plugin_mnet', 0),
(8, 'keepalive_client', 'auth/mnet/auth.php/keepalive_client', 'auth', 'mnet', 1, 'Poll the IdP server to let it know that a user it has authenticated is still\nonline', 'a:2:{s:10:"parameters";a:0:{}s:6:"return";a:2:{s:4:"type";s:4:"void";s:11:"description";s:0:"";}}', 'auth.php', 'auth_plugin_mnet', 0),
(9, 'kill_child', 'auth/mnet/auth.php/kill_child', 'auth', 'mnet', 1, 'When the IdP requests that child sessions are terminated,\nthis function will be called on each of the child hosts. The machine that\ncalls the function (over xmlrpc) provides us with the mnethostid we need.', 'a:2:{s:10:"parameters";a:2:{i:0;a:3:{s:4:"name";s:8:"username";s:4:"type";s:6:"string";s:11:"description";s:28:"Username for session to kill";}i:1;a:3:{s:4:"name";s:9:"useragent";s:4:"type";s:6:"string";s:11:"description";s:0:"";}}s:6:"return";a:2:{s:4:"type";s:4:"bool";s:11:"description";s:15:"True on success";}}', 'auth.php', 'auth_plugin_mnet', 0),
(10, 'available_courses', 'enrol/mnet/enrol.php/available_courses', 'enrol', 'mnet', 1, 'Returns list of courses that we offer to the caller for remote enrolment of their users\nSince Moodle 2.0, courses are made available for MNet peers by creating an instance\nof enrol_mnet plugin for the course. Hidden courses are not returned. If there are two\ninstances - one specific for the host and one for ''All hosts'', the setting of the specific\none is used. The id of the peer is kept in customint1, no other custom fields are used.', 'a:2:{s:10:"parameters";a:0:{}s:6:"return";a:2:{s:4:"type";s:5:"array";s:11:"description";s:0:"";}}', 'enrol.php', 'enrol_mnet_mnetservice_enrol', 0),
(11, 'user_enrolments', 'enrol/mnet/enrol.php/user_enrolments', 'enrol', 'mnet', 1, 'This method has never been implemented in Moodle MNet API', 'a:2:{s:10:"parameters";a:0:{}s:6:"return";a:2:{s:4:"type";s:5:"array";s:11:"description";s:11:"empty array";}}', 'enrol.php', 'enrol_mnet_mnetservice_enrol', 0),
(12, 'enrol_user', 'enrol/mnet/enrol.php/enrol_user', 'enrol', 'mnet', 1, 'Enrol remote user to our course\nIf we do not have local record for the remote user in our database,\nit gets created here.', 'a:2:{s:10:"parameters";a:2:{i:0;a:3:{s:4:"name";s:8:"userdata";s:4:"type";s:5:"array";s:11:"description";s:14:"user details {";}i:1;a:3:{s:4:"name";s:8:"courseid";s:4:"type";s:3:"int";s:11:"description";s:19:"our local course id";}}s:6:"return";a:2:{s:4:"type";s:4:"bool";s:11:"description";s:69:"true if the enrolment has been successful, throws exception otherwise";}}', 'enrol.php', 'enrol_mnet_mnetservice_enrol', 0),
(13, 'unenrol_user', 'enrol/mnet/enrol.php/unenrol_user', 'enrol', 'mnet', 1, 'Unenrol remote user from our course\nOnly users enrolled via enrol_mnet plugin can be unenrolled remotely. If the\nremote user is enrolled into the local course via some other enrol plugin\n(enrol_manual for example), the remote host can''t touch such enrolment. Please\ndo not report this behaviour as bug, it is a feature ;-)', 'a:2:{s:10:"parameters";a:2:{i:0;a:3:{s:4:"name";s:8:"username";s:4:"type";s:6:"string";s:11:"description";s:18:"of the remote user";}i:1;a:3:{s:4:"name";s:8:"courseid";s:4:"type";s:3:"int";s:11:"description";s:0:"";}}s:6:"return";a:2:{s:4:"type";s:4:"bool";s:11:"description";s:71:"true if the unenrolment has been successful, throws exception otherwise";}}', 'enrol.php', 'enrol_mnet_mnetservice_enrol', 0),
(14, 'course_enrolments', 'enrol/mnet/enrol.php/course_enrolments', 'enrol', 'mnet', 1, 'Returns a list of users from the client server who are enrolled in our course\nSuitable instance of enrol_mnet must be created in the course. This method will not\nreturn any information about the enrolments in courses that are not available for\nremote enrolment, even if their users are enrolled into them via other plugin\n(note the difference from {@link self::user_enrolments()}).\nThis method will return enrolment information for users from hosts regardless\nthe enrolment plugin. It does not matter if the user was enrolled remotely by\ntheir admin or locally. Once the course is available for remote enrolments, we\nwill tell them everything about their users.\nIn Moodle 1.x the returned array used to be indexed by username. The side effect\nof MDL-19219 fix is that we do not need to use such index and therefore we can\nreturn all enrolment records. MNet clients 1.x will only use the last record for\nthe student, if she is enrolled via multiple plugins.', 'a:2:{s:10:"parameters";a:2:{i:0;a:3:{s:4:"name";s:8:"courseid";s:4:"type";s:3:"int";s:11:"description";s:16:"ID of our course";}i:1;a:3:{s:4:"name";s:5:"roles";s:4:"type";s:5:"array";s:11:"description";s:0:"";}}s:6:"return";a:2:{s:4:"type";s:5:"array";s:11:"description";s:0:"";}}', 'enrol.php', 'enrol_mnet_mnetservice_enrol', 0),
(15, 'fetch_file', 'portfolio/mahara/lib.php/fetch_file', 'portfolio', 'mahara', 1, 'xmlrpc (mnet) function to get the file.\nreads in the file and returns it base_64 encoded\nso that it can be enrypted by mnet.', 'a:2:{s:10:"parameters";a:1:{i:0;a:3:{s:4:"name";s:5:"token";s:4:"type";s:6:"string";s:11:"description";s:56:"the token recieved previously during send_content_intent";}}s:6:"return";a:2:{s:4:"type";s:4:"void";s:11:"description";s:0:"";}}', 'lib.php', 'portfolio_plugin_mahara', 1);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_mnet_service`
--

CREATE TABLE IF NOT EXISTS `mdl_mnet_service` (
`id` bigint(10) NOT NULL,
  `name` varchar(40) NOT NULL DEFAULT '',
  `description` varchar(40) NOT NULL DEFAULT '',
  `apiversion` varchar(10) NOT NULL DEFAULT '',
  `offer` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='A service is a group of functions';

--
-- Dumping data for table `mdl_mnet_service`
--

INSERT INTO `mdl_mnet_service` (`id`, `name`, `description`, `apiversion`, `offer`) VALUES
(1, 'sso_idp', '', '1', 1),
(2, 'sso_sp', '', '1', 1),
(3, 'mnet_enrol', '', '1', 1),
(4, 'pf', '', '1', 1);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_mnet_service2rpc`
--

CREATE TABLE IF NOT EXISTS `mdl_mnet_service2rpc` (
`id` bigint(10) NOT NULL,
  `serviceid` bigint(10) NOT NULL DEFAULT '0',
  `rpcid` bigint(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COMMENT='Group functions or methods under a service';

--
-- Dumping data for table `mdl_mnet_service2rpc`
--

INSERT INTO `mdl_mnet_service2rpc` (`id`, `serviceid`, `rpcid`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 1, 3),
(4, 1, 4),
(5, 1, 5),
(6, 1, 6),
(7, 1, 7),
(8, 2, 8),
(9, 2, 9),
(10, 3, 10),
(11, 3, 11),
(12, 3, 12),
(13, 3, 13),
(14, 3, 14),
(15, 4, 15);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_mnet_session`
--

CREATE TABLE IF NOT EXISTS `mdl_mnet_session` (
`id` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `username` varchar(100) NOT NULL DEFAULT '',
  `token` varchar(40) NOT NULL DEFAULT '',
  `mnethostid` bigint(10) NOT NULL DEFAULT '0',
  `useragent` varchar(40) NOT NULL DEFAULT '',
  `confirm_timeout` bigint(10) NOT NULL DEFAULT '0',
  `session_id` varchar(40) NOT NULL DEFAULT '',
  `expires` bigint(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Store session data from users migrating to other sites';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_mnet_sso_access_control`
--

CREATE TABLE IF NOT EXISTS `mdl_mnet_sso_access_control` (
`id` bigint(10) NOT NULL,
  `username` varchar(100) NOT NULL DEFAULT '',
  `mnet_host_id` bigint(10) NOT NULL DEFAULT '0',
  `accessctrl` varchar(20) NOT NULL DEFAULT 'allow'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Users by host permitted (or not) to login from a remote prov';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_modules`
--

CREATE TABLE IF NOT EXISTS `mdl_modules` (
`id` bigint(10) NOT NULL,
  `name` varchar(20) NOT NULL DEFAULT '',
  `cron` bigint(10) NOT NULL DEFAULT '0',
  `lastcron` bigint(10) NOT NULL DEFAULT '0',
  `search` varchar(255) NOT NULL DEFAULT '',
  `visible` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 COMMENT='modules available in the site';

--
-- Dumping data for table `mdl_modules`
--

INSERT INTO `mdl_modules` (`id`, `name`, `cron`, `lastcron`, `search`, `visible`) VALUES
(1, 'assign', 60, 1415196025, '', 1),
(2, 'assignment', 60, 0, '', 0),
(3, 'book', 0, 0, '', 1),
(4, 'chat', 300, 1415196025, '', 1),
(5, 'choice', 0, 0, '', 1),
(6, 'data', 0, 0, '', 1),
(7, 'feedback', 0, 0, '', 0),
(8, 'folder', 0, 0, '', 1),
(9, 'forum', 0, 0, '', 1),
(10, 'glossary', 0, 0, '', 1),
(11, 'imscp', 0, 0, '', 1),
(12, 'label', 0, 0, '', 1),
(13, 'lesson', 0, 0, '', 1),
(14, 'lti', 0, 0, '', 1),
(15, 'page', 0, 0, '', 1),
(16, 'quiz', 60, 1415196025, '', 1),
(17, 'resource', 0, 0, '', 1),
(18, 'scorm', 300, 1415196025, '', 1),
(19, 'survey', 0, 0, '', 1),
(20, 'url', 0, 0, '', 1),
(21, 'wiki', 0, 0, '', 1),
(22, 'workshop', 60, 1415196025, '', 1);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_my_pages`
--

CREATE TABLE IF NOT EXISTS `mdl_my_pages` (
`id` bigint(10) NOT NULL,
  `userid` bigint(10) DEFAULT '0',
  `name` varchar(200) NOT NULL DEFAULT '',
  `private` tinyint(1) NOT NULL DEFAULT '1',
  `sortorder` mediumint(6) NOT NULL DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='Extra user pages for the My Moodle system';

--
-- Dumping data for table `mdl_my_pages`
--

INSERT INTO `mdl_my_pages` (`id`, `userid`, `name`, `private`, `sortorder`) VALUES
(1, NULL, '__default', 0, 0),
(2, NULL, '__default', 1, 0),
(3, 4, '__default', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_page`
--

CREATE TABLE IF NOT EXISTS `mdl_page` (
`id` bigint(10) NOT NULL,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `intro` longtext,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `content` longtext,
  `contentformat` smallint(4) NOT NULL DEFAULT '0',
  `legacyfiles` smallint(4) NOT NULL DEFAULT '0',
  `legacyfileslast` bigint(10) DEFAULT NULL,
  `display` smallint(4) NOT NULL DEFAULT '0',
  `displayoptions` longtext,
  `revision` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Each record is one page and its config data';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_portfolio_instance`
--

CREATE TABLE IF NOT EXISTS `mdl_portfolio_instance` (
`id` bigint(10) NOT NULL,
  `plugin` varchar(50) NOT NULL DEFAULT '',
  `name` varchar(255) NOT NULL DEFAULT '',
  `visible` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='base table (not including config data) for instances of port';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_portfolio_instance_config`
--

CREATE TABLE IF NOT EXISTS `mdl_portfolio_instance_config` (
`id` bigint(10) NOT NULL,
  `instance` bigint(10) NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `value` longtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='config for portfolio plugin instances';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_portfolio_instance_user`
--

CREATE TABLE IF NOT EXISTS `mdl_portfolio_instance_user` (
`id` bigint(10) NOT NULL,
  `instance` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `value` longtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='user data for portfolio instances.';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_portfolio_log`
--

CREATE TABLE IF NOT EXISTS `mdl_portfolio_log` (
`id` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `time` bigint(10) NOT NULL,
  `portfolio` bigint(10) NOT NULL,
  `caller_class` varchar(150) NOT NULL DEFAULT '',
  `caller_file` varchar(255) NOT NULL DEFAULT '',
  `caller_component` varchar(255) DEFAULT NULL,
  `caller_sha1` varchar(255) NOT NULL DEFAULT '',
  `tempdataid` bigint(10) NOT NULL DEFAULT '0',
  `returnurl` varchar(255) NOT NULL DEFAULT '',
  `continueurl` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='log of portfolio transfers (used to later check for duplicat';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_portfolio_mahara_queue`
--

CREATE TABLE IF NOT EXISTS `mdl_portfolio_mahara_queue` (
`id` bigint(10) NOT NULL,
  `transferid` bigint(10) NOT NULL,
  `token` varchar(50) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='maps mahara tokens to transfer ids';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_portfolio_tempdata`
--

CREATE TABLE IF NOT EXISTS `mdl_portfolio_tempdata` (
`id` bigint(10) NOT NULL,
  `data` longtext,
  `expirytime` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `instance` bigint(10) DEFAULT '0',
  `queued` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='stores temporary data for portfolio exports. the id of this ';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_post`
--

CREATE TABLE IF NOT EXISTS `mdl_post` (
`id` bigint(10) NOT NULL,
  `module` varchar(20) NOT NULL DEFAULT '',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `courseid` bigint(10) NOT NULL DEFAULT '0',
  `groupid` bigint(10) NOT NULL DEFAULT '0',
  `moduleid` bigint(10) NOT NULL DEFAULT '0',
  `coursemoduleid` bigint(10) NOT NULL DEFAULT '0',
  `subject` varchar(128) NOT NULL DEFAULT '',
  `summary` longtext,
  `content` longtext,
  `uniquehash` varchar(255) NOT NULL DEFAULT '',
  `rating` bigint(10) NOT NULL DEFAULT '0',
  `format` bigint(10) NOT NULL DEFAULT '0',
  `summaryformat` tinyint(2) NOT NULL DEFAULT '0',
  `attachment` varchar(100) DEFAULT NULL,
  `publishstate` varchar(20) NOT NULL DEFAULT 'draft',
  `lastmodified` bigint(10) NOT NULL DEFAULT '0',
  `created` bigint(10) NOT NULL DEFAULT '0',
  `usermodified` bigint(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Generic post table to hold data blog entries etc in differen';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_profiling`
--

CREATE TABLE IF NOT EXISTS `mdl_profiling` (
`id` bigint(10) NOT NULL,
  `runid` varchar(32) NOT NULL DEFAULT '',
  `url` varchar(255) NOT NULL DEFAULT '',
  `data` longtext NOT NULL,
  `totalexecutiontime` bigint(10) NOT NULL,
  `totalcputime` bigint(10) NOT NULL,
  `totalcalls` bigint(10) NOT NULL,
  `totalmemory` bigint(10) NOT NULL,
  `runreference` tinyint(2) NOT NULL DEFAULT '0',
  `runcomment` varchar(255) NOT NULL DEFAULT '',
  `timecreated` bigint(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores the results of all the profiling runs';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_qtype_essay_options`
--

CREATE TABLE IF NOT EXISTS `mdl_qtype_essay_options` (
`id` bigint(10) NOT NULL,
  `questionid` bigint(10) NOT NULL,
  `responseformat` varchar(16) NOT NULL DEFAULT 'editor',
  `responserequired` tinyint(2) NOT NULL DEFAULT '1',
  `responsefieldlines` smallint(4) NOT NULL DEFAULT '15',
  `attachments` smallint(4) NOT NULL DEFAULT '0',
  `attachmentsrequired` smallint(4) NOT NULL DEFAULT '0',
  `graderinfo` longtext,
  `graderinfoformat` smallint(4) NOT NULL DEFAULT '0',
  `responsetemplate` longtext,
  `responsetemplateformat` smallint(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Extra options for essay questions.';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_qtype_match_options`
--

CREATE TABLE IF NOT EXISTS `mdl_qtype_match_options` (
`id` bigint(10) NOT NULL,
  `questionid` bigint(10) NOT NULL DEFAULT '0',
  `shuffleanswers` smallint(4) NOT NULL DEFAULT '1',
  `correctfeedback` longtext NOT NULL,
  `correctfeedbackformat` tinyint(2) NOT NULL DEFAULT '0',
  `partiallycorrectfeedback` longtext NOT NULL,
  `partiallycorrectfeedbackformat` tinyint(2) NOT NULL DEFAULT '0',
  `incorrectfeedback` longtext NOT NULL,
  `incorrectfeedbackformat` tinyint(2) NOT NULL DEFAULT '0',
  `shownumcorrect` tinyint(2) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Defines the question-type specific options for matching ques';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_qtype_match_subquestions`
--

CREATE TABLE IF NOT EXISTS `mdl_qtype_match_subquestions` (
`id` bigint(10) NOT NULL,
  `questionid` bigint(10) NOT NULL DEFAULT '0',
  `questiontext` longtext NOT NULL,
  `questiontextformat` tinyint(2) NOT NULL DEFAULT '0',
  `answertext` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='The subquestions that make up a matching question';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_qtype_multichoice_options`
--

CREATE TABLE IF NOT EXISTS `mdl_qtype_multichoice_options` (
`id` bigint(10) NOT NULL,
  `questionid` bigint(10) NOT NULL DEFAULT '0',
  `layout` smallint(4) NOT NULL DEFAULT '0',
  `single` smallint(4) NOT NULL DEFAULT '0',
  `shuffleanswers` smallint(4) NOT NULL DEFAULT '1',
  `correctfeedback` longtext NOT NULL,
  `correctfeedbackformat` tinyint(2) NOT NULL DEFAULT '0',
  `partiallycorrectfeedback` longtext NOT NULL,
  `partiallycorrectfeedbackformat` tinyint(2) NOT NULL DEFAULT '0',
  `incorrectfeedback` longtext NOT NULL,
  `incorrectfeedbackformat` tinyint(2) NOT NULL DEFAULT '0',
  `answernumbering` varchar(10) NOT NULL DEFAULT 'abc',
  `shownumcorrect` tinyint(2) NOT NULL DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='Options for multiple choice questions';

--
-- Dumping data for table `mdl_qtype_multichoice_options`
--

INSERT INTO `mdl_qtype_multichoice_options` (`id`, `questionid`, `layout`, `single`, `shuffleanswers`, `correctfeedback`, `correctfeedbackformat`, `partiallycorrectfeedback`, `partiallycorrectfeedbackformat`, `incorrectfeedback`, `incorrectfeedbackformat`, `answernumbering`, `shownumcorrect`) VALUES
(1, 1, 0, 1, 1, 'Respuesta correcta', 1, 'Respuesta parcialmente correcta.', 1, 'Respuesta incorrecta.', 1, 'abc', 1),
(2, 2, 0, 1, 1, 'Respuesta correcta', 1, 'Respuesta parcialmente correcta.', 1, 'Respuesta incorrecta.', 1, 'abc', 1);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_qtype_randomsamatch_options`
--

CREATE TABLE IF NOT EXISTS `mdl_qtype_randomsamatch_options` (
`id` bigint(10) NOT NULL,
  `questionid` bigint(10) NOT NULL DEFAULT '0',
  `choose` bigint(10) NOT NULL DEFAULT '4',
  `subcats` tinyint(2) NOT NULL DEFAULT '1',
  `correctfeedback` longtext NOT NULL,
  `correctfeedbackformat` tinyint(2) NOT NULL DEFAULT '0',
  `partiallycorrectfeedback` longtext NOT NULL,
  `partiallycorrectfeedbackformat` tinyint(2) NOT NULL DEFAULT '0',
  `incorrectfeedback` longtext NOT NULL,
  `incorrectfeedbackformat` tinyint(2) NOT NULL DEFAULT '0',
  `shownumcorrect` tinyint(2) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Info about a random short-answer matching question';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_qtype_shortanswer_options`
--

CREATE TABLE IF NOT EXISTS `mdl_qtype_shortanswer_options` (
`id` bigint(10) NOT NULL,
  `questionid` bigint(10) NOT NULL DEFAULT '0',
  `usecase` tinyint(2) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Options for short answer questions';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_question`
--

CREATE TABLE IF NOT EXISTS `mdl_question` (
`id` bigint(10) NOT NULL,
  `category` bigint(10) NOT NULL DEFAULT '0',
  `parent` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `questiontext` longtext NOT NULL,
  `questiontextformat` tinyint(2) NOT NULL DEFAULT '0',
  `generalfeedback` longtext NOT NULL,
  `generalfeedbackformat` tinyint(2) NOT NULL DEFAULT '0',
  `defaultmark` decimal(12,7) NOT NULL DEFAULT '1.0000000',
  `penalty` decimal(12,7) NOT NULL DEFAULT '0.3333333',
  `qtype` varchar(20) NOT NULL DEFAULT '',
  `length` bigint(10) NOT NULL DEFAULT '1',
  `stamp` varchar(255) NOT NULL DEFAULT '',
  `version` varchar(255) NOT NULL DEFAULT '',
  `hidden` tinyint(1) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `createdby` bigint(10) DEFAULT NULL,
  `modifiedby` bigint(10) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='The questions themselves';

--
-- Dumping data for table `mdl_question`
--

INSERT INTO `mdl_question` (`id`, `category`, `parent`, `name`, `questiontext`, `questiontextformat`, `generalfeedback`, `generalfeedbackformat`, `defaultmark`, `penalty`, `qtype`, `length`, `stamp`, `version`, `hidden`, `timecreated`, `timemodified`, `createdby`, `modifiedby`) VALUES
(1, 5, 0, '#1', '¿Cuánto es 1 + 1?<p><br></p>', 1, '', 1, 1.0000000, 0.3333333, 'multichoice', 1, 'capacita.co+141227175501+KvCEug', 'capacita.co+141227175501+vV9TNi', 0, 1419702901, 1419702901, 2, 2),
(2, 5, 0, '#2', '<p>¿Cuanto es 43 - 42?<br></p>', 1, '', 1, 1.0000000, 0.3333333, 'multichoice', 1, 'capacita.co+141227181255+JhxLIH', 'capacita.co+141227181255+AwfvLr', 0, 1419703975, 1419703975, 2, 2);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_question_answers`
--

CREATE TABLE IF NOT EXISTS `mdl_question_answers` (
`id` bigint(10) NOT NULL,
  `question` bigint(10) NOT NULL DEFAULT '0',
  `answer` longtext NOT NULL,
  `answerformat` tinyint(2) NOT NULL DEFAULT '0',
  `fraction` decimal(12,7) NOT NULL DEFAULT '0.0000000',
  `feedback` longtext NOT NULL,
  `feedbackformat` tinyint(2) NOT NULL DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='Answers, with a fractional grade (0-1) and feedback';

--
-- Dumping data for table `mdl_question_answers`
--

INSERT INTO `mdl_question_answers` (`id`, `question`, `answer`, `answerformat`, `fraction`, `feedback`, `feedbackformat`) VALUES
(1, 1, '<p>2<br></p>', 1, 1.0000000, '', 1),
(2, 1, '<p>4<br></p>', 1, 0.0000000, '', 1),
(3, 1, '<p>6<br></p>', 1, 0.0000000, '', 1),
(4, 1, '<p>8<br></p>', 1, 0.0000000, '', 1),
(5, 1, '<p>10<br></p>', 1, 0.0000000, '', 1),
(6, 2, '<p>1<br></p>', 1, 1.0000000, '', 1),
(7, 2, '<p>2<br></p>', 1, 0.0000000, '', 1),
(8, 2, '<p>3<br></p>', 1, 0.0000000, '', 1),
(9, 2, '<p>4<br></p>', 1, 0.0000000, '', 1),
(10, 2, '<p>5<br></p>', 1, 0.0000000, '', 1);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_question_attempts`
--

CREATE TABLE IF NOT EXISTS `mdl_question_attempts` (
`id` bigint(10) NOT NULL,
  `questionusageid` bigint(10) NOT NULL,
  `slot` bigint(10) NOT NULL,
  `behaviour` varchar(32) NOT NULL DEFAULT '',
  `questionid` bigint(10) NOT NULL,
  `variant` bigint(10) NOT NULL DEFAULT '1',
  `maxmark` decimal(12,7) NOT NULL,
  `minfraction` decimal(12,7) NOT NULL,
  `maxfraction` decimal(12,7) NOT NULL DEFAULT '1.0000000',
  `flagged` tinyint(1) NOT NULL DEFAULT '0',
  `questionsummary` longtext,
  `rightanswer` longtext,
  `responsesummary` longtext,
  `timemodified` bigint(10) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='Each row here corresponds to an attempt at one question, as ';

--
-- Dumping data for table `mdl_question_attempts`
--

INSERT INTO `mdl_question_attempts` (`id`, `questionusageid`, `slot`, `behaviour`, `questionid`, `variant`, `maxmark`, `minfraction`, `maxfraction`, `flagged`, `questionsummary`, `rightanswer`, `responsesummary`, `timemodified`) VALUES
(1, 1, 1, 'deferredfeedback', 1, 1, 1.0000000, 0.0000000, 1.0000000, 0, '¿Cuánto es 1 + 1?\n\n: 2\n; 4\n; 8\n; 10\n; 6\n', '2\n', '2\n', 1419704608),
(2, 1, 2, 'deferredfeedback', 2, 1, 1.0000000, 0.0000000, 1.0000000, 0, '¿Cuanto es 43 - 42?\n: 4\n; 2\n; 5\n; 1\n; 3\n', '1\n', '1\n', 1419704608);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_question_attempt_steps`
--

CREATE TABLE IF NOT EXISTS `mdl_question_attempt_steps` (
`id` bigint(10) NOT NULL,
  `questionattemptid` bigint(10) NOT NULL,
  `sequencenumber` bigint(10) NOT NULL,
  `state` varchar(13) NOT NULL DEFAULT '',
  `fraction` decimal(12,7) DEFAULT NULL,
  `timecreated` bigint(10) NOT NULL,
  `userid` bigint(10) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='Stores one step in in a question attempt. As well as the dat';

--
-- Dumping data for table `mdl_question_attempt_steps`
--

INSERT INTO `mdl_question_attempt_steps` (`id`, `questionattemptid`, `sequencenumber`, `state`, `fraction`, `timecreated`, `userid`) VALUES
(1, 1, 0, 'todo', NULL, 1419704573, 2),
(2, 2, 0, 'todo', NULL, 1419704573, 2),
(3, 2, 1, 'complete', NULL, 1419704602, 2),
(4, 1, 1, 'complete', NULL, 1419704602, 2),
(5, 1, 2, 'gradedright', 1.0000000, 1419704608, 2),
(6, 2, 2, 'gradedright', 1.0000000, 1419704608, 2);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_question_attempt_step_data`
--

CREATE TABLE IF NOT EXISTS `mdl_question_attempt_step_data` (
`id` bigint(10) NOT NULL,
  `attemptstepid` bigint(10) NOT NULL,
  `name` varchar(32) NOT NULL DEFAULT '',
  `value` longtext
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='Each question_attempt_step has an associative array of the d';

--
-- Dumping data for table `mdl_question_attempt_step_data`
--

INSERT INTO `mdl_question_attempt_step_data` (`id`, `attemptstepid`, `name`, `value`) VALUES
(1, 1, '_order', '1,2,4,5,3'),
(2, 2, '_order', '9,7,10,6,8'),
(3, 3, 'answer', '3'),
(4, 4, 'answer', '0'),
(5, 5, '-finish', '1'),
(6, 6, '-finish', '1');

-- --------------------------------------------------------

--
-- Table structure for table `mdl_question_calculated`
--

CREATE TABLE IF NOT EXISTS `mdl_question_calculated` (
`id` bigint(10) NOT NULL,
  `question` bigint(10) NOT NULL DEFAULT '0',
  `answer` bigint(10) NOT NULL DEFAULT '0',
  `tolerance` varchar(20) NOT NULL DEFAULT '0.0',
  `tolerancetype` bigint(10) NOT NULL DEFAULT '1',
  `correctanswerlength` bigint(10) NOT NULL DEFAULT '2',
  `correctanswerformat` bigint(10) NOT NULL DEFAULT '2'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Options for questions of type calculated';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_question_calculated_options`
--

CREATE TABLE IF NOT EXISTS `mdl_question_calculated_options` (
`id` bigint(10) NOT NULL,
  `question` bigint(10) NOT NULL DEFAULT '0',
  `synchronize` tinyint(2) NOT NULL DEFAULT '0',
  `single` smallint(4) NOT NULL DEFAULT '0',
  `shuffleanswers` smallint(4) NOT NULL DEFAULT '0',
  `correctfeedback` longtext,
  `correctfeedbackformat` tinyint(2) NOT NULL DEFAULT '0',
  `partiallycorrectfeedback` longtext,
  `partiallycorrectfeedbackformat` tinyint(2) NOT NULL DEFAULT '0',
  `incorrectfeedback` longtext,
  `incorrectfeedbackformat` tinyint(2) NOT NULL DEFAULT '0',
  `answernumbering` varchar(10) NOT NULL DEFAULT 'abc',
  `shownumcorrect` tinyint(2) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Options for questions of type calculated';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_question_categories`
--

CREATE TABLE IF NOT EXISTS `mdl_question_categories` (
`id` bigint(10) NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `contextid` bigint(10) NOT NULL DEFAULT '0',
  `info` longtext NOT NULL,
  `infoformat` tinyint(2) NOT NULL DEFAULT '0',
  `stamp` varchar(255) NOT NULL DEFAULT '',
  `parent` bigint(10) NOT NULL DEFAULT '0',
  `sortorder` bigint(10) NOT NULL DEFAULT '999'
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='Categories are for grouping questions';

--
-- Dumping data for table `mdl_question_categories`
--

INSERT INTO `mdl_question_categories` (`id`, `name`, `contextid`, `info`, `infoformat`, `stamp`, `parent`, `sortorder`) VALUES
(1, 'Default for Front page', 2, 'The default category for questions shared in context ''Front page''.', 0, 'capacita.co+141210164038+Zx7ONP', 0, 999),
(2, 'Default for System', 1, 'The default category for questions shared in context ''System''.', 0, 'capacita.co+141210164038+p6wi9V', 0, 999),
(3, 'Default for CP-01', 16, 'The default category for questions shared in context ''CP-01''.', 0, 'capacita.co+141227163809+KUCT9j', 0, 999),
(4, 'Default for Capacita Online', 15, 'The default category for questions shared in context ''Capacita Online''.', 0, 'capacita.co+141227163809+Jq01AB', 0, 999),
(5, 'Quiz #1', 16, '<p>Incluye los temas 1 y 2<br></p>', 1, 'capacita.co+141227164648+s513lY', 3, 999),
(6, 'Por defecto en Quiz 1', 26, 'Categoría por defecto para preguntas compartidas en el contexto Quiz 1.', 0, 'capacita.co+141227182107+vK5UTw', 0, 999);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_question_datasets`
--

CREATE TABLE IF NOT EXISTS `mdl_question_datasets` (
`id` bigint(10) NOT NULL,
  `question` bigint(10) NOT NULL DEFAULT '0',
  `datasetdefinition` bigint(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Many-many relation between questions and dataset definitions';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_question_dataset_definitions`
--

CREATE TABLE IF NOT EXISTS `mdl_question_dataset_definitions` (
`id` bigint(10) NOT NULL,
  `category` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `type` bigint(10) NOT NULL DEFAULT '0',
  `options` varchar(255) NOT NULL DEFAULT '',
  `itemcount` bigint(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Organises and stores properties for dataset items';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_question_dataset_items`
--

CREATE TABLE IF NOT EXISTS `mdl_question_dataset_items` (
`id` bigint(10) NOT NULL,
  `definition` bigint(10) NOT NULL DEFAULT '0',
  `itemnumber` bigint(10) NOT NULL DEFAULT '0',
  `value` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Individual dataset items';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_question_hints`
--

CREATE TABLE IF NOT EXISTS `mdl_question_hints` (
`id` bigint(10) NOT NULL,
  `questionid` bigint(10) NOT NULL,
  `hint` longtext NOT NULL,
  `hintformat` smallint(4) NOT NULL DEFAULT '0',
  `shownumcorrect` tinyint(1) DEFAULT NULL,
  `clearwrong` tinyint(1) DEFAULT NULL,
  `options` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores the the part of the question definition that gives di';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_question_multianswer`
--

CREATE TABLE IF NOT EXISTS `mdl_question_multianswer` (
`id` bigint(10) NOT NULL,
  `question` bigint(10) NOT NULL DEFAULT '0',
  `sequence` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Options for multianswer questions';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_question_numerical`
--

CREATE TABLE IF NOT EXISTS `mdl_question_numerical` (
`id` bigint(10) NOT NULL,
  `question` bigint(10) NOT NULL DEFAULT '0',
  `answer` bigint(10) NOT NULL DEFAULT '0',
  `tolerance` varchar(255) NOT NULL DEFAULT '0.0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Options for numerical questions.';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_question_numerical_options`
--

CREATE TABLE IF NOT EXISTS `mdl_question_numerical_options` (
`id` bigint(10) NOT NULL,
  `question` bigint(10) NOT NULL DEFAULT '0',
  `showunits` smallint(4) NOT NULL DEFAULT '0',
  `unitsleft` smallint(4) NOT NULL DEFAULT '0',
  `unitgradingtype` smallint(4) NOT NULL DEFAULT '0',
  `unitpenalty` decimal(12,7) NOT NULL DEFAULT '0.1000000'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Options for questions of type numerical This table is also u';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_question_numerical_units`
--

CREATE TABLE IF NOT EXISTS `mdl_question_numerical_units` (
`id` bigint(10) NOT NULL,
  `question` bigint(10) NOT NULL DEFAULT '0',
  `multiplier` decimal(40,20) NOT NULL DEFAULT '1.00000000000000000000',
  `unit` varchar(50) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Optional unit options for numerical questions. This table is';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_question_response_analysis`
--

CREATE TABLE IF NOT EXISTS `mdl_question_response_analysis` (
`id` bigint(10) NOT NULL,
  `hashcode` varchar(40) NOT NULL DEFAULT '',
  `whichtries` varchar(255) NOT NULL DEFAULT '',
  `timemodified` bigint(10) NOT NULL,
  `questionid` bigint(10) NOT NULL,
  `variant` bigint(10) DEFAULT NULL,
  `subqid` varchar(100) NOT NULL DEFAULT '',
  `aid` varchar(100) DEFAULT NULL,
  `response` longtext,
  `credit` decimal(15,5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Analysis of student responses given to questions.';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_question_response_count`
--

CREATE TABLE IF NOT EXISTS `mdl_question_response_count` (
`id` bigint(10) NOT NULL,
  `analysisid` bigint(10) NOT NULL,
  `try` bigint(10) NOT NULL,
  `rcount` bigint(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Count for each responses for each try at a question.';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_question_statistics`
--

CREATE TABLE IF NOT EXISTS `mdl_question_statistics` (
`id` bigint(10) NOT NULL,
  `hashcode` varchar(40) NOT NULL DEFAULT '',
  `timemodified` bigint(10) NOT NULL,
  `questionid` bigint(10) NOT NULL,
  `slot` bigint(10) DEFAULT NULL,
  `subquestion` smallint(4) NOT NULL,
  `variant` bigint(10) DEFAULT NULL,
  `s` bigint(10) NOT NULL DEFAULT '0',
  `effectiveweight` decimal(15,5) DEFAULT NULL,
  `negcovar` tinyint(2) NOT NULL DEFAULT '0',
  `discriminationindex` decimal(15,5) DEFAULT NULL,
  `discriminativeefficiency` decimal(15,5) DEFAULT NULL,
  `sd` decimal(15,10) DEFAULT NULL,
  `facility` decimal(15,10) DEFAULT NULL,
  `subquestions` longtext,
  `maxmark` decimal(12,7) DEFAULT NULL,
  `positions` longtext,
  `randomguessscore` decimal(12,7) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Statistics for individual questions used in an activity.';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_question_truefalse`
--

CREATE TABLE IF NOT EXISTS `mdl_question_truefalse` (
`id` bigint(10) NOT NULL,
  `question` bigint(10) NOT NULL DEFAULT '0',
  `trueanswer` bigint(10) NOT NULL DEFAULT '0',
  `falseanswer` bigint(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Options for True-False questions';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_question_usages`
--

CREATE TABLE IF NOT EXISTS `mdl_question_usages` (
`id` bigint(10) NOT NULL,
  `contextid` bigint(10) NOT NULL,
  `component` varchar(255) NOT NULL DEFAULT '',
  `preferredbehaviour` varchar(32) NOT NULL DEFAULT ''
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='This table''s main purpose it to assign a unique id to each a';

--
-- Dumping data for table `mdl_question_usages`
--

INSERT INTO `mdl_question_usages` (`id`, `contextid`, `component`, `preferredbehaviour`) VALUES
(1, 26, 'mod_quiz', 'deferredfeedback');

-- --------------------------------------------------------

--
-- Table structure for table `mdl_quiz`
--

CREATE TABLE IF NOT EXISTS `mdl_quiz` (
`id` bigint(10) NOT NULL,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `intro` longtext NOT NULL,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `timeopen` bigint(10) NOT NULL DEFAULT '0',
  `timeclose` bigint(10) NOT NULL DEFAULT '0',
  `timelimit` bigint(10) NOT NULL DEFAULT '0',
  `overduehandling` varchar(16) NOT NULL DEFAULT 'autoabandon',
  `graceperiod` bigint(10) NOT NULL DEFAULT '0',
  `preferredbehaviour` varchar(32) NOT NULL DEFAULT '',
  `attempts` mediumint(6) NOT NULL DEFAULT '0',
  `attemptonlast` smallint(4) NOT NULL DEFAULT '0',
  `grademethod` smallint(4) NOT NULL DEFAULT '1',
  `decimalpoints` smallint(4) NOT NULL DEFAULT '2',
  `questiondecimalpoints` smallint(4) NOT NULL DEFAULT '-1',
  `reviewattempt` mediumint(6) NOT NULL DEFAULT '0',
  `reviewcorrectness` mediumint(6) NOT NULL DEFAULT '0',
  `reviewmarks` mediumint(6) NOT NULL DEFAULT '0',
  `reviewspecificfeedback` mediumint(6) NOT NULL DEFAULT '0',
  `reviewgeneralfeedback` mediumint(6) NOT NULL DEFAULT '0',
  `reviewrightanswer` mediumint(6) NOT NULL DEFAULT '0',
  `reviewoverallfeedback` mediumint(6) NOT NULL DEFAULT '0',
  `questionsperpage` bigint(10) NOT NULL DEFAULT '0',
  `navmethod` varchar(16) NOT NULL DEFAULT 'free',
  `shufflequestions` smallint(4) NOT NULL DEFAULT '0',
  `shuffleanswers` smallint(4) NOT NULL DEFAULT '0',
  `sumgrades` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `grade` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `password` varchar(255) NOT NULL DEFAULT '',
  `subnet` varchar(255) NOT NULL DEFAULT '',
  `browsersecurity` varchar(32) NOT NULL DEFAULT '',
  `delay1` bigint(10) NOT NULL DEFAULT '0',
  `delay2` bigint(10) NOT NULL DEFAULT '0',
  `showuserpicture` smallint(4) NOT NULL DEFAULT '0',
  `showblocks` smallint(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='The settings for each quiz.';

--
-- Dumping data for table `mdl_quiz`
--

INSERT INTO `mdl_quiz` (`id`, `course`, `name`, `intro`, `introformat`, `timeopen`, `timeclose`, `timelimit`, `overduehandling`, `graceperiod`, `preferredbehaviour`, `attempts`, `attemptonlast`, `grademethod`, `decimalpoints`, `questiondecimalpoints`, `reviewattempt`, `reviewcorrectness`, `reviewmarks`, `reviewspecificfeedback`, `reviewgeneralfeedback`, `reviewrightanswer`, `reviewoverallfeedback`, `questionsperpage`, `navmethod`, `shufflequestions`, `shuffleanswers`, `sumgrades`, `grade`, `timecreated`, `timemodified`, `password`, `subnet`, `browsersecurity`, `delay1`, `delay2`, `showuserpicture`, `showblocks`) VALUES
(1, 2, 'Quiz 1', '', 1, 0, 1419963480, 0, 'autoabandon', 0, 'deferredfeedback', 3, 0, 4, 2, -1, 69904, 4368, 4368, 4368, 4368, 4368, 4368, 5, 'free', 1, 1, 2.00000, 2.00000, 0, 1419704462, '', '', '-', 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_quiz_attempts`
--

CREATE TABLE IF NOT EXISTS `mdl_quiz_attempts` (
`id` bigint(10) NOT NULL,
  `quiz` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `attempt` mediumint(6) NOT NULL DEFAULT '0',
  `uniqueid` bigint(10) NOT NULL DEFAULT '0',
  `layout` longtext NOT NULL,
  `currentpage` bigint(10) NOT NULL DEFAULT '0',
  `preview` smallint(3) NOT NULL DEFAULT '0',
  `state` varchar(16) NOT NULL DEFAULT 'inprogress',
  `timestart` bigint(10) NOT NULL DEFAULT '0',
  `timefinish` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `timecheckstate` bigint(10) DEFAULT '0',
  `sumgrades` decimal(10,5) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='Stores users attempts at quizzes.';

--
-- Dumping data for table `mdl_quiz_attempts`
--

INSERT INTO `mdl_quiz_attempts` (`id`, `quiz`, `userid`, `attempt`, `uniqueid`, `layout`, `currentpage`, `preview`, `state`, `timestart`, `timefinish`, `timemodified`, `timecheckstate`, `sumgrades`) VALUES
(1, 1, 2, 1, 1, '2,1,0', 0, 1, 'finished', 1419704573, 1419704608, 1419704608, NULL, 2.00000);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_quiz_feedback`
--

CREATE TABLE IF NOT EXISTS `mdl_quiz_feedback` (
`id` bigint(10) NOT NULL,
  `quizid` bigint(10) NOT NULL DEFAULT '0',
  `feedbacktext` longtext NOT NULL,
  `feedbacktextformat` tinyint(2) NOT NULL DEFAULT '0',
  `mingrade` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `maxgrade` decimal(10,5) NOT NULL DEFAULT '0.00000'
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='Feedback given to students based on which grade band their o';

--
-- Dumping data for table `mdl_quiz_feedback`
--

INSERT INTO `mdl_quiz_feedback` (`id`, `quizid`, `feedbacktext`, `feedbacktextformat`, `mingrade`, `maxgrade`) VALUES
(1, 1, '', 1, 0.00000, 2.20000);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_quiz_grades`
--

CREATE TABLE IF NOT EXISTS `mdl_quiz_grades` (
`id` bigint(10) NOT NULL,
  `quiz` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `grade` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `timemodified` bigint(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores the overall grade for each user on the quiz, based on';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_quiz_overrides`
--

CREATE TABLE IF NOT EXISTS `mdl_quiz_overrides` (
`id` bigint(10) NOT NULL,
  `quiz` bigint(10) NOT NULL DEFAULT '0',
  `groupid` bigint(10) DEFAULT NULL,
  `userid` bigint(10) DEFAULT NULL,
  `timeopen` bigint(10) DEFAULT NULL,
  `timeclose` bigint(10) DEFAULT NULL,
  `timelimit` bigint(10) DEFAULT NULL,
  `attempts` mediumint(6) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='The overrides to quiz settings on a per-user and per-group b';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_quiz_overview_regrades`
--

CREATE TABLE IF NOT EXISTS `mdl_quiz_overview_regrades` (
`id` bigint(10) NOT NULL,
  `questionusageid` bigint(10) NOT NULL,
  `slot` bigint(10) NOT NULL,
  `newfraction` decimal(12,7) DEFAULT NULL,
  `oldfraction` decimal(12,7) DEFAULT NULL,
  `regraded` smallint(4) NOT NULL,
  `timemodified` bigint(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='This table records which question attempts need regrading an';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_quiz_reports`
--

CREATE TABLE IF NOT EXISTS `mdl_quiz_reports` (
`id` bigint(10) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `displayorder` bigint(10) NOT NULL,
  `capability` varchar(255) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='Lists all the installed quiz reports and their display order';

--
-- Dumping data for table `mdl_quiz_reports`
--

INSERT INTO `mdl_quiz_reports` (`id`, `name`, `displayorder`, `capability`) VALUES
(1, 'grading', 6000, 'mod/quiz:grade'),
(2, 'overview', 10000, NULL),
(3, 'responses', 9000, NULL),
(4, 'statistics', 8000, 'quiz/statistics:view');

-- --------------------------------------------------------

--
-- Table structure for table `mdl_quiz_slots`
--

CREATE TABLE IF NOT EXISTS `mdl_quiz_slots` (
`id` bigint(10) NOT NULL,
  `slot` bigint(10) NOT NULL,
  `quizid` bigint(10) NOT NULL DEFAULT '0',
  `page` bigint(10) NOT NULL,
  `questionid` bigint(10) NOT NULL DEFAULT '0',
  `maxmark` decimal(12,7) NOT NULL DEFAULT '0.0000000'
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='Stores the question used in a quiz, with the order, and for ';

--
-- Dumping data for table `mdl_quiz_slots`
--

INSERT INTO `mdl_quiz_slots` (`id`, `slot`, `quizid`, `page`, `questionid`, `maxmark`) VALUES
(1, 1, 1, 1, 1, 1.0000000),
(2, 2, 1, 1, 2, 1.0000000);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_quiz_statistics`
--

CREATE TABLE IF NOT EXISTS `mdl_quiz_statistics` (
`id` bigint(10) NOT NULL,
  `hashcode` varchar(40) NOT NULL DEFAULT '',
  `whichattempts` smallint(4) NOT NULL,
  `timemodified` bigint(10) NOT NULL,
  `firstattemptscount` bigint(10) NOT NULL,
  `highestattemptscount` bigint(10) NOT NULL,
  `lastattemptscount` bigint(10) NOT NULL,
  `allattemptscount` bigint(10) NOT NULL,
  `firstattemptsavg` decimal(15,5) DEFAULT NULL,
  `highestattemptsavg` decimal(15,5) DEFAULT NULL,
  `lastattemptsavg` decimal(15,5) DEFAULT NULL,
  `allattemptsavg` decimal(15,5) DEFAULT NULL,
  `median` decimal(15,5) DEFAULT NULL,
  `standarddeviation` decimal(15,5) DEFAULT NULL,
  `skewness` decimal(15,10) DEFAULT NULL,
  `kurtosis` decimal(15,5) DEFAULT NULL,
  `cic` decimal(15,10) DEFAULT NULL,
  `errorratio` decimal(15,10) DEFAULT NULL,
  `standarderror` decimal(15,10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='table to cache results from analysis done in statistics repo';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_rating`
--

CREATE TABLE IF NOT EXISTS `mdl_rating` (
`id` bigint(10) NOT NULL,
  `contextid` bigint(10) NOT NULL,
  `component` varchar(100) NOT NULL DEFAULT '',
  `ratingarea` varchar(50) NOT NULL DEFAULT '',
  `itemid` bigint(10) NOT NULL,
  `scaleid` bigint(10) NOT NULL,
  `rating` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `timecreated` bigint(10) NOT NULL,
  `timemodified` bigint(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='moodle ratings';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_registration_hubs`
--

CREATE TABLE IF NOT EXISTS `mdl_registration_hubs` (
`id` bigint(10) NOT NULL,
  `token` varchar(255) NOT NULL DEFAULT '',
  `hubname` varchar(255) NOT NULL DEFAULT '',
  `huburl` varchar(255) NOT NULL DEFAULT '',
  `confirmed` tinyint(1) NOT NULL DEFAULT '0',
  `secret` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='hub where the site is registered on with their associated to';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_repository`
--

CREATE TABLE IF NOT EXISTS `mdl_repository` (
`id` bigint(10) NOT NULL,
  `type` varchar(255) NOT NULL DEFAULT '',
  `visible` tinyint(1) DEFAULT '1',
  `sortorder` bigint(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='This table contains one entry for every configured external ';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_repository_instances`
--

CREATE TABLE IF NOT EXISTS `mdl_repository_instances` (
`id` bigint(10) NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `typeid` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `contextid` bigint(10) NOT NULL,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `timecreated` bigint(10) DEFAULT NULL,
  `timemodified` bigint(10) DEFAULT NULL,
  `readonly` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='This table contains one entry for every configured external ';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_repository_instance_config`
--

CREATE TABLE IF NOT EXISTS `mdl_repository_instance_config` (
`id` bigint(10) NOT NULL,
  `instanceid` bigint(10) NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `value` longtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='The config for intances';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_resource`
--

CREATE TABLE IF NOT EXISTS `mdl_resource` (
`id` bigint(10) NOT NULL,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `intro` longtext,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `tobemigrated` smallint(4) NOT NULL DEFAULT '0',
  `legacyfiles` smallint(4) NOT NULL DEFAULT '0',
  `legacyfileslast` bigint(10) DEFAULT NULL,
  `display` smallint(4) NOT NULL DEFAULT '0',
  `displayoptions` longtext,
  `filterfiles` smallint(4) NOT NULL DEFAULT '0',
  `revision` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Each record is one resource and its config data';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_resource_old`
--

CREATE TABLE IF NOT EXISTS `mdl_resource_old` (
`id` bigint(10) NOT NULL,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `type` varchar(30) NOT NULL DEFAULT '',
  `reference` varchar(255) NOT NULL DEFAULT '',
  `intro` longtext,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `alltext` longtext NOT NULL,
  `popup` longtext NOT NULL,
  `options` varchar(255) NOT NULL DEFAULT '',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `oldid` bigint(10) NOT NULL,
  `cmid` bigint(10) DEFAULT NULL,
  `newmodule` varchar(50) DEFAULT NULL,
  `newid` bigint(10) DEFAULT NULL,
  `migrated` bigint(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='backup of all old resource instances from 1.9';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_role`
--

CREATE TABLE IF NOT EXISTS `mdl_role` (
`id` bigint(10) NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `shortname` varchar(100) NOT NULL DEFAULT '',
  `description` longtext NOT NULL,
  `sortorder` bigint(10) NOT NULL DEFAULT '0',
  `archetype` varchar(30) NOT NULL DEFAULT ''
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='moodle roles';

--
-- Dumping data for table `mdl_role`
--

INSERT INTO `mdl_role` (`id`, `name`, `shortname`, `description`, `sortorder`, `archetype`) VALUES
(1, '', 'manager', '', 1, 'manager'),
(2, '', 'coursecreator', '', 2, 'coursecreator'),
(3, '', 'editingteacher', '', 3, 'editingteacher'),
(4, '', 'teacher', '', 4, 'teacher'),
(5, '', 'student', '', 5, 'student'),
(6, '', 'guest', '', 6, 'guest'),
(7, '', 'user', '', 7, 'user'),
(8, '', 'frontpage', '', 8, 'frontpage'),
(9, 'Profesor Capacita', 'profcapacita', '<p>Profesor/Instructor de Capacita Online</p>', 9, 'editingteacher'),
(10, 'Estudiante Capacita', 'estcapacita', '<p>Estudiante de Capacita Online</p>', 10, 'student');

-- --------------------------------------------------------

--
-- Table structure for table `mdl_role_allow_assign`
--

CREATE TABLE IF NOT EXISTS `mdl_role_allow_assign` (
`id` bigint(10) NOT NULL,
  `roleid` bigint(10) NOT NULL DEFAULT '0',
  `allowassign` bigint(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='this defines what role can assign what role';

--
-- Dumping data for table `mdl_role_allow_assign`
--

INSERT INTO `mdl_role_allow_assign` (`id`, `roleid`, `allowassign`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 1, 3),
(4, 1, 4),
(5, 1, 5),
(6, 3, 4),
(7, 3, 5),
(8, 9, 4),
(9, 9, 5);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_role_allow_override`
--

CREATE TABLE IF NOT EXISTS `mdl_role_allow_override` (
`id` bigint(10) NOT NULL,
  `roleid` bigint(10) NOT NULL DEFAULT '0',
  `allowoverride` bigint(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COMMENT='this defines what role can override what role';

--
-- Dumping data for table `mdl_role_allow_override`
--

INSERT INTO `mdl_role_allow_override` (`id`, `roleid`, `allowoverride`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 1, 3),
(4, 1, 4),
(5, 1, 5),
(6, 1, 6),
(7, 1, 7),
(8, 1, 8),
(9, 3, 4),
(10, 3, 5),
(11, 3, 6),
(12, 9, 4),
(13, 9, 5),
(14, 9, 6);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_role_allow_switch`
--

CREATE TABLE IF NOT EXISTS `mdl_role_allow_switch` (
`id` bigint(10) NOT NULL,
  `roleid` bigint(10) NOT NULL,
  `allowswitch` bigint(10) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='This table stores which which other roles a user is allowed ';

--
-- Dumping data for table `mdl_role_allow_switch`
--

INSERT INTO `mdl_role_allow_switch` (`id`, `roleid`, `allowswitch`) VALUES
(1, 1, 3),
(2, 1, 4),
(3, 1, 5),
(4, 1, 6),
(5, 3, 4),
(6, 3, 5),
(7, 3, 6),
(8, 4, 5),
(9, 4, 6),
(10, 9, 4);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_role_assignments`
--

CREATE TABLE IF NOT EXISTS `mdl_role_assignments` (
`id` bigint(10) NOT NULL,
  `roleid` bigint(10) NOT NULL DEFAULT '0',
  `contextid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `modifierid` bigint(10) NOT NULL DEFAULT '0',
  `component` varchar(100) NOT NULL DEFAULT '',
  `itemid` bigint(10) NOT NULL DEFAULT '0',
  `sortorder` bigint(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='assigning roles in different context';

--
-- Dumping data for table `mdl_role_assignments`
--

INSERT INTO `mdl_role_assignments` (`id`, `roleid`, `contextid`, `userid`, `timemodified`, `modifierid`, `component`, `itemid`, `sortorder`) VALUES
(3, 9, 16, 3, 1415917247, 2, '', 0, 0),
(4, 10, 16, 4, 1415917274, 2, '', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_role_capabilities`
--

CREATE TABLE IF NOT EXISTS `mdl_role_capabilities` (
`id` bigint(10) NOT NULL,
  `contextid` bigint(10) NOT NULL DEFAULT '0',
  `roleid` bigint(10) NOT NULL DEFAULT '0',
  `capability` varchar(255) NOT NULL DEFAULT '',
  `permission` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `modifierid` bigint(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=2196 DEFAULT CHARSET=utf8 COMMENT='permission has to be signed, overriding a capability for a p';

--
-- Dumping data for table `mdl_role_capabilities`
--

INSERT INTO `mdl_role_capabilities` (`id`, `contextid`, `roleid`, `capability`, `permission`, `timemodified`, `modifierid`) VALUES
(1, 1, 1, 'moodle/site:readallmessages', 1, 1415060944, 0),
(2, 1, 3, 'moodle/site:readallmessages', 1, 1415060944, 0),
(3, 1, 1, 'moodle/site:sendmessage', 1, 1415060944, 0),
(4, 1, 7, 'moodle/site:sendmessage', 1, 1415060944, 0),
(5, 1, 1, 'moodle/site:approvecourse', 1, 1415060944, 0),
(6, 1, 3, 'moodle/backup:backupcourse', 1, 1415060944, 0),
(7, 1, 1, 'moodle/backup:backupcourse', 1, 1415060944, 0),
(8, 1, 3, 'moodle/backup:backupsection', 1, 1415060944, 0),
(9, 1, 1, 'moodle/backup:backupsection', 1, 1415060944, 0),
(10, 1, 3, 'moodle/backup:backupactivity', 1, 1415060944, 0),
(11, 1, 1, 'moodle/backup:backupactivity', 1, 1415060944, 0),
(12, 1, 3, 'moodle/backup:backuptargethub', 1, 1415060944, 0),
(13, 1, 1, 'moodle/backup:backuptargethub', 1, 1415060944, 0),
(14, 1, 3, 'moodle/backup:backuptargetimport', 1, 1415060944, 0),
(15, 1, 1, 'moodle/backup:backuptargetimport', 1, 1415060944, 0),
(16, 1, 3, 'moodle/backup:downloadfile', 1, 1415060944, 0),
(17, 1, 1, 'moodle/backup:downloadfile', 1, 1415060944, 0),
(18, 1, 3, 'moodle/backup:configure', 1, 1415060944, 0),
(19, 1, 1, 'moodle/backup:configure', 1, 1415060944, 0),
(20, 1, 1, 'moodle/backup:userinfo', 1, 1415060944, 0),
(21, 1, 1, 'moodle/backup:anonymise', 1, 1415060944, 0),
(22, 1, 3, 'moodle/restore:restorecourse', 1, 1415060944, 0),
(23, 1, 1, 'moodle/restore:restorecourse', 1, 1415060944, 0),
(24, 1, 3, 'moodle/restore:restoresection', 1, 1415060944, 0),
(25, 1, 1, 'moodle/restore:restoresection', 1, 1415060944, 0),
(26, 1, 3, 'moodle/restore:restoreactivity', 1, 1415060944, 0),
(27, 1, 1, 'moodle/restore:restoreactivity', 1, 1415060944, 0),
(28, 1, 3, 'moodle/restore:restoretargethub', 1, 1415060944, 0),
(29, 1, 1, 'moodle/restore:restoretargethub', 1, 1415060944, 0),
(30, 1, 3, 'moodle/restore:restoretargetimport', 1, 1415060944, 0),
(31, 1, 1, 'moodle/restore:restoretargetimport', 1, 1415060944, 0),
(32, 1, 3, 'moodle/restore:uploadfile', 1, 1415060945, 0),
(33, 1, 1, 'moodle/restore:uploadfile', 1, 1415060945, 0),
(34, 1, 3, 'moodle/restore:configure', 1, 1415060945, 0),
(35, 1, 1, 'moodle/restore:configure', 1, 1415060945, 0),
(36, 1, 2, 'moodle/restore:rolldates', 1, 1415060945, 0),
(37, 1, 1, 'moodle/restore:rolldates', 1, 1415060945, 0),
(38, 1, 1, 'moodle/restore:userinfo', 1, 1415060945, 0),
(39, 1, 1, 'moodle/restore:createuser', 1, 1415060945, 0),
(40, 1, 3, 'moodle/site:manageblocks', 1, 1415060945, 0),
(41, 1, 1, 'moodle/site:manageblocks', 1, 1415060945, 0),
(42, 1, 4, 'moodle/site:accessallgroups', 1, 1415060945, 0),
(43, 1, 3, 'moodle/site:accessallgroups', 1, 1415060945, 0),
(44, 1, 1, 'moodle/site:accessallgroups', 1, 1415060945, 0),
(45, 1, 4, 'moodle/site:viewfullnames', 1, 1415060945, 0),
(46, 1, 3, 'moodle/site:viewfullnames', 1, 1415060945, 0),
(47, 1, 1, 'moodle/site:viewfullnames', 1, 1415060945, 0),
(48, 1, 4, 'moodle/site:viewuseridentity', 1, 1415060945, 0),
(49, 1, 3, 'moodle/site:viewuseridentity', 1, 1415060945, 0),
(50, 1, 1, 'moodle/site:viewuseridentity', 1, 1415060945, 0),
(51, 1, 4, 'moodle/site:viewreports', 1, 1415060945, 0),
(52, 1, 3, 'moodle/site:viewreports', 1, 1415060945, 0),
(53, 1, 1, 'moodle/site:viewreports', 1, 1415060945, 0),
(54, 1, 3, 'moodle/site:trustcontent', 1, 1415060945, 0),
(55, 1, 1, 'moodle/site:trustcontent', 1, 1415060945, 0),
(56, 1, 1, 'moodle/site:uploadusers', 1, 1415060945, 0),
(57, 1, 3, 'moodle/filter:manage', 1, 1415060945, 0),
(58, 1, 1, 'moodle/filter:manage', 1, 1415060945, 0),
(59, 1, 1, 'moodle/user:create', 1, 1415060945, 0),
(60, 1, 1, 'moodle/user:delete', 1, 1415060945, 0),
(61, 1, 1, 'moodle/user:update', 1, 1415060945, 0),
(62, 1, 6, 'moodle/user:viewdetails', 1, 1415060945, 0),
(63, 1, 5, 'moodle/user:viewdetails', 1, 1415060945, 0),
(64, 1, 4, 'moodle/user:viewdetails', 1, 1415060945, 0),
(65, 1, 3, 'moodle/user:viewdetails', 1, 1415060945, 0),
(66, 1, 1, 'moodle/user:viewdetails', 1, 1415060945, 0),
(67, 1, 1, 'moodle/user:viewalldetails', 1, 1415060945, 0),
(68, 1, 1, 'moodle/user:viewlastip', 1, 1415060945, 0),
(69, 1, 4, 'moodle/user:viewhiddendetails', 1, 1415060945, 0),
(70, 1, 3, 'moodle/user:viewhiddendetails', 1, 1415060945, 0),
(71, 1, 1, 'moodle/user:viewhiddendetails', 1, 1415060945, 0),
(72, 1, 1, 'moodle/user:loginas', 1, 1415060945, 0),
(73, 1, 1, 'moodle/user:managesyspages', 1, 1415060945, 0),
(74, 1, 7, 'moodle/user:manageownblocks', 1, 1415060945, 0),
(75, 1, 7, 'moodle/user:manageownfiles', -1000, 1418231124, 2),
(76, 1, 1, 'moodle/my:configsyspages', 1, 1415060945, 0),
(77, 1, 3, 'moodle/role:assign', 1, 1415060945, 0),
(78, 1, 1, 'moodle/role:assign', 1, 1415060945, 0),
(79, 1, 4, 'moodle/role:review', 1, 1415060945, 0),
(80, 1, 3, 'moodle/role:review', 1, 1415060946, 0),
(81, 1, 1, 'moodle/role:review', 1, 1415060946, 0),
(82, 1, 1, 'moodle/role:override', 1, 1415060946, 0),
(83, 1, 3, 'moodle/role:safeoverride', 1, 1415060946, 0),
(84, 1, 1, 'moodle/role:manage', 1, 1415060946, 0),
(85, 1, 3, 'moodle/role:switchroles', 1, 1415060946, 0),
(86, 1, 1, 'moodle/role:switchroles', 1, 1415060946, 0),
(87, 1, 1, 'moodle/category:manage', 1, 1415060946, 0),
(88, 1, 2, 'moodle/category:viewhiddencategories', 1, 1415060946, 0),
(89, 1, 1, 'moodle/category:viewhiddencategories', 1, 1415060946, 0),
(90, 1, 1, 'moodle/cohort:manage', 1, 1415060946, 0),
(91, 1, 1, 'moodle/cohort:assign', 1, 1415060946, 0),
(92, 1, 3, 'moodle/cohort:view', 1, 1415060946, 0),
(93, 1, 1, 'moodle/cohort:view', 1, 1415060946, 0),
(94, 1, 2, 'moodle/course:create', 1, 1415060946, 0),
(95, 1, 1, 'moodle/course:create', 1, 1415060946, 0),
(96, 1, 7, 'moodle/course:request', 1, 1415060946, 0),
(97, 1, 1, 'moodle/course:delete', 1, 1415060946, 0),
(98, 1, 3, 'moodle/course:update', 1, 1415060946, 0),
(99, 1, 1, 'moodle/course:update', 1, 1415060946, 0),
(100, 1, 1, 'moodle/course:view', 1, 1415060946, 0),
(101, 1, 3, 'moodle/course:enrolreview', 1, 1415060946, 0),
(102, 1, 1, 'moodle/course:enrolreview', 1, 1415060946, 0),
(103, 1, 3, 'moodle/course:enrolconfig', 1, 1415060946, 0),
(104, 1, 1, 'moodle/course:enrolconfig', 1, 1415060946, 0),
(105, 1, 3, 'moodle/course:reviewotherusers', 1, 1415060946, 0),
(106, 1, 1, 'moodle/course:reviewotherusers', 1, 1415060946, 0),
(107, 1, 4, 'moodle/course:bulkmessaging', 1, 1415060946, 0),
(108, 1, 3, 'moodle/course:bulkmessaging', 1, 1415060946, 0),
(109, 1, 1, 'moodle/course:bulkmessaging', 1, 1415060946, 0),
(110, 1, 4, 'moodle/course:viewhiddenuserfields', 1, 1415060946, 0),
(111, 1, 3, 'moodle/course:viewhiddenuserfields', 1, 1415060946, 0),
(112, 1, 1, 'moodle/course:viewhiddenuserfields', 1, 1415060946, 0),
(113, 1, 2, 'moodle/course:viewhiddencourses', 1, 1415060946, 0),
(114, 1, 4, 'moodle/course:viewhiddencourses', 1, 1415060946, 0),
(115, 1, 3, 'moodle/course:viewhiddencourses', 1, 1415060946, 0),
(116, 1, 1, 'moodle/course:viewhiddencourses', 1, 1415060946, 0),
(117, 1, 3, 'moodle/course:visibility', 1, 1415060946, 0),
(118, 1, 1, 'moodle/course:visibility', 1, 1415060946, 0),
(119, 1, 3, 'moodle/course:managefiles', 1, 1415060946, 0),
(120, 1, 1, 'moodle/course:managefiles', 1, 1415060946, 0),
(121, 1, 3, 'moodle/course:manageactivities', 1, 1415060946, 0),
(122, 1, 1, 'moodle/course:manageactivities', 1, 1415060946, 0),
(123, 1, 3, 'moodle/course:activityvisibility', 1, 1415060946, 0),
(124, 1, 1, 'moodle/course:activityvisibility', 1, 1415060946, 0),
(125, 1, 4, 'moodle/course:viewhiddenactivities', 1, 1415060946, 0),
(126, 1, 3, 'moodle/course:viewhiddenactivities', 1, 1415060946, 0),
(127, 1, 1, 'moodle/course:viewhiddenactivities', 1, 1415060946, 0),
(128, 1, 5, 'moodle/course:viewparticipants', 1, 1415060946, 0),
(129, 1, 4, 'moodle/course:viewparticipants', 1, 1415060946, 0),
(130, 1, 3, 'moodle/course:viewparticipants', 1, 1415060946, 0),
(131, 1, 1, 'moodle/course:viewparticipants', 1, 1415060946, 0),
(132, 1, 3, 'moodle/course:changefullname', 1, 1415060946, 0),
(133, 1, 1, 'moodle/course:changefullname', 1, 1415060946, 0),
(134, 1, 3, 'moodle/course:changeshortname', 1, 1415060946, 0),
(135, 1, 1, 'moodle/course:changeshortname', 1, 1415060946, 0),
(136, 1, 3, 'moodle/course:changeidnumber', 1, 1415060946, 0),
(137, 1, 1, 'moodle/course:changeidnumber', 1, 1415060946, 0),
(138, 1, 3, 'moodle/course:changecategory', 1, 1415060946, 0),
(139, 1, 1, 'moodle/course:changecategory', 1, 1415060946, 0),
(140, 1, 3, 'moodle/course:changesummary', 1, 1415060946, 0),
(141, 1, 1, 'moodle/course:changesummary', 1, 1415060946, 0),
(142, 1, 1, 'moodle/site:viewparticipants', 1, 1415060946, 0),
(143, 1, 5, 'moodle/course:isincompletionreports', 1, 1415060946, 0),
(144, 1, 5, 'moodle/course:viewscales', 1, 1415060946, 0),
(145, 1, 4, 'moodle/course:viewscales', 1, 1415060946, 0),
(146, 1, 3, 'moodle/course:viewscales', 1, 1415060946, 0),
(147, 1, 1, 'moodle/course:viewscales', 1, 1415060946, 0),
(148, 1, 3, 'moodle/course:managescales', 1, 1415060946, 0),
(149, 1, 1, 'moodle/course:managescales', 1, 1415060946, 0),
(150, 1, 3, 'moodle/course:managegroups', 1, 1415060946, 0),
(151, 1, 1, 'moodle/course:managegroups', 1, 1415060947, 0),
(152, 1, 3, 'moodle/course:reset', 1, 1415060947, 0),
(153, 1, 1, 'moodle/course:reset', 1, 1415060947, 0),
(154, 1, 3, 'moodle/course:viewsuspendedusers', 1, 1415060947, 0),
(155, 1, 1, 'moodle/course:viewsuspendedusers', 1, 1415060947, 0),
(156, 1, 6, 'moodle/blog:view', 1, 1415060947, 0),
(157, 1, 7, 'moodle/blog:view', 1, 1415060947, 0),
(158, 1, 5, 'moodle/blog:view', 1, 1415060947, 0),
(159, 1, 4, 'moodle/blog:view', 1, 1415060947, 0),
(160, 1, 3, 'moodle/blog:view', 1, 1415060947, 0),
(161, 1, 1, 'moodle/blog:view', 1, 1415060947, 0),
(162, 1, 6, 'moodle/blog:search', 1, 1415060947, 0),
(163, 1, 7, 'moodle/blog:search', 1, 1415060947, 0),
(164, 1, 5, 'moodle/blog:search', 1, 1415060947, 0),
(165, 1, 4, 'moodle/blog:search', 1, 1415060947, 0),
(166, 1, 3, 'moodle/blog:search', 1, 1415060947, 0),
(167, 1, 1, 'moodle/blog:search', 1, 1415060947, 0),
(168, 1, 1, 'moodle/blog:viewdrafts', 1, 1415060947, 0),
(169, 1, 7, 'moodle/blog:create', 1, 1415060947, 0),
(170, 1, 1, 'moodle/blog:create', 1, 1415060947, 0),
(171, 1, 4, 'moodle/blog:manageentries', 1, 1415060947, 0),
(172, 1, 3, 'moodle/blog:manageentries', 1, 1415060947, 0),
(173, 1, 1, 'moodle/blog:manageentries', 1, 1415060947, 0),
(174, 1, 5, 'moodle/blog:manageexternal', 1, 1415060947, 0),
(175, 1, 7, 'moodle/blog:manageexternal', 1, 1415060947, 0),
(176, 1, 4, 'moodle/blog:manageexternal', 1, 1415060947, 0),
(177, 1, 3, 'moodle/blog:manageexternal', 1, 1415060947, 0),
(178, 1, 1, 'moodle/blog:manageexternal', 1, 1415060947, 0),
(179, 1, 7, 'moodle/calendar:manageownentries', 1, 1415060947, 0),
(180, 1, 1, 'moodle/calendar:manageownentries', 1, 1415060947, 0),
(181, 1, 4, 'moodle/calendar:managegroupentries', 1, 1415060947, 0),
(182, 1, 3, 'moodle/calendar:managegroupentries', 1, 1415060947, 0),
(183, 1, 1, 'moodle/calendar:managegroupentries', 1, 1415060947, 0),
(184, 1, 4, 'moodle/calendar:manageentries', 1, 1415060947, 0),
(185, 1, 3, 'moodle/calendar:manageentries', 1, 1415060947, 0),
(186, 1, 1, 'moodle/calendar:manageentries', 1, 1415060947, 0),
(187, 1, 1, 'moodle/user:editprofile', 1, 1415060948, 0),
(188, 1, 6, 'moodle/user:editownprofile', -1000, 1415060948, 0),
(189, 1, 7, 'moodle/user:editownprofile', 1, 1415060948, 0),
(190, 1, 1, 'moodle/user:editownprofile', 1, 1415060948, 0),
(191, 1, 6, 'moodle/user:changeownpassword', -1000, 1415060948, 0),
(192, 1, 7, 'moodle/user:changeownpassword', 1, 1415060948, 0),
(193, 1, 1, 'moodle/user:changeownpassword', 1, 1415060948, 0),
(194, 1, 5, 'moodle/user:readuserposts', 1, 1415060948, 0),
(195, 1, 4, 'moodle/user:readuserposts', 1, 1415060948, 0),
(196, 1, 3, 'moodle/user:readuserposts', 1, 1415060948, 0),
(197, 1, 1, 'moodle/user:readuserposts', 1, 1415060948, 0),
(198, 1, 5, 'moodle/user:readuserblogs', 1, 1415060948, 0),
(199, 1, 4, 'moodle/user:readuserblogs', 1, 1415060948, 0),
(200, 1, 3, 'moodle/user:readuserblogs', 1, 1415060948, 0),
(201, 1, 1, 'moodle/user:readuserblogs', 1, 1415060948, 0),
(202, 1, 1, 'moodle/user:editmessageprofile', 1, 1415060948, 0),
(203, 1, 6, 'moodle/user:editownmessageprofile', -1000, 1415060948, 0),
(204, 1, 7, 'moodle/user:editownmessageprofile', 1, 1415060948, 0),
(205, 1, 1, 'moodle/user:editownmessageprofile', 1, 1415060948, 0),
(206, 1, 3, 'moodle/question:managecategory', 1, 1415060948, 0),
(207, 1, 1, 'moodle/question:managecategory', 1, 1415060948, 0),
(208, 1, 3, 'moodle/question:add', 1, 1415060948, 0),
(209, 1, 1, 'moodle/question:add', 1, 1415060948, 0),
(210, 1, 3, 'moodle/question:editmine', 1, 1415060948, 0),
(211, 1, 1, 'moodle/question:editmine', 1, 1415060948, 0),
(212, 1, 3, 'moodle/question:editall', 1, 1415060948, 0),
(213, 1, 1, 'moodle/question:editall', 1, 1415060948, 0),
(214, 1, 3, 'moodle/question:viewmine', 1, 1415060948, 0),
(215, 1, 1, 'moodle/question:viewmine', 1, 1415060948, 0),
(216, 1, 3, 'moodle/question:viewall', 1, 1415060948, 0),
(217, 1, 1, 'moodle/question:viewall', 1, 1415060948, 0),
(218, 1, 3, 'moodle/question:usemine', 1, 1415060948, 0),
(219, 1, 1, 'moodle/question:usemine', 1, 1415060948, 0),
(220, 1, 3, 'moodle/question:useall', 1, 1415060948, 0),
(221, 1, 1, 'moodle/question:useall', 1, 1415060948, 0),
(222, 1, 3, 'moodle/question:movemine', 1, 1415060948, 0),
(223, 1, 1, 'moodle/question:movemine', 1, 1415060948, 0),
(224, 1, 3, 'moodle/question:moveall', 1, 1415060948, 0),
(225, 1, 1, 'moodle/question:moveall', 1, 1415060948, 0),
(226, 1, 1, 'moodle/question:config', 1, 1415060948, 0),
(227, 1, 5, 'moodle/question:flag', 1, 1415060948, 0),
(228, 1, 4, 'moodle/question:flag', 1, 1415060948, 0),
(229, 1, 3, 'moodle/question:flag', 1, 1415060948, 0),
(230, 1, 1, 'moodle/question:flag', 1, 1415060948, 0),
(231, 1, 4, 'moodle/site:doclinks', 1, 1415060948, 0),
(232, 1, 3, 'moodle/site:doclinks', 1, 1415060948, 0),
(233, 1, 1, 'moodle/site:doclinks', 1, 1415060948, 0),
(234, 1, 3, 'moodle/course:sectionvisibility', 1, 1415060948, 0),
(235, 1, 1, 'moodle/course:sectionvisibility', 1, 1415060948, 0),
(236, 1, 3, 'moodle/course:useremail', 1, 1415060948, 0),
(237, 1, 1, 'moodle/course:useremail', 1, 1415060948, 0),
(238, 1, 3, 'moodle/course:viewhiddensections', 1, 1415060948, 0),
(239, 1, 1, 'moodle/course:viewhiddensections', 1, 1415060948, 0),
(240, 1, 3, 'moodle/course:setcurrentsection', 1, 1415060948, 0),
(241, 1, 1, 'moodle/course:setcurrentsection', 1, 1415060948, 0),
(242, 1, 3, 'moodle/course:movesections', 1, 1415060948, 0),
(243, 1, 1, 'moodle/course:movesections', 1, 1415060948, 0),
(244, 1, 4, 'moodle/grade:viewall', 1, 1415060948, 0),
(245, 1, 3, 'moodle/grade:viewall', 1, 1415060948, 0),
(246, 1, 1, 'moodle/grade:viewall', 1, 1415060948, 0),
(247, 1, 5, 'moodle/grade:view', 1, 1415060948, 0),
(248, 1, 4, 'moodle/grade:viewhidden', 1, 1415060948, 0),
(249, 1, 3, 'moodle/grade:viewhidden', 1, 1415060948, 0),
(250, 1, 1, 'moodle/grade:viewhidden', 1, 1415060948, 0),
(251, 1, 3, 'moodle/grade:import', 1, 1415060948, 0),
(252, 1, 1, 'moodle/grade:import', 1, 1415060948, 0),
(253, 1, 4, 'moodle/grade:export', 1, 1415060948, 0),
(254, 1, 3, 'moodle/grade:export', 1, 1415060948, 0),
(255, 1, 1, 'moodle/grade:export', 1, 1415060948, 0),
(256, 1, 3, 'moodle/grade:manage', 1, 1415060948, 0),
(257, 1, 1, 'moodle/grade:manage', 1, 1415060948, 0),
(258, 1, 3, 'moodle/grade:edit', 1, 1415060949, 0),
(259, 1, 1, 'moodle/grade:edit', 1, 1415060949, 0),
(260, 1, 3, 'moodle/grade:managegradingforms', 1, 1415060949, 0),
(261, 1, 1, 'moodle/grade:managegradingforms', 1, 1415060949, 0),
(262, 1, 1, 'moodle/grade:sharegradingforms', 1, 1415060949, 0),
(263, 1, 1, 'moodle/grade:managesharedforms', 1, 1415060949, 0),
(264, 1, 3, 'moodle/grade:manageoutcomes', 1, 1415060949, 0),
(265, 1, 1, 'moodle/grade:manageoutcomes', 1, 1415060949, 0),
(266, 1, 3, 'moodle/grade:manageletters', 1, 1415060949, 0),
(267, 1, 1, 'moodle/grade:manageletters', 1, 1415060949, 0),
(268, 1, 3, 'moodle/grade:hide', 1, 1415060949, 0),
(269, 1, 1, 'moodle/grade:hide', 1, 1415060949, 0),
(270, 1, 3, 'moodle/grade:lock', 1, 1415060949, 0),
(271, 1, 1, 'moodle/grade:lock', 1, 1415060949, 0),
(272, 1, 3, 'moodle/grade:unlock', 1, 1415060949, 0),
(273, 1, 1, 'moodle/grade:unlock', 1, 1415060949, 0),
(274, 1, 7, 'moodle/my:manageblocks', 1, 1415060949, 0),
(275, 1, 4, 'moodle/notes:view', 1, 1415060949, 0),
(276, 1, 3, 'moodle/notes:view', 1, 1415060949, 0),
(277, 1, 1, 'moodle/notes:view', 1, 1415060949, 0),
(278, 1, 4, 'moodle/notes:manage', 1, 1415060949, 0),
(279, 1, 3, 'moodle/notes:manage', 1, 1415060949, 0),
(280, 1, 1, 'moodle/notes:manage', 1, 1415060949, 0),
(281, 1, 4, 'moodle/tag:manage', 1, 1415060949, 0),
(282, 1, 3, 'moodle/tag:manage', 1, 1415060949, 0),
(283, 1, 1, 'moodle/tag:manage', 1, 1415060949, 0),
(284, 1, 1, 'moodle/tag:create', 1, 1415060949, 0),
(285, 1, 7, 'moodle/tag:create', 1, 1418233258, 2),
(286, 1, 1, 'moodle/tag:edit', 1, 1415060949, 0),
(287, 1, 7, 'moodle/tag:edit', 1, 1418233258, 2),
(288, 1, 1, 'moodle/tag:flag', 1, 1415060949, 0),
(289, 1, 7, 'moodle/tag:flag', 1, 1418233258, 2),
(290, 1, 4, 'moodle/tag:editblocks', 1, 1415060949, 0),
(291, 1, 3, 'moodle/tag:editblocks', 1, 1415060949, 0),
(292, 1, 1, 'moodle/tag:editblocks', 1, 1415060949, 0),
(293, 1, 6, 'moodle/block:view', 1, 1415060949, 0),
(294, 1, 7, 'moodle/block:view', 1, 1415060949, 0),
(295, 1, 5, 'moodle/block:view', 1, 1415060949, 0),
(296, 1, 4, 'moodle/block:view', 1, 1415060949, 0),
(297, 1, 3, 'moodle/block:view', 1, 1415060949, 0),
(298, 1, 3, 'moodle/block:edit', 1, 1415060949, 0),
(299, 1, 1, 'moodle/block:edit', 1, 1415060949, 0),
(300, 1, 7, 'moodle/portfolio:export', 1, 1415060949, 0),
(301, 1, 5, 'moodle/portfolio:export', 1, 1415060949, 0),
(302, 1, 4, 'moodle/portfolio:export', 1, 1415060949, 0),
(303, 1, 3, 'moodle/portfolio:export', 1, 1415060949, 0),
(304, 1, 8, 'moodle/comment:view', 1, 1415060949, 0),
(305, 1, 6, 'moodle/comment:view', 1, 1415060949, 0),
(306, 1, 7, 'moodle/comment:view', 1, 1415060949, 0),
(307, 1, 5, 'moodle/comment:view', 1, 1415060949, 0),
(308, 1, 4, 'moodle/comment:view', 1, 1415060949, 0),
(309, 1, 3, 'moodle/comment:view', 1, 1415060949, 0),
(310, 1, 1, 'moodle/comment:view', 1, 1415060949, 0),
(311, 1, 7, 'moodle/comment:post', 1, 1415060949, 0),
(312, 1, 5, 'moodle/comment:post', 1, 1415060949, 0),
(313, 1, 4, 'moodle/comment:post', 1, 1415060949, 0),
(314, 1, 3, 'moodle/comment:post', 1, 1415060949, 0),
(315, 1, 1, 'moodle/comment:post', 1, 1415060950, 0),
(316, 1, 3, 'moodle/comment:delete', 1, 1415060950, 0),
(317, 1, 1, 'moodle/comment:delete', 1, 1415060950, 0),
(318, 1, 1, 'moodle/webservice:createtoken', 1, 1415060950, 0),
(319, 1, 7, 'moodle/webservice:createmobiletoken', 1, 1415060950, 0),
(320, 1, 7, 'moodle/rating:view', 1, 1415060950, 0),
(321, 1, 5, 'moodle/rating:view', 1, 1415060950, 0),
(322, 1, 4, 'moodle/rating:view', 1, 1415060950, 0),
(323, 1, 3, 'moodle/rating:view', 1, 1415060950, 0),
(324, 1, 1, 'moodle/rating:view', 1, 1415060950, 0),
(325, 1, 7, 'moodle/rating:viewany', 1, 1415060950, 0),
(326, 1, 5, 'moodle/rating:viewany', 1, 1415060950, 0),
(327, 1, 4, 'moodle/rating:viewany', 1, 1415060950, 0),
(328, 1, 3, 'moodle/rating:viewany', 1, 1415060950, 0),
(329, 1, 1, 'moodle/rating:viewany', 1, 1415060950, 0),
(330, 1, 7, 'moodle/rating:viewall', 1, 1415060950, 0),
(331, 1, 5, 'moodle/rating:viewall', 1, 1415060950, 0),
(332, 1, 4, 'moodle/rating:viewall', 1, 1415060950, 0),
(333, 1, 3, 'moodle/rating:viewall', 1, 1415060950, 0),
(334, 1, 1, 'moodle/rating:viewall', 1, 1415060950, 0),
(335, 1, 7, 'moodle/rating:rate', 1, 1415060950, 0),
(336, 1, 5, 'moodle/rating:rate', 1, 1415060950, 0),
(337, 1, 4, 'moodle/rating:rate', 1, 1415060950, 0),
(338, 1, 3, 'moodle/rating:rate', 1, 1415060950, 0),
(339, 1, 1, 'moodle/rating:rate', 1, 1415060950, 0),
(340, 1, 1, 'moodle/course:publish', 1, 1415060950, 0),
(341, 1, 4, 'moodle/course:markcomplete', 1, 1415060950, 0),
(342, 1, 3, 'moodle/course:markcomplete', 1, 1415060950, 0),
(343, 1, 1, 'moodle/course:markcomplete', 1, 1415060950, 0),
(344, 1, 1, 'moodle/community:add', 1, 1415060950, 0),
(345, 1, 4, 'moodle/community:add', 1, 1415060950, 0),
(346, 1, 3, 'moodle/community:add', 1, 1415060950, 0),
(347, 1, 1, 'moodle/community:download', 1, 1415060950, 0),
(348, 1, 3, 'moodle/community:download', 1, 1415060950, 0),
(349, 1, 1, 'moodle/badges:manageglobalsettings', 1, 1415060950, 0),
(350, 1, 7, 'moodle/badges:viewbadges', 1, 1415060950, 0),
(351, 1, 7, 'moodle/badges:manageownbadges', 1, 1415060950, 0),
(352, 1, 7, 'moodle/badges:viewotherbadges', 1, 1415060950, 0),
(353, 1, 7, 'moodle/badges:earnbadge', 1, 1415060950, 0),
(354, 1, 1, 'moodle/badges:createbadge', 1, 1415060950, 0),
(355, 1, 3, 'moodle/badges:createbadge', 1, 1415060950, 0),
(356, 1, 1, 'moodle/badges:deletebadge', 1, 1415060950, 0),
(357, 1, 3, 'moodle/badges:deletebadge', 1, 1415060950, 0),
(358, 1, 1, 'moodle/badges:configuredetails', 1, 1415060950, 0),
(359, 1, 3, 'moodle/badges:configuredetails', 1, 1415060950, 0),
(360, 1, 1, 'moodle/badges:configurecriteria', 1, 1415060950, 0),
(361, 1, 3, 'moodle/badges:configurecriteria', 1, 1415060950, 0),
(362, 1, 1, 'moodle/badges:configuremessages', 1, 1415060950, 0),
(363, 1, 3, 'moodle/badges:configuremessages', 1, 1415060950, 0),
(364, 1, 1, 'moodle/badges:awardbadge', 1, 1415060950, 0),
(365, 1, 4, 'moodle/badges:awardbadge', 1, 1415060950, 0),
(366, 1, 3, 'moodle/badges:awardbadge', 1, 1415060950, 0),
(367, 1, 1, 'moodle/badges:viewawarded', 1, 1415060950, 0),
(368, 1, 4, 'moodle/badges:viewawarded', 1, 1415060950, 0),
(369, 1, 3, 'moodle/badges:viewawarded', 1, 1415060950, 0),
(370, 1, 6, 'mod/assign:view', 1, 1415060967, 0),
(371, 1, 5, 'mod/assign:view', 1, 1415060967, 0),
(372, 1, 4, 'mod/assign:view', 1, 1415060967, 0),
(373, 1, 3, 'mod/assign:view', 1, 1415060967, 0),
(374, 1, 1, 'mod/assign:view', 1, 1415060967, 0),
(375, 1, 5, 'mod/assign:submit', 1, 1415060967, 0),
(376, 1, 4, 'mod/assign:grade', 1, 1415060967, 0),
(377, 1, 3, 'mod/assign:grade', 1, 1415060967, 0),
(378, 1, 1, 'mod/assign:grade', 1, 1415060967, 0),
(379, 1, 4, 'mod/assign:exportownsubmission', 1, 1415060967, 0),
(380, 1, 3, 'mod/assign:exportownsubmission', 1, 1415060967, 0),
(381, 1, 1, 'mod/assign:exportownsubmission', 1, 1415060967, 0),
(382, 1, 5, 'mod/assign:exportownsubmission', 1, 1415060967, 0),
(383, 1, 3, 'mod/assign:addinstance', 1, 1415060967, 0),
(384, 1, 1, 'mod/assign:addinstance', 1, 1415060967, 0),
(385, 1, 4, 'mod/assign:grantextension', 1, 1415060967, 0),
(386, 1, 3, 'mod/assign:grantextension', 1, 1415060967, 0),
(387, 1, 1, 'mod/assign:grantextension', 1, 1415060967, 0),
(388, 1, 3, 'mod/assign:revealidentities', 1, 1415060967, 0),
(389, 1, 1, 'mod/assign:revealidentities', 1, 1415060967, 0),
(390, 1, 3, 'mod/assign:reviewgrades', 1, 1415060968, 0),
(391, 1, 1, 'mod/assign:reviewgrades', 1, 1415060968, 0),
(392, 1, 3, 'mod/assign:releasegrades', 1, 1415060968, 0),
(393, 1, 1, 'mod/assign:releasegrades', 1, 1415060968, 0),
(394, 1, 3, 'mod/assign:managegrades', 1, 1415060968, 0),
(395, 1, 1, 'mod/assign:managegrades', 1, 1415060968, 0),
(396, 1, 3, 'mod/assign:manageallocations', 1, 1415060968, 0),
(397, 1, 1, 'mod/assign:manageallocations', 1, 1415060968, 0),
(398, 1, 3, 'mod/assign:viewgrades', 1, 1415060968, 0),
(399, 1, 1, 'mod/assign:viewgrades', 1, 1415060968, 0),
(400, 1, 4, 'mod/assign:viewgrades', 1, 1415060968, 0),
(401, 1, 6, 'mod/assignment:view', 1, 1415060969, 0),
(402, 1, 5, 'mod/assignment:view', 1, 1415060969, 0),
(403, 1, 4, 'mod/assignment:view', 1, 1415060969, 0),
(404, 1, 3, 'mod/assignment:view', 1, 1415060969, 0),
(405, 1, 1, 'mod/assignment:view', 1, 1415060969, 0),
(406, 1, 3, 'mod/assignment:addinstance', 1, 1415060969, 0),
(407, 1, 1, 'mod/assignment:addinstance', 1, 1415060969, 0),
(408, 1, 5, 'mod/assignment:submit', 1, 1415060969, 0),
(409, 1, 4, 'mod/assignment:grade', 1, 1415060969, 0),
(410, 1, 3, 'mod/assignment:grade', 1, 1415060969, 0),
(411, 1, 1, 'mod/assignment:grade', 1, 1415060969, 0),
(412, 1, 4, 'mod/assignment:exportownsubmission', 1, 1415060969, 0),
(413, 1, 3, 'mod/assignment:exportownsubmission', 1, 1415060969, 0),
(414, 1, 1, 'mod/assignment:exportownsubmission', 1, 1415060969, 0),
(415, 1, 5, 'mod/assignment:exportownsubmission', 1, 1415060969, 0),
(416, 1, 3, 'mod/book:addinstance', 1, 1415060969, 0),
(417, 1, 1, 'mod/book:addinstance', 1, 1415060969, 0),
(418, 1, 6, 'mod/book:read', 1, 1415060969, 0),
(419, 1, 8, 'mod/book:read', 1, 1415060969, 0),
(420, 1, 5, 'mod/book:read', 1, 1415060969, 0),
(421, 1, 4, 'mod/book:read', 1, 1415060969, 0),
(422, 1, 3, 'mod/book:read', 1, 1415060969, 0),
(423, 1, 1, 'mod/book:read', 1, 1415060969, 0),
(424, 1, 4, 'mod/book:viewhiddenchapters', 1, 1415060969, 0),
(425, 1, 3, 'mod/book:viewhiddenchapters', 1, 1415060969, 0),
(426, 1, 1, 'mod/book:viewhiddenchapters', 1, 1415060969, 0),
(427, 1, 3, 'mod/book:edit', 1, 1415060969, 0),
(428, 1, 1, 'mod/book:edit', 1, 1415060969, 0),
(429, 1, 3, 'mod/chat:addinstance', 1, 1415060970, 0),
(430, 1, 1, 'mod/chat:addinstance', 1, 1415060970, 0),
(431, 1, 5, 'mod/chat:chat', 1, 1415060970, 0),
(432, 1, 4, 'mod/chat:chat', 1, 1415060970, 0),
(433, 1, 3, 'mod/chat:chat', 1, 1415060970, 0),
(434, 1, 1, 'mod/chat:chat', 1, 1415060970, 0),
(435, 1, 5, 'mod/chat:readlog', 1, 1415060970, 0),
(436, 1, 4, 'mod/chat:readlog', 1, 1415060970, 0),
(437, 1, 3, 'mod/chat:readlog', 1, 1415060970, 0),
(438, 1, 1, 'mod/chat:readlog', 1, 1415060970, 0),
(439, 1, 4, 'mod/chat:deletelog', 1, 1415060970, 0),
(440, 1, 3, 'mod/chat:deletelog', 1, 1415060970, 0),
(441, 1, 1, 'mod/chat:deletelog', 1, 1415060970, 0),
(442, 1, 4, 'mod/chat:exportparticipatedsession', 1, 1415060970, 0),
(443, 1, 3, 'mod/chat:exportparticipatedsession', 1, 1415060970, 0),
(444, 1, 1, 'mod/chat:exportparticipatedsession', 1, 1415060970, 0),
(445, 1, 4, 'mod/chat:exportsession', 1, 1415060970, 0),
(446, 1, 3, 'mod/chat:exportsession', 1, 1415060970, 0),
(447, 1, 1, 'mod/chat:exportsession', 1, 1415060970, 0),
(448, 1, 3, 'mod/choice:addinstance', 1, 1415060971, 0),
(449, 1, 1, 'mod/choice:addinstance', 1, 1415060971, 0),
(450, 1, 5, 'mod/choice:choose', 1, 1415060971, 0),
(451, 1, 4, 'mod/choice:choose', 1, 1415060971, 0),
(452, 1, 3, 'mod/choice:choose', 1, 1415060971, 0),
(453, 1, 4, 'mod/choice:readresponses', 1, 1415060971, 0),
(454, 1, 3, 'mod/choice:readresponses', 1, 1415060971, 0),
(455, 1, 1, 'mod/choice:readresponses', 1, 1415060971, 0),
(456, 1, 4, 'mod/choice:deleteresponses', 1, 1415060971, 0),
(457, 1, 3, 'mod/choice:deleteresponses', 1, 1415060971, 0),
(458, 1, 1, 'mod/choice:deleteresponses', 1, 1415060971, 0),
(459, 1, 4, 'mod/choice:downloadresponses', 1, 1415060971, 0),
(460, 1, 3, 'mod/choice:downloadresponses', 1, 1415060971, 0),
(461, 1, 1, 'mod/choice:downloadresponses', 1, 1415060971, 0),
(462, 1, 3, 'mod/data:addinstance', 1, 1415060972, 0),
(463, 1, 1, 'mod/data:addinstance', 1, 1415060972, 0),
(464, 1, 8, 'mod/data:viewentry', 1, 1415060972, 0),
(465, 1, 6, 'mod/data:viewentry', 1, 1415060972, 0),
(466, 1, 5, 'mod/data:viewentry', 1, 1415060972, 0),
(467, 1, 4, 'mod/data:viewentry', 1, 1415060972, 0),
(468, 1, 3, 'mod/data:viewentry', 1, 1415060972, 0),
(469, 1, 1, 'mod/data:viewentry', 1, 1415060972, 0),
(470, 1, 5, 'mod/data:writeentry', 1, 1415060972, 0),
(471, 1, 4, 'mod/data:writeentry', 1, 1415060972, 0),
(472, 1, 3, 'mod/data:writeentry', 1, 1415060972, 0),
(473, 1, 1, 'mod/data:writeentry', 1, 1415060972, 0),
(474, 1, 5, 'mod/data:comment', 1, 1415060972, 0),
(475, 1, 4, 'mod/data:comment', 1, 1415060972, 0),
(476, 1, 3, 'mod/data:comment', 1, 1415060972, 0),
(477, 1, 1, 'mod/data:comment', 1, 1415060972, 0),
(478, 1, 4, 'mod/data:rate', 1, 1415060972, 0),
(479, 1, 3, 'mod/data:rate', 1, 1415060972, 0),
(480, 1, 1, 'mod/data:rate', 1, 1415060972, 0),
(481, 1, 4, 'mod/data:viewrating', 1, 1415060972, 0),
(482, 1, 3, 'mod/data:viewrating', 1, 1415060972, 0),
(483, 1, 1, 'mod/data:viewrating', 1, 1415060972, 0),
(484, 1, 4, 'mod/data:viewanyrating', 1, 1415060972, 0),
(485, 1, 3, 'mod/data:viewanyrating', 1, 1415060972, 0),
(486, 1, 1, 'mod/data:viewanyrating', 1, 1415060972, 0),
(487, 1, 4, 'mod/data:viewallratings', 1, 1415060972, 0),
(488, 1, 3, 'mod/data:viewallratings', 1, 1415060972, 0),
(489, 1, 1, 'mod/data:viewallratings', 1, 1415060972, 0),
(490, 1, 4, 'mod/data:approve', 1, 1415060972, 0),
(491, 1, 3, 'mod/data:approve', 1, 1415060972, 0),
(492, 1, 1, 'mod/data:approve', 1, 1415060972, 0),
(493, 1, 4, 'mod/data:manageentries', 1, 1415060972, 0),
(494, 1, 3, 'mod/data:manageentries', 1, 1415060972, 0),
(495, 1, 1, 'mod/data:manageentries', 1, 1415060972, 0),
(496, 1, 4, 'mod/data:managecomments', 1, 1415060972, 0),
(497, 1, 3, 'mod/data:managecomments', 1, 1415060972, 0),
(498, 1, 1, 'mod/data:managecomments', 1, 1415060972, 0),
(499, 1, 3, 'mod/data:managetemplates', 1, 1415060972, 0),
(500, 1, 1, 'mod/data:managetemplates', 1, 1415060972, 0),
(501, 1, 4, 'mod/data:viewalluserpresets', 1, 1415060972, 0),
(502, 1, 3, 'mod/data:viewalluserpresets', 1, 1415060972, 0),
(503, 1, 1, 'mod/data:viewalluserpresets', 1, 1415060972, 0),
(504, 1, 1, 'mod/data:manageuserpresets', 1, 1415060973, 0),
(505, 1, 1, 'mod/data:exportentry', 1, 1415060973, 0),
(506, 1, 4, 'mod/data:exportentry', 1, 1415060973, 0),
(507, 1, 3, 'mod/data:exportentry', 1, 1415060973, 0),
(508, 1, 1, 'mod/data:exportownentry', 1, 1415060973, 0),
(509, 1, 4, 'mod/data:exportownentry', 1, 1415060973, 0),
(510, 1, 3, 'mod/data:exportownentry', 1, 1415060973, 0),
(511, 1, 5, 'mod/data:exportownentry', 1, 1415060973, 0),
(512, 1, 1, 'mod/data:exportallentries', 1, 1415060973, 0),
(513, 1, 4, 'mod/data:exportallentries', 1, 1415060973, 0),
(514, 1, 3, 'mod/data:exportallentries', 1, 1415060973, 0),
(515, 1, 1, 'mod/data:exportuserinfo', 1, 1415060973, 0),
(516, 1, 4, 'mod/data:exportuserinfo', 1, 1415060973, 0),
(517, 1, 3, 'mod/data:exportuserinfo', 1, 1415060973, 0),
(518, 1, 3, 'mod/feedback:addinstance', 1, 1415060975, 0),
(519, 1, 1, 'mod/feedback:addinstance', 1, 1415060975, 0),
(520, 1, 6, 'mod/feedback:view', 1, 1415060975, 0),
(521, 1, 5, 'mod/feedback:view', 1, 1415060975, 0),
(522, 1, 4, 'mod/feedback:view', 1, 1415060975, 0),
(523, 1, 3, 'mod/feedback:view', 1, 1415060975, 0),
(524, 1, 1, 'mod/feedback:view', 1, 1415060975, 0),
(525, 1, 5, 'mod/feedback:complete', 1, 1415060975, 0),
(526, 1, 5, 'mod/feedback:viewanalysepage', 1, 1415060975, 0),
(527, 1, 3, 'mod/feedback:viewanalysepage', 1, 1415060975, 0),
(528, 1, 1, 'mod/feedback:viewanalysepage', 1, 1415060975, 0),
(529, 1, 3, 'mod/feedback:deletesubmissions', 1, 1415060975, 0),
(530, 1, 1, 'mod/feedback:deletesubmissions', 1, 1415060975, 0),
(531, 1, 1, 'mod/feedback:mapcourse', 1, 1415060975, 0),
(532, 1, 3, 'mod/feedback:edititems', 1, 1415060975, 0),
(533, 1, 1, 'mod/feedback:edititems', 1, 1415060975, 0),
(534, 1, 3, 'mod/feedback:createprivatetemplate', 1, 1415060975, 0),
(535, 1, 1, 'mod/feedback:createprivatetemplate', 1, 1415060975, 0),
(536, 1, 3, 'mod/feedback:createpublictemplate', 1, 1415060975, 0),
(537, 1, 1, 'mod/feedback:createpublictemplate', 1, 1415060975, 0),
(538, 1, 3, 'mod/feedback:deletetemplate', 1, 1415060975, 0),
(539, 1, 1, 'mod/feedback:deletetemplate', 1, 1415060975, 0),
(540, 1, 4, 'mod/feedback:viewreports', 1, 1415060975, 0),
(541, 1, 3, 'mod/feedback:viewreports', 1, 1415060975, 0),
(542, 1, 1, 'mod/feedback:viewreports', 1, 1415060975, 0),
(543, 1, 4, 'mod/feedback:receivemail', 1, 1415060975, 0),
(544, 1, 3, 'mod/feedback:receivemail', 1, 1415060975, 0),
(545, 1, 3, 'mod/folder:addinstance', 1, 1415060976, 0),
(546, 1, 1, 'mod/folder:addinstance', 1, 1415060976, 0),
(547, 1, 6, 'mod/folder:view', 1, 1415060976, 0),
(548, 1, 7, 'mod/folder:view', 1, 1415060976, 0),
(549, 1, 3, 'mod/folder:managefiles', 1, 1415060976, 0),
(550, 1, 3, 'mod/forum:addinstance', 1, 1415060977, 0),
(551, 1, 1, 'mod/forum:addinstance', 1, 1415060977, 0),
(552, 1, 8, 'mod/forum:viewdiscussion', 1, 1415060977, 0),
(553, 1, 6, 'mod/forum:viewdiscussion', 1, 1415060977, 0),
(554, 1, 5, 'mod/forum:viewdiscussion', 1, 1415060977, 0),
(555, 1, 4, 'mod/forum:viewdiscussion', 1, 1415060977, 0),
(556, 1, 3, 'mod/forum:viewdiscussion', 1, 1415060977, 0),
(557, 1, 1, 'mod/forum:viewdiscussion', 1, 1415060977, 0),
(558, 1, 4, 'mod/forum:viewhiddentimedposts', 1, 1415060977, 0),
(559, 1, 3, 'mod/forum:viewhiddentimedposts', 1, 1415060977, 0),
(560, 1, 1, 'mod/forum:viewhiddentimedposts', 1, 1415060977, 0),
(561, 1, 5, 'mod/forum:startdiscussion', 1, 1415060977, 0),
(562, 1, 4, 'mod/forum:startdiscussion', 1, 1415060977, 0),
(563, 1, 3, 'mod/forum:startdiscussion', 1, 1415060977, 0),
(564, 1, 1, 'mod/forum:startdiscussion', 1, 1415060977, 0),
(565, 1, 5, 'mod/forum:replypost', 1, 1415060977, 0),
(566, 1, 4, 'mod/forum:replypost', 1, 1415060977, 0),
(567, 1, 3, 'mod/forum:replypost', 1, 1415060977, 0),
(568, 1, 1, 'mod/forum:replypost', 1, 1415060977, 0),
(569, 1, 4, 'mod/forum:addnews', 1, 1415060977, 0),
(570, 1, 3, 'mod/forum:addnews', 1, 1415060977, 0),
(571, 1, 1, 'mod/forum:addnews', 1, 1415060977, 0),
(572, 1, 4, 'mod/forum:replynews', 1, 1415060977, 0),
(573, 1, 3, 'mod/forum:replynews', 1, 1415060977, 0),
(574, 1, 1, 'mod/forum:replynews', 1, 1415060977, 0),
(575, 1, 5, 'mod/forum:viewrating', 1, 1415060977, 0),
(576, 1, 4, 'mod/forum:viewrating', 1, 1415060977, 0),
(577, 1, 3, 'mod/forum:viewrating', 1, 1415060977, 0),
(578, 1, 1, 'mod/forum:viewrating', 1, 1415060977, 0),
(579, 1, 4, 'mod/forum:viewanyrating', 1, 1415060977, 0),
(580, 1, 3, 'mod/forum:viewanyrating', 1, 1415060977, 0),
(581, 1, 1, 'mod/forum:viewanyrating', 1, 1415060978, 0),
(582, 1, 4, 'mod/forum:viewallratings', 1, 1415060978, 0),
(583, 1, 3, 'mod/forum:viewallratings', 1, 1415060978, 0),
(584, 1, 1, 'mod/forum:viewallratings', 1, 1415060978, 0),
(585, 1, 4, 'mod/forum:rate', 1, 1415060978, 0),
(586, 1, 3, 'mod/forum:rate', 1, 1415060978, 0),
(587, 1, 1, 'mod/forum:rate', 1, 1415060978, 0),
(588, 1, 5, 'mod/forum:createattachment', 1, 1415060978, 0),
(589, 1, 4, 'mod/forum:createattachment', 1, 1415060978, 0),
(590, 1, 3, 'mod/forum:createattachment', 1, 1415060978, 0),
(591, 1, 1, 'mod/forum:createattachment', 1, 1415060978, 0),
(592, 1, 5, 'mod/forum:deleteownpost', 1, 1415060978, 0),
(593, 1, 4, 'mod/forum:deleteownpost', 1, 1415060978, 0),
(594, 1, 3, 'mod/forum:deleteownpost', 1, 1415060978, 0),
(595, 1, 1, 'mod/forum:deleteownpost', 1, 1415060978, 0),
(596, 1, 4, 'mod/forum:deleteanypost', 1, 1415060978, 0),
(597, 1, 3, 'mod/forum:deleteanypost', 1, 1415060978, 0),
(598, 1, 1, 'mod/forum:deleteanypost', 1, 1415060978, 0),
(599, 1, 4, 'mod/forum:splitdiscussions', 1, 1415060978, 0),
(600, 1, 3, 'mod/forum:splitdiscussions', 1, 1415060978, 0),
(601, 1, 1, 'mod/forum:splitdiscussions', 1, 1415060978, 0),
(602, 1, 4, 'mod/forum:movediscussions', 1, 1415060978, 0),
(603, 1, 3, 'mod/forum:movediscussions', 1, 1415060978, 0),
(604, 1, 1, 'mod/forum:movediscussions', 1, 1415060978, 0),
(605, 1, 4, 'mod/forum:editanypost', 1, 1415060978, 0),
(606, 1, 3, 'mod/forum:editanypost', 1, 1415060978, 0),
(607, 1, 1, 'mod/forum:editanypost', 1, 1415060978, 0),
(608, 1, 4, 'mod/forum:viewqandawithoutposting', 1, 1415060978, 0),
(609, 1, 3, 'mod/forum:viewqandawithoutposting', 1, 1415060978, 0),
(610, 1, 1, 'mod/forum:viewqandawithoutposting', 1, 1415060978, 0),
(611, 1, 4, 'mod/forum:viewsubscribers', 1, 1415060978, 0),
(612, 1, 3, 'mod/forum:viewsubscribers', 1, 1415060978, 0),
(613, 1, 1, 'mod/forum:viewsubscribers', 1, 1415060978, 0),
(614, 1, 4, 'mod/forum:managesubscriptions', 1, 1415060978, 0),
(615, 1, 3, 'mod/forum:managesubscriptions', 1, 1415060978, 0),
(616, 1, 1, 'mod/forum:managesubscriptions', 1, 1415060978, 0),
(617, 1, 4, 'mod/forum:postwithoutthrottling', 1, 1415060978, 0),
(618, 1, 3, 'mod/forum:postwithoutthrottling', 1, 1415060978, 0),
(619, 1, 1, 'mod/forum:postwithoutthrottling', 1, 1415060978, 0),
(620, 1, 4, 'mod/forum:exportdiscussion', 1, 1415060978, 0),
(621, 1, 3, 'mod/forum:exportdiscussion', 1, 1415060978, 0),
(622, 1, 1, 'mod/forum:exportdiscussion', 1, 1415060978, 0),
(623, 1, 4, 'mod/forum:exportpost', 1, 1415060978, 0),
(624, 1, 3, 'mod/forum:exportpost', 1, 1415060978, 0),
(625, 1, 1, 'mod/forum:exportpost', 1, 1415060978, 0),
(626, 1, 4, 'mod/forum:exportownpost', 1, 1415060978, 0),
(627, 1, 3, 'mod/forum:exportownpost', 1, 1415060978, 0),
(628, 1, 1, 'mod/forum:exportownpost', 1, 1415060978, 0),
(629, 1, 5, 'mod/forum:exportownpost', 1, 1415060978, 0),
(630, 1, 4, 'mod/forum:addquestion', 1, 1415060978, 0),
(631, 1, 3, 'mod/forum:addquestion', 1, 1415060978, 0),
(632, 1, 1, 'mod/forum:addquestion', 1, 1415060978, 0),
(633, 1, 5, 'mod/forum:allowforcesubscribe', 1, 1415060978, 0),
(634, 1, 4, 'mod/forum:allowforcesubscribe', 1, 1415060978, 0),
(635, 1, 3, 'mod/forum:allowforcesubscribe', 1, 1415060978, 0),
(636, 1, 8, 'mod/forum:allowforcesubscribe', 1, 1415060978, 0),
(637, 1, 3, 'mod/glossary:addinstance', 1, 1415060979, 0),
(638, 1, 1, 'mod/glossary:addinstance', 1, 1415060979, 0),
(639, 1, 8, 'mod/glossary:view', 1, 1415060979, 0),
(640, 1, 6, 'mod/glossary:view', 1, 1415060979, 0),
(641, 1, 5, 'mod/glossary:view', 1, 1415060979, 0),
(642, 1, 4, 'mod/glossary:view', 1, 1415060979, 0),
(643, 1, 3, 'mod/glossary:view', 1, 1415060979, 0),
(644, 1, 1, 'mod/glossary:view', 1, 1415060979, 0),
(645, 1, 5, 'mod/glossary:write', 1, 1415060979, 0),
(646, 1, 4, 'mod/glossary:write', 1, 1415060980, 0),
(647, 1, 3, 'mod/glossary:write', 1, 1415060980, 0),
(648, 1, 1, 'mod/glossary:write', 1, 1415060980, 0),
(649, 1, 4, 'mod/glossary:manageentries', 1, 1415060980, 0),
(650, 1, 3, 'mod/glossary:manageentries', 1, 1415060980, 0),
(651, 1, 1, 'mod/glossary:manageentries', 1, 1415060980, 0),
(652, 1, 4, 'mod/glossary:managecategories', 1, 1415060980, 0),
(653, 1, 3, 'mod/glossary:managecategories', 1, 1415060980, 0),
(654, 1, 1, 'mod/glossary:managecategories', 1, 1415060980, 0),
(655, 1, 5, 'mod/glossary:comment', 1, 1415060980, 0),
(656, 1, 4, 'mod/glossary:comment', 1, 1415060980, 0),
(657, 1, 3, 'mod/glossary:comment', 1, 1415060980, 0),
(658, 1, 1, 'mod/glossary:comment', 1, 1415060980, 0),
(659, 1, 4, 'mod/glossary:managecomments', 1, 1415060980, 0),
(660, 1, 3, 'mod/glossary:managecomments', 1, 1415060980, 0),
(661, 1, 1, 'mod/glossary:managecomments', 1, 1415060980, 0),
(662, 1, 4, 'mod/glossary:import', 1, 1415060980, 0),
(663, 1, 3, 'mod/glossary:import', 1, 1415060980, 0),
(664, 1, 1, 'mod/glossary:import', 1, 1415060980, 0),
(665, 1, 4, 'mod/glossary:export', 1, 1415060980, 0),
(666, 1, 3, 'mod/glossary:export', 1, 1415060980, 0),
(667, 1, 1, 'mod/glossary:export', 1, 1415060980, 0),
(668, 1, 4, 'mod/glossary:approve', 1, 1415060980, 0),
(669, 1, 3, 'mod/glossary:approve', 1, 1415060980, 0),
(670, 1, 1, 'mod/glossary:approve', 1, 1415060980, 0),
(671, 1, 4, 'mod/glossary:rate', 1, 1415060980, 0),
(672, 1, 3, 'mod/glossary:rate', 1, 1415060980, 0),
(673, 1, 1, 'mod/glossary:rate', 1, 1415060980, 0),
(674, 1, 4, 'mod/glossary:viewrating', 1, 1415060980, 0),
(675, 1, 3, 'mod/glossary:viewrating', 1, 1415060980, 0),
(676, 1, 1, 'mod/glossary:viewrating', 1, 1415060980, 0),
(677, 1, 4, 'mod/glossary:viewanyrating', 1, 1415060980, 0),
(678, 1, 3, 'mod/glossary:viewanyrating', 1, 1415060980, 0),
(679, 1, 1, 'mod/glossary:viewanyrating', 1, 1415060980, 0),
(680, 1, 4, 'mod/glossary:viewallratings', 1, 1415060980, 0),
(681, 1, 3, 'mod/glossary:viewallratings', 1, 1415060980, 0),
(682, 1, 1, 'mod/glossary:viewallratings', 1, 1415060980, 0),
(683, 1, 4, 'mod/glossary:exportentry', 1, 1415060980, 0),
(684, 1, 3, 'mod/glossary:exportentry', 1, 1415060980, 0),
(685, 1, 1, 'mod/glossary:exportentry', 1, 1415060980, 0),
(686, 1, 4, 'mod/glossary:exportownentry', 1, 1415060980, 0),
(687, 1, 3, 'mod/glossary:exportownentry', 1, 1415060980, 0),
(688, 1, 1, 'mod/glossary:exportownentry', 1, 1415060980, 0),
(689, 1, 5, 'mod/glossary:exportownentry', 1, 1415060980, 0),
(690, 1, 6, 'mod/imscp:view', 1, 1415060980, 0),
(691, 1, 7, 'mod/imscp:view', 1, 1415060980, 0),
(692, 1, 3, 'mod/imscp:addinstance', 1, 1415060980, 0),
(693, 1, 1, 'mod/imscp:addinstance', 1, 1415060980, 0),
(694, 1, 3, 'mod/label:addinstance', 1, 1415060981, 0),
(695, 1, 1, 'mod/label:addinstance', 1, 1415060981, 0),
(696, 1, 3, 'mod/lesson:addinstance', 1, 1415060982, 0),
(697, 1, 1, 'mod/lesson:addinstance', 1, 1415060982, 0),
(698, 1, 3, 'mod/lesson:edit', 1, 1415060982, 0),
(699, 1, 1, 'mod/lesson:edit', 1, 1415060982, 0),
(700, 1, 4, 'mod/lesson:manage', 1, 1415060982, 0),
(701, 1, 3, 'mod/lesson:manage', 1, 1415060982, 0),
(702, 1, 1, 'mod/lesson:manage', 1, 1415060982, 0),
(703, 1, 5, 'mod/lti:view', 1, 1415060983, 0),
(704, 1, 4, 'mod/lti:view', 1, 1415060983, 0),
(705, 1, 3, 'mod/lti:view', 1, 1415060983, 0),
(706, 1, 1, 'mod/lti:view', 1, 1415060983, 0),
(707, 1, 3, 'mod/lti:addinstance', 1, 1415060983, 0),
(708, 1, 1, 'mod/lti:addinstance', 1, 1415060983, 0),
(709, 1, 4, 'mod/lti:grade', 1, 1415060983, 0),
(710, 1, 3, 'mod/lti:grade', 1, 1415060983, 0),
(711, 1, 1, 'mod/lti:grade', 1, 1415060983, 0),
(712, 1, 4, 'mod/lti:manage', 1, 1415060983, 0),
(713, 1, 3, 'mod/lti:manage', 1, 1415060983, 0),
(714, 1, 1, 'mod/lti:manage', 1, 1415060983, 0),
(715, 1, 3, 'mod/lti:addcoursetool', 1, 1415060983, 0),
(716, 1, 1, 'mod/lti:addcoursetool', 1, 1415060983, 0),
(717, 1, 3, 'mod/lti:requesttooladd', 1, 1415060983, 0),
(718, 1, 1, 'mod/lti:requesttooladd', 1, 1415060983, 0),
(719, 1, 6, 'mod/page:view', 1, 1415060984, 0),
(720, 1, 7, 'mod/page:view', 1, 1415060984, 0),
(721, 1, 3, 'mod/page:addinstance', 1, 1415060984, 0),
(722, 1, 1, 'mod/page:addinstance', 1, 1415060984, 0),
(723, 1, 6, 'mod/quiz:view', 1, 1415060985, 0),
(724, 1, 5, 'mod/quiz:view', 1, 1415060985, 0),
(725, 1, 4, 'mod/quiz:view', 1, 1415060985, 0),
(726, 1, 3, 'mod/quiz:view', 1, 1415060985, 0),
(727, 1, 1, 'mod/quiz:view', 1, 1415060985, 0),
(728, 1, 3, 'mod/quiz:addinstance', 1, 1415060985, 0),
(729, 1, 1, 'mod/quiz:addinstance', 1, 1415060985, 0),
(730, 1, 5, 'mod/quiz:attempt', 1, 1415060985, 0),
(731, 1, 5, 'mod/quiz:reviewmyattempts', 1, 1415060985, 0),
(732, 1, 3, 'mod/quiz:manage', 1, 1415060985, 0),
(733, 1, 1, 'mod/quiz:manage', 1, 1415060985, 0),
(734, 1, 3, 'mod/quiz:manageoverrides', 1, 1415060985, 0),
(735, 1, 1, 'mod/quiz:manageoverrides', 1, 1415060985, 0),
(736, 1, 4, 'mod/quiz:preview', 1, 1415060985, 0),
(737, 1, 3, 'mod/quiz:preview', 1, 1415060985, 0),
(738, 1, 1, 'mod/quiz:preview', 1, 1415060985, 0),
(739, 1, 4, 'mod/quiz:grade', 1, 1415060985, 0),
(740, 1, 3, 'mod/quiz:grade', 1, 1415060985, 0),
(741, 1, 1, 'mod/quiz:grade', 1, 1415060985, 0),
(742, 1, 4, 'mod/quiz:regrade', 1, 1415060985, 0),
(743, 1, 3, 'mod/quiz:regrade', 1, 1415060985, 0),
(744, 1, 1, 'mod/quiz:regrade', 1, 1415060985, 0),
(745, 1, 4, 'mod/quiz:viewreports', 1, 1415060985, 0),
(746, 1, 3, 'mod/quiz:viewreports', 1, 1415060985, 0),
(747, 1, 1, 'mod/quiz:viewreports', 1, 1415060985, 0),
(748, 1, 3, 'mod/quiz:deleteattempts', 1, 1415060985, 0),
(749, 1, 1, 'mod/quiz:deleteattempts', 1, 1415060985, 0),
(750, 1, 6, 'mod/resource:view', 1, 1415060986, 0),
(751, 1, 7, 'mod/resource:view', 1, 1415060986, 0),
(752, 1, 3, 'mod/resource:addinstance', 1, 1415060986, 0),
(753, 1, 1, 'mod/resource:addinstance', 1, 1415060986, 0),
(754, 1, 3, 'mod/scorm:addinstance', 1, 1415060988, 0),
(755, 1, 1, 'mod/scorm:addinstance', 1, 1415060988, 0),
(756, 1, 4, 'mod/scorm:viewreport', 1, 1415060988, 0),
(757, 1, 3, 'mod/scorm:viewreport', 1, 1415060988, 0),
(758, 1, 1, 'mod/scorm:viewreport', 1, 1415060988, 0),
(759, 1, 5, 'mod/scorm:skipview', 1, 1415060988, 0),
(760, 1, 5, 'mod/scorm:savetrack', 1, 1415060988, 0),
(761, 1, 4, 'mod/scorm:savetrack', 1, 1415060988, 0),
(762, 1, 3, 'mod/scorm:savetrack', 1, 1415060988, 0),
(763, 1, 1, 'mod/scorm:savetrack', 1, 1415060988, 0),
(764, 1, 5, 'mod/scorm:viewscores', 1, 1415060988, 0),
(765, 1, 4, 'mod/scorm:viewscores', 1, 1415060988, 0),
(766, 1, 3, 'mod/scorm:viewscores', 1, 1415060988, 0),
(767, 1, 1, 'mod/scorm:viewscores', 1, 1415060989, 0),
(768, 1, 4, 'mod/scorm:deleteresponses', 1, 1415060989, 0),
(769, 1, 3, 'mod/scorm:deleteresponses', 1, 1415060989, 0),
(770, 1, 1, 'mod/scorm:deleteresponses', 1, 1415060989, 0),
(771, 1, 3, 'mod/survey:addinstance', 1, 1415060990, 0),
(772, 1, 1, 'mod/survey:addinstance', 1, 1415060990, 0),
(773, 1, 5, 'mod/survey:participate', 1, 1415060990, 0),
(774, 1, 4, 'mod/survey:participate', 1, 1415060990, 0),
(775, 1, 3, 'mod/survey:participate', 1, 1415060990, 0),
(776, 1, 1, 'mod/survey:participate', 1, 1415060990, 0),
(777, 1, 4, 'mod/survey:readresponses', 1, 1415060990, 0),
(778, 1, 3, 'mod/survey:readresponses', 1, 1415060990, 0),
(779, 1, 1, 'mod/survey:readresponses', 1, 1415060990, 0),
(780, 1, 4, 'mod/survey:download', 1, 1415060990, 0),
(781, 1, 3, 'mod/survey:download', 1, 1415060990, 0),
(782, 1, 1, 'mod/survey:download', 1, 1415060990, 0),
(783, 1, 6, 'mod/url:view', 1, 1415060991, 0),
(784, 1, 7, 'mod/url:view', 1, 1415060991, 0),
(785, 1, 3, 'mod/url:addinstance', 1, 1415060991, 0),
(786, 1, 1, 'mod/url:addinstance', 1, 1415060991, 0),
(787, 1, 3, 'mod/wiki:addinstance', 1, 1415060992, 0),
(788, 1, 1, 'mod/wiki:addinstance', 1, 1415060992, 0),
(789, 1, 6, 'mod/wiki:viewpage', 1, 1415060992, 0),
(790, 1, 5, 'mod/wiki:viewpage', 1, 1415060992, 0),
(791, 1, 4, 'mod/wiki:viewpage', 1, 1415060992, 0),
(792, 1, 3, 'mod/wiki:viewpage', 1, 1415060992, 0),
(793, 1, 1, 'mod/wiki:viewpage', 1, 1415060992, 0),
(794, 1, 5, 'mod/wiki:editpage', 1, 1415060992, 0),
(795, 1, 4, 'mod/wiki:editpage', 1, 1415060992, 0),
(796, 1, 3, 'mod/wiki:editpage', 1, 1415060992, 0),
(797, 1, 1, 'mod/wiki:editpage', 1, 1415060992, 0),
(798, 1, 5, 'mod/wiki:createpage', 1, 1415060992, 0),
(799, 1, 4, 'mod/wiki:createpage', 1, 1415060992, 0),
(800, 1, 3, 'mod/wiki:createpage', 1, 1415060992, 0),
(801, 1, 1, 'mod/wiki:createpage', 1, 1415060992, 0),
(802, 1, 5, 'mod/wiki:viewcomment', 1, 1415060992, 0),
(803, 1, 4, 'mod/wiki:viewcomment', 1, 1415060992, 0),
(804, 1, 3, 'mod/wiki:viewcomment', 1, 1415060992, 0),
(805, 1, 1, 'mod/wiki:viewcomment', 1, 1415060992, 0),
(806, 1, 5, 'mod/wiki:editcomment', 1, 1415060992, 0),
(807, 1, 4, 'mod/wiki:editcomment', 1, 1415060992, 0),
(808, 1, 3, 'mod/wiki:editcomment', 1, 1415060992, 0),
(809, 1, 1, 'mod/wiki:editcomment', 1, 1415060992, 0),
(810, 1, 4, 'mod/wiki:managecomment', 1, 1415060992, 0),
(811, 1, 3, 'mod/wiki:managecomment', 1, 1415060992, 0),
(812, 1, 1, 'mod/wiki:managecomment', 1, 1415060992, 0),
(813, 1, 4, 'mod/wiki:managefiles', 1, 1415060992, 0),
(814, 1, 3, 'mod/wiki:managefiles', 1, 1415060992, 0),
(815, 1, 1, 'mod/wiki:managefiles', 1, 1415060992, 0),
(816, 1, 4, 'mod/wiki:overridelock', 1, 1415060992, 0),
(817, 1, 3, 'mod/wiki:overridelock', 1, 1415060992, 0),
(818, 1, 1, 'mod/wiki:overridelock', 1, 1415060992, 0),
(819, 1, 4, 'mod/wiki:managewiki', 1, 1415060992, 0),
(820, 1, 3, 'mod/wiki:managewiki', 1, 1415060992, 0),
(821, 1, 1, 'mod/wiki:managewiki', 1, 1415060992, 0),
(822, 1, 6, 'mod/workshop:view', 1, 1415060996, 0),
(823, 1, 5, 'mod/workshop:view', 1, 1415060996, 0),
(824, 1, 4, 'mod/workshop:view', 1, 1415060996, 0),
(825, 1, 3, 'mod/workshop:view', 1, 1415060996, 0),
(826, 1, 1, 'mod/workshop:view', 1, 1415060996, 0),
(827, 1, 3, 'mod/workshop:addinstance', 1, 1415060996, 0),
(828, 1, 1, 'mod/workshop:addinstance', 1, 1415060996, 0),
(829, 1, 4, 'mod/workshop:switchphase', 1, 1415060996, 0),
(830, 1, 3, 'mod/workshop:switchphase', 1, 1415060996, 0),
(831, 1, 1, 'mod/workshop:switchphase', 1, 1415060996, 0),
(832, 1, 3, 'mod/workshop:editdimensions', 1, 1415060996, 0),
(833, 1, 1, 'mod/workshop:editdimensions', 1, 1415060996, 0),
(834, 1, 5, 'mod/workshop:submit', 1, 1415060996, 0),
(835, 1, 5, 'mod/workshop:peerassess', 1, 1415060996, 0),
(836, 1, 4, 'mod/workshop:manageexamples', 1, 1415060996, 0),
(837, 1, 3, 'mod/workshop:manageexamples', 1, 1415060996, 0),
(838, 1, 1, 'mod/workshop:manageexamples', 1, 1415060996, 0),
(839, 1, 4, 'mod/workshop:allocate', 1, 1415060997, 0),
(840, 1, 3, 'mod/workshop:allocate', 1, 1415060997, 0),
(841, 1, 1, 'mod/workshop:allocate', 1, 1415060997, 0),
(842, 1, 4, 'mod/workshop:publishsubmissions', 1, 1415060997, 0),
(843, 1, 3, 'mod/workshop:publishsubmissions', 1, 1415060997, 0),
(844, 1, 1, 'mod/workshop:publishsubmissions', 1, 1415060997, 0),
(845, 1, 5, 'mod/workshop:viewauthornames', 1, 1415060997, 0),
(846, 1, 4, 'mod/workshop:viewauthornames', 1, 1415060997, 0),
(847, 1, 3, 'mod/workshop:viewauthornames', 1, 1415060997, 0),
(848, 1, 1, 'mod/workshop:viewauthornames', 1, 1415060997, 0),
(849, 1, 4, 'mod/workshop:viewreviewernames', 1, 1415060997, 0),
(850, 1, 3, 'mod/workshop:viewreviewernames', 1, 1415060997, 0),
(851, 1, 1, 'mod/workshop:viewreviewernames', 1, 1415060997, 0),
(852, 1, 4, 'mod/workshop:viewallsubmissions', 1, 1415060997, 0),
(853, 1, 3, 'mod/workshop:viewallsubmissions', 1, 1415060997, 0),
(854, 1, 1, 'mod/workshop:viewallsubmissions', 1, 1415060997, 0),
(855, 1, 5, 'mod/workshop:viewpublishedsubmissions', 1, 1415060997, 0),
(856, 1, 4, 'mod/workshop:viewpublishedsubmissions', 1, 1415060997, 0),
(857, 1, 3, 'mod/workshop:viewpublishedsubmissions', 1, 1415060997, 0),
(858, 1, 1, 'mod/workshop:viewpublishedsubmissions', 1, 1415060997, 0),
(859, 1, 5, 'mod/workshop:viewauthorpublished', 1, 1415060997, 0),
(860, 1, 4, 'mod/workshop:viewauthorpublished', 1, 1415060997, 0),
(861, 1, 3, 'mod/workshop:viewauthorpublished', 1, 1415060997, 0),
(862, 1, 1, 'mod/workshop:viewauthorpublished', 1, 1415060998, 0),
(863, 1, 4, 'mod/workshop:viewallassessments', 1, 1415060998, 0),
(864, 1, 3, 'mod/workshop:viewallassessments', 1, 1415060998, 0),
(865, 1, 1, 'mod/workshop:viewallassessments', 1, 1415060998, 0),
(866, 1, 4, 'mod/workshop:overridegrades', 1, 1415060998, 0),
(867, 1, 3, 'mod/workshop:overridegrades', 1, 1415060998, 0),
(868, 1, 1, 'mod/workshop:overridegrades', 1, 1415060998, 0),
(869, 1, 4, 'mod/workshop:ignoredeadlines', 1, 1415060998, 0),
(870, 1, 3, 'mod/workshop:ignoredeadlines', 1, 1415060998, 0),
(871, 1, 1, 'mod/workshop:ignoredeadlines', 1, 1415060998, 0),
(872, 1, 3, 'enrol/cohort:config', 1, 1415061002, 0),
(873, 1, 1, 'enrol/cohort:config', 1, 1415061002, 0),
(874, 1, 1, 'enrol/cohort:unenrol', 1, 1415061002, 0),
(875, 1, 1, 'enrol/database:unenrol', 1, 1415061002, 0),
(876, 1, 1, 'enrol/guest:config', 1, 1415061002, 0),
(877, 1, 3, 'enrol/guest:config', 1, 1415061002, 0),
(878, 1, 1, 'enrol/ldap:manage', 1, 1415061002, 0),
(879, 1, 1, 'enrol/manual:config', 1, 1415061002, 0),
(880, 1, 1, 'enrol/manual:enrol', 1, 1415061002, 0),
(881, 1, 3, 'enrol/manual:enrol', 1, 1415061002, 0),
(882, 1, 1, 'enrol/manual:manage', 1, 1415061002, 0),
(883, 1, 3, 'enrol/manual:manage', 1, 1415061002, 0),
(884, 1, 1, 'enrol/manual:unenrol', 1, 1415061002, 0),
(885, 1, 3, 'enrol/manual:unenrol', 1, 1415061002, 0),
(886, 1, 1, 'enrol/meta:config', 1, 1415061003, 0),
(887, 1, 3, 'enrol/meta:config', 1, 1415061003, 0),
(888, 1, 1, 'enrol/meta:selectaslinked', 1, 1415061003, 0),
(889, 1, 1, 'enrol/meta:unenrol', 1, 1415061003, 0),
(890, 1, 1, 'enrol/paypal:config', 1, 1415061003, 0),
(891, 1, 1, 'enrol/paypal:manage', 1, 1415061003, 0),
(892, 1, 3, 'enrol/paypal:manage', 1, 1415061003, 0),
(893, 1, 1, 'enrol/paypal:unenrol', 1, 1415061003, 0),
(894, 1, 3, 'enrol/self:config', 1, 1415061003, 0),
(895, 1, 1, 'enrol/self:config', 1, 1415061003, 0),
(896, 1, 3, 'enrol/self:manage', 1, 1415061003, 0),
(897, 1, 1, 'enrol/self:manage', 1, 1415061003, 0);
INSERT INTO `mdl_role_capabilities` (`id`, `contextid`, `roleid`, `capability`, `permission`, `timemodified`, `modifierid`) VALUES
(898, 1, 5, 'enrol/self:unenrolself', 1, 1415061003, 0),
(899, 1, 3, 'enrol/self:unenrol', 1, 1415061003, 0),
(900, 1, 1, 'enrol/self:unenrol', 1, 1415061003, 0),
(901, 1, 7, 'message/airnotifier:managedevice', 1, 1415061004, 0),
(902, 1, 3, 'block/activity_modules:addinstance', 1, 1415061005, 0),
(903, 1, 1, 'block/activity_modules:addinstance', 1, 1415061005, 0),
(904, 1, 7, 'block/admin_bookmarks:myaddinstance', 1, 1415061005, 0),
(905, 1, 3, 'block/admin_bookmarks:addinstance', 1, 1415061005, 0),
(906, 1, 1, 'block/admin_bookmarks:addinstance', 1, 1415061005, 0),
(907, 1, 3, 'block/badges:addinstance', 1, 1415061005, 0),
(908, 1, 1, 'block/badges:addinstance', 1, 1415061005, 0),
(909, 1, 7, 'block/badges:myaddinstance', 1, 1415061005, 0),
(910, 1, 3, 'block/blog_menu:addinstance', 1, 1415061006, 0),
(911, 1, 1, 'block/blog_menu:addinstance', 1, 1415061006, 0),
(912, 1, 3, 'block/blog_recent:addinstance', 1, 1415061006, 0),
(913, 1, 1, 'block/blog_recent:addinstance', 1, 1415061006, 0),
(914, 1, 3, 'block/blog_tags:addinstance', 1, 1415061006, 0),
(915, 1, 1, 'block/blog_tags:addinstance', 1, 1415061006, 0),
(916, 1, 7, 'block/calendar_month:myaddinstance', 1, 1415061006, 0),
(917, 1, 3, 'block/calendar_month:addinstance', 1, 1415061006, 0),
(918, 1, 1, 'block/calendar_month:addinstance', 1, 1415061006, 0),
(919, 1, 7, 'block/calendar_upcoming:myaddinstance', 1, 1415061006, 0),
(920, 1, 3, 'block/calendar_upcoming:addinstance', 1, 1415061006, 0),
(921, 1, 1, 'block/calendar_upcoming:addinstance', 1, 1415061006, 0),
(922, 1, 7, 'block/comments:myaddinstance', 1, 1415061006, 0),
(923, 1, 3, 'block/comments:addinstance', 1, 1415061006, 0),
(924, 1, 1, 'block/comments:addinstance', 1, 1415061006, 0),
(925, 1, 7, 'block/community:myaddinstance', 1, 1415061006, 0),
(926, 1, 3, 'block/community:addinstance', 1, 1415061006, 0),
(927, 1, 1, 'block/community:addinstance', 1, 1415061006, 0),
(928, 1, 3, 'block/completionstatus:addinstance', 1, 1415061006, 0),
(929, 1, 1, 'block/completionstatus:addinstance', 1, 1415061006, 0),
(930, 1, 7, 'block/course_list:myaddinstance', 1, 1415061006, 0),
(931, 1, 3, 'block/course_list:addinstance', 1, 1415061006, 0),
(932, 1, 1, 'block/course_list:addinstance', 1, 1415061006, 0),
(933, 1, 7, 'block/course_overview:myaddinstance', 1, 1415061006, 0),
(934, 1, 3, 'block/course_overview:addinstance', 1, 1415061006, 0),
(935, 1, 1, 'block/course_overview:addinstance', 1, 1415061006, 0),
(936, 1, 3, 'block/course_summary:addinstance', 1, 1415061007, 0),
(937, 1, 1, 'block/course_summary:addinstance', 1, 1415061007, 0),
(938, 1, 3, 'block/feedback:addinstance', 1, 1415061007, 0),
(939, 1, 1, 'block/feedback:addinstance', 1, 1415061007, 0),
(940, 1, 7, 'block/glossary_random:myaddinstance', 1, 1415061007, 0),
(941, 1, 3, 'block/glossary_random:addinstance', 1, 1415061007, 0),
(942, 1, 1, 'block/glossary_random:addinstance', 1, 1415061007, 0),
(943, 1, 7, 'block/html:myaddinstance', 1, 1415061007, 0),
(944, 1, 3, 'block/html:addinstance', 1, 1415061007, 0),
(945, 1, 1, 'block/html:addinstance', 1, 1415061007, 0),
(946, 1, 3, 'block/login:addinstance', 1, 1415061007, 0),
(947, 1, 1, 'block/login:addinstance', 1, 1415061007, 0),
(948, 1, 7, 'block/mentees:myaddinstance', 1, 1415061007, 0),
(949, 1, 3, 'block/mentees:addinstance', 1, 1415061007, 0),
(950, 1, 1, 'block/mentees:addinstance', 1, 1415061007, 0),
(951, 1, 7, 'block/messages:myaddinstance', 1, 1415061007, 0),
(952, 1, 3, 'block/messages:addinstance', 1, 1415061007, 0),
(953, 1, 1, 'block/messages:addinstance', 1, 1415061007, 0),
(954, 1, 7, 'block/mnet_hosts:myaddinstance', 1, 1415061007, 0),
(955, 1, 3, 'block/mnet_hosts:addinstance', 1, 1415061007, 0),
(956, 1, 1, 'block/mnet_hosts:addinstance', 1, 1415061007, 0),
(957, 1, 7, 'block/myprofile:myaddinstance', 1, 1415061007, 0),
(958, 1, 3, 'block/myprofile:addinstance', 1, 1415061007, 0),
(959, 1, 1, 'block/myprofile:addinstance', 1, 1415061007, 0),
(960, 1, 7, 'block/navigation:myaddinstance', 1, 1415061008, 0),
(961, 1, 3, 'block/navigation:addinstance', 1, 1415061008, 0),
(962, 1, 1, 'block/navigation:addinstance', 1, 1415061008, 0),
(963, 1, 7, 'block/news_items:myaddinstance', 1, 1415061008, 0),
(964, 1, 3, 'block/news_items:addinstance', 1, 1415061008, 0),
(965, 1, 1, 'block/news_items:addinstance', 1, 1415061008, 0),
(966, 1, 7, 'block/online_users:myaddinstance', 1, 1415061008, 0),
(967, 1, 3, 'block/online_users:addinstance', 1, 1415061008, 0),
(968, 1, 1, 'block/online_users:addinstance', 1, 1415061008, 0),
(969, 1, 7, 'block/online_users:viewlist', 1, 1415061008, 0),
(970, 1, 6, 'block/online_users:viewlist', 1, 1415061008, 0),
(971, 1, 5, 'block/online_users:viewlist', 1, 1415061008, 0),
(972, 1, 4, 'block/online_users:viewlist', 1, 1415061008, 0),
(973, 1, 3, 'block/online_users:viewlist', 1, 1415061008, 0),
(974, 1, 1, 'block/online_users:viewlist', 1, 1415061008, 0),
(975, 1, 3, 'block/participants:addinstance', 1, 1415061008, 0),
(976, 1, 1, 'block/participants:addinstance', 1, 1415061008, 0),
(977, 1, 7, 'block/private_files:myaddinstance', -1000, 1418231124, 2),
(978, 1, 3, 'block/private_files:addinstance', 1, 1415061008, 0),
(979, 1, 1, 'block/private_files:addinstance', 1, 1415061008, 0),
(980, 1, 3, 'block/quiz_results:addinstance', 1, 1415061008, 0),
(981, 1, 1, 'block/quiz_results:addinstance', 1, 1415061008, 0),
(982, 1, 3, 'block/recent_activity:addinstance', 1, 1415061008, 0),
(983, 1, 1, 'block/recent_activity:addinstance', 1, 1415061008, 0),
(984, 1, 7, 'block/recent_activity:viewaddupdatemodule', 1, 1415061008, 0),
(985, 1, 7, 'block/recent_activity:viewdeletemodule', 1, 1415061009, 0),
(986, 1, 7, 'block/rss_client:myaddinstance', 1, 1415061009, 0),
(987, 1, 3, 'block/rss_client:addinstance', 1, 1415061009, 0),
(988, 1, 1, 'block/rss_client:addinstance', 1, 1415061009, 0),
(989, 1, 4, 'block/rss_client:manageownfeeds', 1, 1415061009, 0),
(990, 1, 3, 'block/rss_client:manageownfeeds', 1, 1415061009, 0),
(991, 1, 1, 'block/rss_client:manageownfeeds', 1, 1415061009, 0),
(992, 1, 1, 'block/rss_client:manageanyfeeds', 1, 1415061009, 0),
(993, 1, 3, 'block/search_forums:addinstance', 1, 1415061009, 0),
(994, 1, 1, 'block/search_forums:addinstance', 1, 1415061009, 0),
(995, 1, 3, 'block/section_links:addinstance', 1, 1415061009, 0),
(996, 1, 1, 'block/section_links:addinstance', 1, 1415061009, 0),
(997, 1, 3, 'block/selfcompletion:addinstance', 1, 1415061009, 0),
(998, 1, 1, 'block/selfcompletion:addinstance', 1, 1415061009, 0),
(999, 1, 7, 'block/settings:myaddinstance', 1, 1415061009, 0),
(1000, 1, 3, 'block/settings:addinstance', 1, 1415061009, 0),
(1001, 1, 1, 'block/settings:addinstance', 1, 1415061009, 0),
(1002, 1, 3, 'block/site_main_menu:addinstance', 1, 1415061009, 0),
(1003, 1, 1, 'block/site_main_menu:addinstance', 1, 1415061009, 0),
(1004, 1, 3, 'block/social_activities:addinstance', 1, 1415061009, 0),
(1005, 1, 1, 'block/social_activities:addinstance', 1, 1415061009, 0),
(1006, 1, 3, 'block/tag_flickr:addinstance', 1, 1415061009, 0),
(1007, 1, 1, 'block/tag_flickr:addinstance', 1, 1415061009, 0),
(1008, 1, 3, 'block/tag_youtube:addinstance', 1, 1415061009, 0),
(1009, 1, 1, 'block/tag_youtube:addinstance', 1, 1415061009, 0),
(1010, 1, 7, 'block/tags:myaddinstance', 1, 1418233258, 2),
(1011, 1, 3, 'block/tags:addinstance', 1, 1415061009, 0),
(1012, 1, 1, 'block/tags:addinstance', 1, 1415061009, 0),
(1013, 1, 4, 'report/completion:view', 1, 1415061012, 0),
(1014, 1, 3, 'report/completion:view', 1, 1415061012, 0),
(1015, 1, 1, 'report/completion:view', 1, 1415061012, 0),
(1016, 1, 4, 'report/courseoverview:view', 1, 1415061012, 0),
(1017, 1, 3, 'report/courseoverview:view', 1, 1415061012, 0),
(1018, 1, 1, 'report/courseoverview:view', 1, 1415061012, 0),
(1019, 1, 4, 'report/log:view', 1, 1415061012, 0),
(1020, 1, 3, 'report/log:view', 1, 1415061012, 0),
(1021, 1, 1, 'report/log:view', 1, 1415061012, 0),
(1022, 1, 4, 'report/log:viewtoday', 1, 1415061012, 0),
(1023, 1, 3, 'report/log:viewtoday', 1, 1415061012, 0),
(1024, 1, 1, 'report/log:viewtoday', 1, 1415061012, 0),
(1025, 1, 4, 'report/loglive:view', 1, 1415061012, 0),
(1026, 1, 3, 'report/loglive:view', 1, 1415061012, 0),
(1027, 1, 1, 'report/loglive:view', 1, 1415061012, 0),
(1028, 1, 4, 'report/outline:view', 1, 1415061012, 0),
(1029, 1, 3, 'report/outline:view', 1, 1415061012, 0),
(1030, 1, 1, 'report/outline:view', 1, 1415061012, 0),
(1031, 1, 4, 'report/participation:view', 1, 1415061012, 0),
(1032, 1, 3, 'report/participation:view', 1, 1415061012, 0),
(1033, 1, 1, 'report/participation:view', 1, 1415061012, 0),
(1034, 1, 1, 'report/performance:view', 1, 1415061012, 0),
(1035, 1, 4, 'report/progress:view', 1, 1415061012, 0),
(1036, 1, 3, 'report/progress:view', 1, 1415061012, 0),
(1037, 1, 1, 'report/progress:view', 1, 1415061012, 0),
(1038, 1, 1, 'report/security:view', 1, 1415061013, 0),
(1039, 1, 4, 'report/stats:view', 1, 1415061013, 0),
(1040, 1, 3, 'report/stats:view', 1, 1415061013, 0),
(1041, 1, 1, 'report/stats:view', 1, 1415061013, 0),
(1042, 1, 4, 'gradeexport/ods:view', 1, 1415061013, 0),
(1043, 1, 3, 'gradeexport/ods:view', 1, 1415061013, 0),
(1044, 1, 1, 'gradeexport/ods:view', 1, 1415061013, 0),
(1045, 1, 1, 'gradeexport/ods:publish', 1, 1415061013, 0),
(1046, 1, 4, 'gradeexport/txt:view', 1, 1415061013, 0),
(1047, 1, 3, 'gradeexport/txt:view', 1, 1415061013, 0),
(1048, 1, 1, 'gradeexport/txt:view', 1, 1415061013, 0),
(1049, 1, 1, 'gradeexport/txt:publish', 1, 1415061013, 0),
(1050, 1, 4, 'gradeexport/xls:view', 1, 1415061013, 0),
(1051, 1, 3, 'gradeexport/xls:view', 1, 1415061013, 0),
(1052, 1, 1, 'gradeexport/xls:view', 1, 1415061013, 0),
(1053, 1, 1, 'gradeexport/xls:publish', 1, 1415061013, 0),
(1054, 1, 4, 'gradeexport/xml:view', 1, 1415061013, 0),
(1055, 1, 3, 'gradeexport/xml:view', 1, 1415061013, 0),
(1056, 1, 1, 'gradeexport/xml:view', 1, 1415061013, 0),
(1057, 1, 1, 'gradeexport/xml:publish', 1, 1415061013, 0),
(1058, 1, 3, 'gradeimport/csv:view', 1, 1415061013, 0),
(1059, 1, 1, 'gradeimport/csv:view', 1, 1415061013, 0),
(1060, 1, 3, 'gradeimport/xml:view', 1, 1415061013, 0),
(1061, 1, 1, 'gradeimport/xml:view', 1, 1415061013, 0),
(1062, 1, 1, 'gradeimport/xml:publish', 1, 1415061013, 0),
(1063, 1, 4, 'gradereport/grader:view', 1, 1415061014, 0),
(1064, 1, 3, 'gradereport/grader:view', 1, 1415061014, 0),
(1065, 1, 1, 'gradereport/grader:view', 1, 1415061014, 0),
(1066, 1, 4, 'gradereport/outcomes:view', 1, 1415061014, 0),
(1067, 1, 3, 'gradereport/outcomes:view', 1, 1415061014, 0),
(1068, 1, 1, 'gradereport/outcomes:view', 1, 1415061014, 0),
(1069, 1, 5, 'gradereport/overview:view', 1, 1415061014, 0),
(1070, 1, 1, 'gradereport/overview:view', 1, 1415061014, 0),
(1071, 1, 5, 'gradereport/user:view', 1, 1415061014, 0),
(1072, 1, 4, 'gradereport/user:view', 1, 1415061014, 0),
(1073, 1, 3, 'gradereport/user:view', 1, 1415061014, 0),
(1074, 1, 1, 'gradereport/user:view', 1, 1415061014, 0),
(1075, 1, 7, 'repository/alfresco:view', 1, 1415061016, 0),
(1076, 1, 7, 'repository/areafiles:view', 1, 1415061016, 0),
(1077, 1, 7, 'repository/boxnet:view', 1, 1415061016, 0),
(1078, 1, 2, 'repository/coursefiles:view', 1, 1415061016, 0),
(1079, 1, 4, 'repository/coursefiles:view', 1, 1415061016, 0),
(1080, 1, 3, 'repository/coursefiles:view', 1, 1415061016, 0),
(1081, 1, 1, 'repository/coursefiles:view', 1, 1415061016, 0),
(1082, 1, 7, 'repository/dropbox:view', 1, 1415061016, 0),
(1083, 1, 7, 'repository/equella:view', 1, 1415061016, 0),
(1084, 1, 2, 'repository/filesystem:view', 1, 1415061016, 0),
(1085, 1, 4, 'repository/filesystem:view', 1, 1415061016, 0),
(1086, 1, 3, 'repository/filesystem:view', 1, 1415061016, 0),
(1087, 1, 1, 'repository/filesystem:view', 1, 1415061016, 0),
(1088, 1, 7, 'repository/flickr:view', 1, 1415061016, 0),
(1089, 1, 7, 'repository/flickr_public:view', 1, 1415061016, 0),
(1090, 1, 7, 'repository/googledocs:view', 1, 1415061016, 0),
(1091, 1, 2, 'repository/local:view', 1, 1415061017, 0),
(1092, 1, 4, 'repository/local:view', 1, 1415061017, 0),
(1093, 1, 3, 'repository/local:view', 1, 1415061017, 0),
(1094, 1, 1, 'repository/local:view', 1, 1415061017, 0),
(1095, 1, 7, 'repository/merlot:view', 1, 1415061017, 0),
(1096, 1, 7, 'repository/picasa:view', 1, 1415061017, 0),
(1097, 1, 7, 'repository/recent:view', 1, 1415061017, 0),
(1098, 1, 7, 'repository/s3:view', 1, 1415061017, 0),
(1099, 1, 7, 'repository/skydrive:view', 1, 1415061017, 0),
(1100, 1, 7, 'repository/upload:view', 1, 1415061017, 0),
(1101, 1, 7, 'repository/url:view', 1, 1415061017, 0),
(1102, 1, 7, 'repository/user:view', -1000, 1418231124, 2),
(1103, 1, 2, 'repository/webdav:view', 1, 1415061018, 0),
(1104, 1, 4, 'repository/webdav:view', 1, 1415061018, 0),
(1105, 1, 3, 'repository/webdav:view', 1, 1415061018, 0),
(1106, 1, 1, 'repository/webdav:view', 1, 1415061018, 0),
(1107, 1, 7, 'repository/wikimedia:view', 1, 1415061018, 0),
(1108, 1, 7, 'repository/youtube:view', 1, 1415061018, 0),
(1109, 1, 1, 'tool/customlang:view', 1, 1415061021, 0),
(1110, 1, 1, 'tool/customlang:edit', 1, 1415061021, 0),
(1111, 1, 1, 'tool/uploaduser:uploaduserpictures', 1, 1415061022, 0),
(1112, 1, 3, 'booktool/importhtml:import', 1, 1415061025, 0),
(1113, 1, 1, 'booktool/importhtml:import', 1, 1415061025, 0),
(1114, 1, 6, 'booktool/print:print', 1, 1415061025, 0),
(1115, 1, 8, 'booktool/print:print', 1, 1415061025, 0),
(1116, 1, 5, 'booktool/print:print', 1, 1415061025, 0),
(1117, 1, 4, 'booktool/print:print', 1, 1415061025, 0),
(1118, 1, 3, 'booktool/print:print', 1, 1415061025, 0),
(1119, 1, 1, 'booktool/print:print', 1, 1415061025, 0),
(1120, 1, 4, 'quiz/grading:viewstudentnames', 1, 1415061026, 0),
(1121, 1, 3, 'quiz/grading:viewstudentnames', 1, 1415061026, 0),
(1122, 1, 1, 'quiz/grading:viewstudentnames', 1, 1415061027, 0),
(1123, 1, 4, 'quiz/grading:viewidnumber', 1, 1415061027, 0),
(1124, 1, 3, 'quiz/grading:viewidnumber', 1, 1415061027, 0),
(1125, 1, 1, 'quiz/grading:viewidnumber', 1, 1415061027, 0),
(1126, 1, 4, 'quiz/statistics:view', 1, 1415061027, 0),
(1127, 1, 3, 'quiz/statistics:view', 1, 1415061027, 0),
(1128, 1, 1, 'quiz/statistics:view', 1, 1415061027, 0),
(1129, 1, 9, 'moodle/blog:manageentries', -1000, 1415913940, 2),
(1130, 1, 9, 'moodle/blog:manageexternal', -1000, 1415913940, 2),
(1131, 1, 9, 'moodle/blog:search', 1, 1415300512, 2),
(1132, 1, 9, 'moodle/blog:view', 1, 1415300512, 2),
(1133, 1, 9, 'moodle/community:add', -1000, 1415913940, 2),
(1134, 1, 9, 'moodle/community:download', 1, 1415300512, 2),
(1135, 1, 9, 'moodle/course:viewsuspendedusers', -1000, 1415913940, 2),
(1136, 1, 9, 'moodle/portfolio:export', -1000, 1415913940, 2),
(1137, 1, 9, 'moodle/site:doclinks', -1000, 1415913940, 2),
(1138, 1, 9, 'moodle/site:readallmessages', 1, 1415300512, 2),
(1139, 1, 9, 'moodle/tag:editblocks', -1000, 1415913940, 2),
(1140, 1, 9, 'moodle/tag:manage', -1000, 1415913940, 2),
(1141, 1, 9, 'report/courseoverview:view', -1000, 1415913940, 2),
(1142, 1, 9, 'moodle/user:readuserblogs', -1000, 1415913940, 2),
(1143, 1, 9, 'moodle/user:readuserposts', 1, 1415300512, 2),
(1144, 1, 9, 'enrol/cohort:config', -1000, 1415913940, 2),
(1145, 1, 9, 'enrol/guest:config', -1000, 1415913940, 2),
(1146, 1, 9, 'enrol/manual:enrol', -1000, 1415913940, 2),
(1147, 1, 9, 'enrol/manual:manage', -1000, 1415913940, 2),
(1148, 1, 9, 'enrol/manual:unenrol', -1000, 1415913940, 2),
(1149, 1, 9, 'enrol/meta:config', -1000, 1415915911, 2),
(1150, 1, 9, 'enrol/paypal:manage', -1000, 1415915911, 2),
(1151, 1, 9, 'enrol/self:config', -1000, 1415915911, 2),
(1152, 1, 9, 'enrol/self:manage', -1000, 1415915911, 2),
(1153, 1, 9, 'enrol/self:unenrol', -1000, 1415915911, 2),
(1154, 1, 9, 'gradeexport/ods:view', -1000, 1415915911, 2),
(1155, 1, 9, 'gradeexport/txt:view', -1000, 1415915911, 2),
(1156, 1, 9, 'gradeexport/xls:view', -1000, 1415915911, 2),
(1157, 1, 9, 'gradeexport/xml:view', -1000, 1415915911, 2),
(1158, 1, 9, 'gradeimport/csv:view', -1000, 1415915911, 2),
(1159, 1, 9, 'gradeimport/xml:view', -1000, 1415915911, 2),
(1160, 1, 9, 'gradereport/grader:view', 1, 1415300512, 2),
(1161, 1, 9, 'gradereport/outcomes:view', -1000, 1415915911, 2),
(1162, 1, 9, 'gradereport/user:view', 1, 1415300512, 2),
(1163, 1, 9, 'mod/assign:addinstance', 1, 1415300512, 2),
(1164, 1, 9, 'mod/assignment:addinstance', 1, 1415300512, 2),
(1165, 1, 9, 'mod/book:addinstance', 1, 1415300512, 2),
(1166, 1, 9, 'mod/chat:addinstance', -1000, 1415915911, 2),
(1167, 1, 9, 'mod/choice:addinstance', -1000, 1415915911, 2),
(1168, 1, 9, 'mod/data:addinstance', -1000, 1415915911, 2),
(1169, 1, 9, 'mod/feedback:addinstance', 1, 1415300512, 2),
(1170, 1, 9, 'mod/folder:addinstance', 1, 1415300512, 2),
(1171, 1, 9, 'mod/forum:addinstance', -1000, 1415915911, 2),
(1172, 1, 9, 'mod/glossary:addinstance', 1, 1415300512, 2),
(1173, 1, 9, 'mod/imscp:addinstance', -1000, 1415915911, 2),
(1174, 1, 9, 'mod/label:addinstance', 1, 1415300512, 2),
(1175, 1, 9, 'mod/lesson:addinstance', 1, 1415300512, 2),
(1176, 1, 9, 'mod/lti:addcoursetool', 1, 1415300512, 2),
(1177, 1, 9, 'mod/lti:addinstance', 1, 1415300512, 2),
(1178, 1, 9, 'mod/lti:requesttooladd', 1, 1415300512, 2),
(1179, 1, 9, 'mod/page:addinstance', 1, 1415300512, 2),
(1180, 1, 9, 'mod/quiz:addinstance', 1, 1415300512, 2),
(1181, 1, 9, 'mod/resource:addinstance', 1, 1415300512, 2),
(1182, 1, 9, 'mod/scorm:addinstance', 1, 1415300512, 2),
(1183, 1, 9, 'mod/survey:addinstance', 1, 1415300512, 2),
(1184, 1, 9, 'mod/url:addinstance', 1, 1415300512, 2),
(1185, 1, 9, 'mod/wiki:addinstance', 1, 1415300512, 2),
(1186, 1, 9, 'mod/workshop:addinstance', 1, 1415300512, 2),
(1187, 1, 9, 'moodle/backup:backupcourse', 1, 1415300512, 2),
(1188, 1, 9, 'moodle/backup:backupsection', 1, 1415300512, 2),
(1189, 1, 9, 'moodle/backup:backuptargethub', 1, 1415300512, 2),
(1190, 1, 9, 'moodle/backup:backuptargetimport', 1, 1415300512, 2),
(1191, 1, 9, 'moodle/backup:configure', 1, 1415300512, 2),
(1192, 1, 9, 'moodle/backup:downloadfile', 1, 1415300512, 2),
(1193, 1, 9, 'moodle/badges:awardbadge', -1000, 1415915911, 2),
(1194, 1, 9, 'moodle/badges:configurecriteria', -1000, 1415915911, 2),
(1195, 1, 9, 'moodle/badges:configuredetails', -1000, 1415915911, 2),
(1196, 1, 9, 'moodle/badges:configuremessages', -1000, 1415915911, 2),
(1197, 1, 9, 'moodle/badges:createbadge', -1000, 1415915911, 2),
(1198, 1, 9, 'moodle/badges:deletebadge', -1000, 1415915911, 2),
(1199, 1, 9, 'moodle/badges:viewawarded', -1000, 1415915911, 2),
(1200, 1, 9, 'moodle/calendar:manageentries', 1, 1415300512, 2),
(1201, 1, 9, 'moodle/calendar:managegroupentries', 1, 1415300512, 2),
(1202, 1, 9, 'moodle/cohort:view', -1000, 1415915911, 2),
(1203, 1, 9, 'moodle/comment:delete', -1000, 1415915911, 2),
(1204, 1, 9, 'moodle/comment:post', 1, 1415300512, 2),
(1205, 1, 9, 'moodle/comment:view', 1, 1415300512, 2),
(1206, 1, 9, 'moodle/course:bulkmessaging', 1, 1415300512, 2),
(1207, 1, 9, 'moodle/course:changecategory', -1000, 1415915911, 2),
(1208, 1, 9, 'moodle/course:changefullname', -1000, 1415915911, 2),
(1209, 1, 9, 'moodle/course:changeidnumber', -1000, 1415915911, 2),
(1210, 1, 9, 'moodle/course:changeshortname', -1000, 1415915911, 2),
(1211, 1, 9, 'moodle/course:changesummary', 1, 1415300512, 2),
(1212, 1, 9, 'moodle/course:enrolconfig', -1000, 1415915911, 2),
(1213, 1, 9, 'moodle/course:enrolreview', -1000, 1415915911, 2),
(1214, 1, 9, 'moodle/course:managefiles', 1, 1415300512, 2),
(1215, 1, 9, 'moodle/course:managegroups', 1, 1415300512, 2),
(1216, 1, 9, 'moodle/course:managescales', 1, 1415300512, 2),
(1217, 1, 9, 'moodle/course:markcomplete', 1, 1415300512, 2),
(1218, 1, 9, 'moodle/course:movesections', -1000, 1415915911, 2),
(1219, 1, 9, 'moodle/course:reset', -1000, 1415915911, 2),
(1220, 1, 9, 'moodle/course:reviewotherusers', 1, 1415300512, 2),
(1221, 1, 9, 'moodle/course:sectionvisibility', 1, 1415300512, 2),
(1222, 1, 9, 'moodle/course:setcurrentsection', 1, 1415300512, 2),
(1223, 1, 9, 'moodle/course:update', -1000, 1415915911, 2),
(1224, 1, 9, 'moodle/course:useremail', 1, 1415300512, 2),
(1225, 1, 9, 'moodle/course:viewhiddencourses', -1000, 1415915911, 2),
(1226, 1, 9, 'moodle/course:viewhiddensections', -1000, 1415915911, 2),
(1227, 1, 9, 'moodle/course:viewhiddenuserfields', -1000, 1415915911, 2),
(1228, 1, 9, 'moodle/course:viewparticipants', 1, 1415300512, 2),
(1229, 1, 9, 'moodle/course:viewscales', 1, 1415300512, 2),
(1230, 1, 9, 'moodle/course:visibility', -1000, 1415915911, 2),
(1231, 1, 9, 'moodle/filter:manage', -1000, 1415915911, 2),
(1232, 1, 9, 'moodle/grade:edit', 1, 1415300512, 2),
(1233, 1, 9, 'moodle/grade:export', 1, 1415300512, 2),
(1234, 1, 9, 'moodle/grade:hide', 1, 1415300512, 2),
(1235, 1, 9, 'moodle/grade:import', 1, 1415300512, 2),
(1236, 1, 9, 'moodle/grade:lock', 1, 1415300512, 2),
(1237, 1, 9, 'moodle/grade:manage', 1, 1415300512, 2),
(1238, 1, 9, 'moodle/grade:managegradingforms', 1, 1415300512, 2),
(1239, 1, 9, 'moodle/grade:manageletters', 1, 1415300512, 2),
(1240, 1, 9, 'moodle/grade:manageoutcomes', 1, 1415300512, 2),
(1241, 1, 9, 'moodle/grade:unlock', 1, 1415300512, 2),
(1242, 1, 9, 'moodle/grade:viewall', 1, 1415300512, 2),
(1243, 1, 9, 'moodle/grade:viewhidden', 1, 1415300512, 2),
(1244, 1, 9, 'moodle/notes:manage', 1, 1415300512, 2),
(1245, 1, 9, 'moodle/notes:view', 1, 1415300512, 2),
(1246, 1, 9, 'moodle/question:add', 1, 1415300512, 2),
(1247, 1, 9, 'moodle/question:editall', 1, 1415300512, 2),
(1248, 1, 9, 'moodle/question:editmine', 1, 1415300512, 2),
(1249, 1, 9, 'moodle/question:flag', 1, 1415300512, 2),
(1250, 1, 9, 'moodle/question:managecategory', 1, 1415300512, 2),
(1251, 1, 9, 'moodle/question:moveall', 1, 1415300512, 2),
(1252, 1, 9, 'moodle/question:movemine', 1, 1415300512, 2),
(1253, 1, 9, 'moodle/question:useall', 1, 1415300512, 2),
(1254, 1, 9, 'moodle/question:usemine', 1, 1415300512, 2),
(1255, 1, 9, 'moodle/question:viewall', 1, 1415300512, 2),
(1256, 1, 9, 'moodle/question:viewmine', 1, 1415300512, 2),
(1257, 1, 9, 'moodle/rating:rate', 1, 1415300512, 2),
(1258, 1, 9, 'moodle/rating:view', 1, 1415300512, 2),
(1259, 1, 9, 'moodle/rating:viewall', 1, 1415300512, 2),
(1260, 1, 9, 'moodle/rating:viewany', 1, 1415300512, 2),
(1261, 1, 9, 'moodle/restore:configure', 1, 1415300512, 2),
(1262, 1, 9, 'moodle/restore:restoreactivity', 1, 1415300512, 2),
(1263, 1, 9, 'moodle/restore:restorecourse', 1, 1415300512, 2),
(1264, 1, 9, 'moodle/restore:restoresection', 1, 1415300512, 2),
(1265, 1, 9, 'moodle/restore:restoretargethub', 1, 1415300512, 2),
(1266, 1, 9, 'moodle/restore:restoretargetimport', 1, 1415300512, 2),
(1267, 1, 9, 'moodle/restore:uploadfile', 1, 1415300512, 2),
(1268, 1, 9, 'moodle/role:assign', -1000, 1415915911, 2),
(1269, 1, 9, 'moodle/role:review', -1000, 1415915911, 2),
(1270, 1, 9, 'moodle/role:safeoverride', -1000, 1415915911, 2),
(1271, 1, 9, 'moodle/role:switchroles', -1000, 1415915911, 2),
(1272, 1, 9, 'moodle/site:accessallgroups', 1, 1415300512, 2),
(1273, 1, 9, 'moodle/site:trustcontent', 1, 1415300512, 2),
(1274, 1, 9, 'moodle/site:viewfullnames', 1, 1415300512, 2),
(1275, 1, 9, 'moodle/site:viewreports', 1, 1415300512, 2),
(1276, 1, 9, 'moodle/site:viewuseridentity', 1, 1415300512, 2),
(1277, 1, 9, 'moodle/user:viewdetails', 1, 1415300512, 2),
(1278, 1, 9, 'moodle/user:viewhiddendetails', 1, 1415300512, 2),
(1279, 1, 9, 'report/completion:view', 1, 1415300512, 2),
(1280, 1, 9, 'report/log:view', 1, 1415300512, 2),
(1281, 1, 9, 'report/log:viewtoday', 1, 1415300512, 2),
(1282, 1, 9, 'report/loglive:view', 1, 1415300512, 2),
(1283, 1, 9, 'report/outline:view', 1, 1415300512, 2),
(1284, 1, 9, 'report/participation:view', 1, 1415300512, 2),
(1285, 1, 9, 'report/progress:view', 1, 1415300512, 2),
(1286, 1, 9, 'report/stats:view', 1, 1415300512, 2),
(1287, 1, 9, 'booktool/importhtml:import', 1, 1415300512, 2),
(1288, 1, 9, 'booktool/print:print', 1, 1415300512, 2),
(1289, 1, 9, 'mod/assign:exportownsubmission', 1, 1415300512, 2),
(1290, 1, 9, 'mod/assign:grade', 1, 1415300512, 2),
(1291, 1, 9, 'mod/assign:grantextension', 1, 1415300512, 2),
(1292, 1, 9, 'mod/assign:manageallocations', 1, 1415300512, 2),
(1293, 1, 9, 'mod/assign:managegrades', 1, 1415300512, 2),
(1294, 1, 9, 'mod/assign:releasegrades', 1, 1415300512, 2),
(1295, 1, 9, 'mod/assign:revealidentities', 1, 1415300512, 2),
(1296, 1, 9, 'mod/assign:reviewgrades', 1, 1415300512, 2),
(1297, 1, 9, 'mod/assign:view', 1, 1415300512, 2),
(1298, 1, 9, 'mod/assign:viewgrades', 1, 1415300512, 2),
(1299, 1, 9, 'mod/assignment:exportownsubmission', 1, 1415300512, 2),
(1300, 1, 9, 'mod/assignment:grade', 1, 1415300512, 2),
(1301, 1, 9, 'mod/assignment:view', 1, 1415300512, 2),
(1302, 1, 9, 'mod/book:edit', 1, 1415300512, 2),
(1303, 1, 9, 'mod/book:read', 1, 1415300512, 2),
(1304, 1, 9, 'mod/book:viewhiddenchapters', 1, 1415300512, 2),
(1305, 1, 9, 'mod/chat:chat', 1, 1415300512, 2),
(1306, 1, 9, 'mod/chat:deletelog', 1, 1415300512, 2),
(1307, 1, 9, 'mod/chat:exportparticipatedsession', 1, 1415300512, 2),
(1308, 1, 9, 'mod/chat:exportsession', 1, 1415300512, 2),
(1309, 1, 9, 'mod/chat:readlog', 1, 1415300512, 2),
(1310, 1, 9, 'mod/choice:choose', 1, 1415300512, 2),
(1311, 1, 9, 'mod/choice:deleteresponses', 1, 1415300512, 2),
(1312, 1, 9, 'mod/choice:downloadresponses', 1, 1415300512, 2),
(1313, 1, 9, 'mod/choice:readresponses', 1, 1415300512, 2),
(1314, 1, 9, 'mod/data:approve', 1, 1415300512, 2),
(1315, 1, 9, 'mod/data:comment', 1, 1415300512, 2),
(1316, 1, 9, 'mod/data:exportallentries', 1, 1415300512, 2),
(1317, 1, 9, 'mod/data:exportentry', 1, 1415300512, 2),
(1318, 1, 9, 'mod/data:exportownentry', 1, 1415300512, 2),
(1319, 1, 9, 'mod/data:exportuserinfo', 1, 1415300512, 2),
(1320, 1, 9, 'mod/data:managecomments', 1, 1415300512, 2),
(1321, 1, 9, 'mod/data:manageentries', 1, 1415300512, 2),
(1322, 1, 9, 'mod/data:managetemplates', 1, 1415300512, 2),
(1323, 1, 9, 'mod/data:rate', 1, 1415300512, 2),
(1324, 1, 9, 'mod/data:viewallratings', 1, 1415300512, 2),
(1325, 1, 9, 'mod/data:viewalluserpresets', 1, 1415300512, 2),
(1326, 1, 9, 'mod/data:viewanyrating', 1, 1415300512, 2),
(1327, 1, 9, 'mod/data:viewentry', 1, 1415300512, 2),
(1328, 1, 9, 'mod/data:viewrating', 1, 1415300512, 2),
(1329, 1, 9, 'mod/data:writeentry', 1, 1415300512, 2),
(1330, 1, 9, 'mod/feedback:createprivatetemplate', 1, 1415300512, 2),
(1331, 1, 9, 'mod/feedback:createpublictemplate', 1, 1415300512, 2),
(1332, 1, 9, 'mod/feedback:deletesubmissions', 1, 1415300512, 2),
(1333, 1, 9, 'mod/feedback:deletetemplate', 1, 1415300512, 2),
(1334, 1, 9, 'mod/feedback:edititems', 1, 1415300512, 2),
(1335, 1, 9, 'mod/feedback:receivemail', 1, 1415300512, 2),
(1336, 1, 9, 'mod/feedback:view', 1, 1415300512, 2),
(1337, 1, 9, 'mod/feedback:viewanalysepage', 1, 1415300512, 2),
(1338, 1, 9, 'mod/feedback:viewreports', 1, 1415300512, 2),
(1339, 1, 9, 'mod/folder:managefiles', 1, 1415300512, 2),
(1340, 1, 9, 'mod/forum:addnews', 1, 1415300512, 2),
(1341, 1, 9, 'mod/forum:addquestion', 1, 1415300512, 2),
(1342, 1, 9, 'mod/forum:allowforcesubscribe', 1, 1415300512, 2),
(1343, 1, 9, 'mod/forum:createattachment', 1, 1415300512, 2),
(1344, 1, 9, 'mod/forum:deleteanypost', 1, 1415300512, 2),
(1345, 1, 9, 'mod/forum:deleteownpost', 1, 1415300512, 2),
(1346, 1, 9, 'mod/forum:editanypost', 1, 1415300512, 2),
(1347, 1, 9, 'mod/forum:exportdiscussion', 1, 1415300512, 2),
(1348, 1, 9, 'mod/forum:exportownpost', 1, 1415300512, 2),
(1349, 1, 9, 'mod/forum:exportpost', 1, 1415300512, 2),
(1350, 1, 9, 'mod/forum:managesubscriptions', 1, 1415300512, 2),
(1351, 1, 9, 'mod/forum:movediscussions', 1, 1415300512, 2),
(1352, 1, 9, 'mod/forum:postwithoutthrottling', 1, 1415300512, 2),
(1353, 1, 9, 'mod/forum:rate', 1, 1415300512, 2),
(1354, 1, 9, 'mod/forum:replynews', 1, 1415300512, 2),
(1355, 1, 9, 'mod/forum:replypost', 1, 1415300512, 2),
(1356, 1, 9, 'mod/forum:splitdiscussions', 1, 1415300512, 2),
(1357, 1, 9, 'mod/forum:startdiscussion', 1, 1415300512, 2),
(1358, 1, 9, 'mod/forum:viewallratings', 1, 1415300512, 2),
(1359, 1, 9, 'mod/forum:viewanyrating', 1, 1415300512, 2),
(1360, 1, 9, 'mod/forum:viewdiscussion', 1, 1415300512, 2),
(1361, 1, 9, 'mod/forum:viewhiddentimedposts', 1, 1415300512, 2),
(1362, 1, 9, 'mod/forum:viewqandawithoutposting', 1, 1415300512, 2),
(1363, 1, 9, 'mod/forum:viewrating', 1, 1415300512, 2),
(1364, 1, 9, 'mod/forum:viewsubscribers', 1, 1415300512, 2),
(1365, 1, 9, 'mod/glossary:approve', 1, 1415300512, 2),
(1366, 1, 9, 'mod/glossary:comment', 1, 1415300512, 2),
(1367, 1, 9, 'mod/glossary:export', 1, 1415300512, 2),
(1368, 1, 9, 'mod/glossary:exportentry', 1, 1415300512, 2),
(1369, 1, 9, 'mod/glossary:exportownentry', 1, 1415300512, 2),
(1370, 1, 9, 'mod/glossary:import', 1, 1415300512, 2),
(1371, 1, 9, 'mod/glossary:managecategories', 1, 1415300512, 2),
(1372, 1, 9, 'mod/glossary:managecomments', 1, 1415300512, 2),
(1373, 1, 9, 'mod/glossary:manageentries', 1, 1415300512, 2),
(1374, 1, 9, 'mod/glossary:rate', 1, 1415300512, 2),
(1375, 1, 9, 'mod/glossary:view', 1, 1415300512, 2),
(1376, 1, 9, 'mod/glossary:viewallratings', 1, 1415300512, 2),
(1377, 1, 9, 'mod/glossary:viewanyrating', 1, 1415300512, 2),
(1378, 1, 9, 'mod/glossary:viewrating', 1, 1415300512, 2),
(1379, 1, 9, 'mod/glossary:write', 1, 1415300512, 2),
(1380, 1, 9, 'mod/lesson:edit', 1, 1415300512, 2),
(1381, 1, 9, 'mod/lesson:manage', 1, 1415300512, 2),
(1382, 1, 9, 'mod/lti:grade', 1, 1415300512, 2),
(1383, 1, 9, 'mod/lti:manage', 1, 1415300512, 2),
(1384, 1, 9, 'mod/lti:view', 1, 1415300512, 2),
(1385, 1, 9, 'mod/quiz:deleteattempts', -1000, 1415915911, 2),
(1386, 1, 9, 'mod/quiz:grade', 1, 1415300512, 2),
(1387, 1, 9, 'mod/quiz:manage', 1, 1415300512, 2),
(1388, 1, 9, 'mod/quiz:manageoverrides', 1, 1415300512, 2),
(1389, 1, 9, 'mod/quiz:preview', 1, 1415300512, 2),
(1390, 1, 9, 'mod/quiz:regrade', 1, 1415300512, 2),
(1391, 1, 9, 'mod/quiz:view', 1, 1415300512, 2),
(1392, 1, 9, 'mod/quiz:viewreports', 1, 1415300512, 2),
(1393, 1, 9, 'mod/scorm:deleteresponses', 1, 1415300512, 2),
(1394, 1, 9, 'mod/scorm:savetrack', 1, 1415300512, 2),
(1395, 1, 9, 'mod/scorm:viewreport', 1, 1415300512, 2),
(1396, 1, 9, 'mod/scorm:viewscores', 1, 1415300512, 2),
(1397, 1, 9, 'mod/survey:download', 1, 1415300512, 2),
(1398, 1, 9, 'mod/survey:participate', 1, 1415300512, 2),
(1399, 1, 9, 'mod/survey:readresponses', 1, 1415300512, 2),
(1400, 1, 9, 'mod/wiki:createpage', 1, 1415300512, 2),
(1401, 1, 9, 'mod/wiki:editcomment', 1, 1415300512, 2),
(1402, 1, 9, 'mod/wiki:editpage', 1, 1415300512, 2),
(1403, 1, 9, 'mod/wiki:managecomment', 1, 1415300512, 2),
(1404, 1, 9, 'mod/wiki:managefiles', 1, 1415300512, 2),
(1405, 1, 9, 'mod/wiki:managewiki', 1, 1415300512, 2),
(1406, 1, 9, 'mod/wiki:overridelock', 1, 1415300512, 2),
(1407, 1, 9, 'mod/wiki:viewcomment', 1, 1415300512, 2),
(1408, 1, 9, 'mod/wiki:viewpage', 1, 1415300512, 2),
(1409, 1, 9, 'mod/workshop:allocate', 1, 1415300512, 2),
(1410, 1, 9, 'mod/workshop:editdimensions', 1, 1415300512, 2),
(1411, 1, 9, 'mod/workshop:ignoredeadlines', 1, 1415300512, 2),
(1412, 1, 9, 'mod/workshop:manageexamples', 1, 1415300512, 2),
(1413, 1, 9, 'mod/workshop:overridegrades', 1, 1415300512, 2),
(1414, 1, 9, 'mod/workshop:publishsubmissions', 1, 1415300512, 2),
(1415, 1, 9, 'mod/workshop:switchphase', 1, 1415300512, 2),
(1416, 1, 9, 'mod/workshop:view', 1, 1415300512, 2),
(1417, 1, 9, 'mod/workshop:viewallassessments', 1, 1415300512, 2),
(1418, 1, 9, 'mod/workshop:viewallsubmissions', 1, 1415300512, 2),
(1419, 1, 9, 'mod/workshop:viewauthornames', 1, 1415300512, 2),
(1420, 1, 9, 'mod/workshop:viewauthorpublished', 1, 1415300512, 2),
(1421, 1, 9, 'mod/workshop:viewpublishedsubmissions', 1, 1415300512, 2),
(1422, 1, 9, 'mod/workshop:viewreviewernames', 1, 1415300512, 2),
(1423, 1, 9, 'moodle/backup:backupactivity', 1, 1415300512, 2),
(1424, 1, 9, 'moodle/course:activityvisibility', 1, 1415300512, 2),
(1425, 1, 9, 'moodle/course:manageactivities', 1, 1415300512, 2),
(1426, 1, 9, 'moodle/course:viewhiddenactivities', 1, 1415300512, 2),
(1427, 1, 9, 'quiz/grading:viewidnumber', 1, 1415300512, 2),
(1428, 1, 9, 'quiz/grading:viewstudentnames', 1, 1415300512, 2),
(1429, 1, 9, 'quiz/statistics:view', 1, 1415300512, 2),
(1430, 1, 9, 'repository/coursefiles:view', 1, 1415300512, 2),
(1431, 1, 9, 'repository/filesystem:view', 1, 1415300512, 2),
(1432, 1, 9, 'repository/local:view', -1000, 1415915911, 2),
(1433, 1, 9, 'repository/webdav:view', 1, 1415300512, 2),
(1434, 1, 9, 'block/activity_modules:addinstance', -1000, 1415915911, 2),
(1435, 1, 9, 'block/admin_bookmarks:addinstance', -1000, 1415915911, 2),
(1436, 1, 9, 'block/badges:addinstance', -1000, 1415915911, 2),
(1437, 1, 9, 'block/blog_menu:addinstance', -1000, 1415915911, 2),
(1438, 1, 9, 'block/blog_recent:addinstance', -1000, 1415915911, 2),
(1439, 1, 9, 'block/blog_tags:addinstance', -1000, 1415915911, 2),
(1440, 1, 9, 'block/calendar_month:addinstance', -1000, 1415915911, 2),
(1441, 1, 9, 'block/calendar_upcoming:addinstance', -1000, 1415915911, 2),
(1442, 1, 9, 'block/comments:addinstance', -1000, 1415915911, 2),
(1443, 1, 9, 'block/community:addinstance', -1000, 1415915911, 2),
(1444, 1, 9, 'block/completionstatus:addinstance', -1000, 1415915911, 2),
(1445, 1, 9, 'block/course_list:addinstance', -1000, 1415915911, 2),
(1446, 1, 9, 'block/course_overview:addinstance', -1000, 1415913130, 2),
(1447, 1, 9, 'block/course_summary:addinstance', -1000, 1415915911, 2),
(1448, 1, 9, 'block/feedback:addinstance', -1000, 1415915911, 2),
(1449, 1, 9, 'block/glossary_random:addinstance', -1000, 1415915911, 2),
(1450, 1, 9, 'block/html:addinstance', -1000, 1415915911, 2),
(1451, 1, 9, 'block/login:addinstance', -1000, 1415915911, 2),
(1452, 1, 9, 'block/mentees:addinstance', -1000, 1415915911, 2),
(1453, 1, 9, 'block/messages:addinstance', -1000, 1415915911, 2),
(1454, 1, 9, 'block/mnet_hosts:addinstance', -1000, 1415915911, 2),
(1455, 1, 9, 'block/myprofile:addinstance', -1000, 1415915911, 2),
(1456, 1, 9, 'block/navigation:addinstance', -1000, 1415915911, 2),
(1457, 1, 9, 'block/news_items:addinstance', -1000, 1415915911, 2),
(1458, 1, 9, 'block/online_users:addinstance', -1000, 1415915911, 2),
(1459, 1, 9, 'block/online_users:viewlist', -1000, 1415915911, 2),
(1460, 1, 9, 'block/participants:addinstance', -1000, 1415915911, 2),
(1461, 1, 9, 'block/private_files:addinstance', -1000, 1415915911, 2),
(1462, 1, 9, 'block/quiz_results:addinstance', -1000, 1415915911, 2),
(1463, 1, 9, 'block/recent_activity:addinstance', -1000, 1415915911, 2),
(1464, 1, 9, 'block/rss_client:addinstance', -1000, 1415915911, 2),
(1465, 1, 9, 'block/rss_client:manageownfeeds', -1000, 1415915911, 2),
(1466, 1, 9, 'block/search_forums:addinstance', -1000, 1415915911, 2),
(1467, 1, 9, 'block/section_links:addinstance', -1000, 1415915911, 2),
(1468, 1, 9, 'block/selfcompletion:addinstance', -1000, 1415915911, 2),
(1469, 1, 9, 'block/settings:addinstance', -1000, 1415915911, 2),
(1470, 1, 9, 'block/site_main_menu:addinstance', -1000, 1415915911, 2),
(1471, 1, 9, 'block/social_activities:addinstance', -1000, 1415915911, 2),
(1472, 1, 9, 'block/tags:addinstance', -1000, 1415915911, 2),
(1473, 1, 9, 'block/tag_flickr:addinstance', -1000, 1415915911, 2),
(1474, 1, 9, 'block/tag_youtube:addinstance', -1000, 1415915911, 2),
(1475, 1, 9, 'moodle/block:edit', -1000, 1415915911, 2),
(1476, 1, 9, 'moodle/block:view', -1000, 1415915911, 2),
(1477, 1, 9, 'moodle/site:manageblocks', -1000, 1415915911, 2),
(1478, 1, 10, 'moodle/blog:manageexternal', -1000, 1416169355, 2),
(1479, 1, 10, 'moodle/blog:search', 1, 1415300767, 2),
(1480, 1, 10, 'moodle/blog:view', 1, 1415300767, 2),
(1481, 1, 10, 'moodle/portfolio:export', -1000, 1416169355, 2),
(1482, 1, 10, 'moodle/user:readuserblogs', -1000, 1418226823, 2),
(1483, 1, 10, 'moodle/user:readuserposts', -1000, 1418226823, 2),
(1484, 1, 10, 'enrol/self:unenrolself', -1000, 1416169355, 2),
(1485, 1, 10, 'gradereport/overview:view', 1, 1415300767, 2),
(1486, 1, 10, 'gradereport/user:view', 1, 1415300767, 2),
(1487, 1, 10, 'moodle/comment:post', 1, 1415300767, 2),
(1488, 1, 10, 'moodle/comment:view', 1, 1415300767, 2),
(1489, 1, 10, 'moodle/course:isincompletionreports', 1, 1415300767, 2),
(1490, 1, 10, 'moodle/course:viewparticipants', -1000, 1416169355, 2),
(1491, 1, 10, 'moodle/course:viewscales', 1, 1415300767, 2),
(1492, 1, 10, 'moodle/grade:view', 1, 1415300767, 2),
(1493, 1, 10, 'moodle/question:flag', -1000, 1418178534, 2),
(1494, 1, 10, 'moodle/rating:rate', -1000, 1416169355, 2),
(1495, 1, 10, 'moodle/rating:view', -1000, 1418226823, 2),
(1496, 1, 10, 'moodle/rating:viewall', -1000, 1416169355, 2),
(1497, 1, 10, 'moodle/rating:viewany', -1000, 1416169355, 2),
(1498, 1, 10, 'moodle/user:viewdetails', -1000, 1416169355, 2),
(1499, 1, 10, 'booktool/print:print', -1000, 1416169355, 2),
(1500, 1, 10, 'mod/assign:exportownsubmission', 1, 1415300767, 2),
(1501, 1, 10, 'mod/assign:submit', 1, 1415300767, 2),
(1502, 1, 10, 'mod/assign:view', 1, 1415300767, 2),
(1503, 1, 10, 'mod/assignment:exportownsubmission', -1000, 1418226823, 2),
(1504, 1, 10, 'mod/assignment:submit', -1000, 1418226823, 2),
(1505, 1, 10, 'mod/assignment:view', -1000, 1418226823, 2),
(1506, 1, 10, 'mod/book:read', 1, 1415300767, 2),
(1507, 1, 10, 'mod/chat:chat', -1000, 1418226823, 2),
(1508, 1, 10, 'mod/chat:readlog', -1000, 1418226823, 2),
(1509, 1, 10, 'mod/choice:choose', -1000, 1418226823, 2),
(1510, 1, 10, 'mod/data:comment', -1000, 1416169355, 2),
(1511, 1, 10, 'mod/data:exportownentry', -1000, 1416169355, 2),
(1512, 1, 10, 'mod/data:viewentry', -1000, 1416169355, 2),
(1513, 1, 10, 'mod/data:writeentry', -1000, 1416169355, 2),
(1514, 1, 10, 'mod/feedback:complete', 1, 1415300767, 2),
(1515, 1, 10, 'mod/feedback:view', 1, 1415300767, 2),
(1516, 1, 10, 'mod/feedback:viewanalysepage', -1000, 1418226823, 2),
(1517, 1, 10, 'mod/forum:allowforcesubscribe', -1000, 1416169355, 2),
(1518, 1, 10, 'mod/forum:createattachment', -1000, 1418178729, 2),
(1519, 1, 10, 'mod/forum:deleteownpost', 1, 1415300767, 2),
(1520, 1, 10, 'mod/forum:exportownpost', 1, 1415300767, 2),
(1521, 1, 10, 'mod/forum:replypost', 1, 1415300767, 2),
(1522, 1, 10, 'mod/forum:startdiscussion', 1, 1415300767, 2),
(1523, 1, 10, 'mod/forum:viewdiscussion', 1, 1415300767, 2),
(1524, 1, 10, 'mod/forum:viewrating', 1, 1415300767, 2),
(1525, 1, 10, 'mod/glossary:comment', -1000, 1418226823, 2),
(1526, 1, 10, 'mod/glossary:exportownentry', -1000, 1418226823, 2),
(1527, 1, 10, 'mod/glossary:view', -1000, 1418226823, 2),
(1528, 1, 10, 'mod/glossary:write', -1000, 1418226823, 2),
(1529, 1, 10, 'mod/lti:view', -1000, 1416169355, 2),
(1530, 1, 10, 'mod/quiz:attempt', 1, 1415300767, 2),
(1531, 1, 10, 'mod/quiz:reviewmyattempts', 1, 1415300767, 2),
(1532, 1, 10, 'mod/quiz:view', 1, 1415300767, 2),
(1533, 1, 10, 'mod/scorm:savetrack', -1000, 1418226823, 2),
(1534, 1, 10, 'mod/scorm:skipview', -1000, 1418226823, 2),
(1535, 1, 10, 'mod/scorm:viewscores', -1000, 1418226823, 2),
(1536, 1, 10, 'mod/survey:participate', 1, 1415300767, 2),
(1537, 1, 10, 'mod/wiki:createpage', -1000, 1418226823, 2),
(1538, 1, 10, 'mod/wiki:editcomment', -1000, 1418226823, 2),
(1539, 1, 10, 'mod/wiki:editpage', -1000, 1418226823, 2),
(1540, 1, 10, 'mod/wiki:viewcomment', -1000, 1418226823, 2),
(1541, 1, 10, 'mod/wiki:viewpage', -1000, 1418226823, 2),
(1542, 1, 10, 'mod/workshop:peerassess', -1000, 1418226823, 2),
(1543, 1, 10, 'mod/workshop:submit', -1000, 1418226823, 2),
(1544, 1, 10, 'mod/workshop:view', -1000, 1418226823, 2),
(1545, 1, 10, 'mod/workshop:viewauthornames', -1000, 1418226823, 2),
(1546, 1, 10, 'mod/workshop:viewauthorpublished', -1000, 1418226823, 2),
(1547, 1, 10, 'mod/workshop:viewpublishedsubmissions', -1000, 1418226823, 2),
(1548, 1, 10, 'block/online_users:viewlist', -1000, 1416169355, 2),
(1549, 1, 10, 'moodle/block:view', 1, 1415300767, 2),
(1550, 1, 9, 'block/admin_bookmarks:myaddinstance', -1000, 1415913130, 2),
(1551, 1, 9, 'block/badges:myaddinstance', -1000, 1415913130, 2),
(1552, 1, 9, 'block/calendar_month:myaddinstance', -1000, 1415913130, 2),
(1553, 1, 9, 'block/calendar_upcoming:myaddinstance', -1000, 1415913130, 2),
(1554, 1, 9, 'block/comments:myaddinstance', -1000, 1415913130, 2),
(1555, 1, 9, 'block/community:myaddinstance', -1000, 1415913130, 2),
(1556, 1, 9, 'block/course_list:myaddinstance', -1000, 1415913130, 2),
(1557, 1, 9, 'block/course_overview:myaddinstance', -1000, 1415913130, 2),
(1558, 1, 9, 'block/glossary_random:myaddinstance', -1000, 1415913130, 2),
(1559, 1, 9, 'block/html:myaddinstance', -1000, 1415913130, 2),
(1560, 1, 9, 'block/mentees:myaddinstance', -1000, 1415913130, 2),
(1561, 1, 9, 'block/messages:myaddinstance', -1000, 1415913130, 2),
(1562, 1, 9, 'block/mnet_hosts:myaddinstance', -1000, 1415913130, 2),
(1563, 1, 9, 'block/myprofile:myaddinstance', -1000, 1415913130, 2),
(1564, 1, 9, 'block/navigation:myaddinstance', -1000, 1415913130, 2),
(1565, 1, 9, 'block/news_items:myaddinstance', -1000, 1415913130, 2),
(1566, 1, 9, 'block/online_users:myaddinstance', -1000, 1415913130, 2),
(1567, 1, 9, 'block/private_files:myaddinstance', -1000, 1415913130, 2),
(1568, 1, 9, 'block/rss_client:myaddinstance', -1000, 1415913130, 2),
(1569, 1, 9, 'block/settings:myaddinstance', -1000, 1415913130, 2),
(1570, 1, 9, 'block/tags:myaddinstance', -1000, 1415913130, 2),
(1571, 1, 9, 'enrol/category:synchronised', -1000, 1415913130, 2),
(1572, 1, 9, 'message/airnotifier:managedevice', -1000, 1415913130, 2),
(1573, 1, 9, 'moodle/badges:manageglobalsettings', -1000, 1415913130, 2),
(1574, 1, 9, 'moodle/blog:create', -1000, 1415913130, 2),
(1575, 1, 9, 'moodle/blog:viewdrafts', -1000, 1415913130, 2),
(1576, 1, 9, 'moodle/course:publish', -1000, 1415913130, 2),
(1577, 1, 9, 'moodle/course:request', -1000, 1415913130, 2),
(1578, 1, 9, 'moodle/grade:managesharedforms', -1000, 1415913130, 2),
(1579, 1, 9, 'moodle/grade:sharegradingforms', -1000, 1415913130, 2),
(1580, 1, 9, 'moodle/my:configsyspages', -1000, 1415913130, 2),
(1581, 1, 9, 'moodle/my:manageblocks', -1000, 1415913130, 2),
(1582, 1, 9, 'moodle/question:config', -1000, 1415913130, 2),
(1583, 1, 9, 'moodle/restore:createuser', -1000, 1415913130, 2),
(1584, 1, 9, 'moodle/role:manage', -1000, 1415913130, 2),
(1585, 1, 9, 'moodle/site:approvecourse', -1000, 1415913130, 2),
(1586, 1, 9, 'moodle/site:config', -1000, 1415913130, 2),
(1587, 1, 9, 'moodle/site:forcelanguage', -1000, 1415913130, 2),
(1588, 1, 9, 'moodle/site:mnetlogintoremote', -1000, 1415913130, 2),
(1589, 1, 9, 'moodle/site:sendmessage', -1000, 1415913130, 2),
(1590, 1, 9, 'moodle/site:uploadusers', -1000, 1415913130, 2),
(1591, 1, 9, 'moodle/site:viewparticipants', -1000, 1415913130, 2),
(1592, 1, 9, 'moodle/tag:create', -1000, 1415913130, 2),
(1593, 1, 9, 'moodle/tag:edit', -1000, 1415913130, 2),
(1594, 1, 9, 'moodle/tag:flag', -1000, 1415913130, 2),
(1595, 1, 9, 'moodle/user:changeownpassword', -1000, 1415913130, 2),
(1596, 1, 9, 'moodle/user:create', -1000, 1415913130, 2),
(1597, 1, 9, 'moodle/user:delete', -1000, 1415913130, 2),
(1598, 1, 9, 'moodle/user:editownmessageprofile', -1000, 1415913130, 2),
(1599, 1, 9, 'moodle/user:editownprofile', -1000, 1415913130, 2),
(1600, 1, 9, 'moodle/user:ignoreuserquota', -1000, 1415913130, 2),
(1601, 1, 9, 'moodle/user:manageownblocks', -1000, 1415913130, 2),
(1602, 1, 9, 'moodle/user:manageownfiles', -1000, 1415913130, 2),
(1603, 1, 9, 'moodle/user:managesyspages', -1000, 1415913130, 2),
(1604, 1, 9, 'moodle/user:update', -1000, 1415913130, 2),
(1605, 1, 9, 'moodle/webservice:createmobiletoken', -1000, 1415913130, 2),
(1606, 1, 9, 'moodle/webservice:createtoken', -1000, 1415913130, 2),
(1607, 1, 9, 'report/performance:view', -1000, 1415913130, 2),
(1608, 1, 9, 'report/questioninstances:view', -1000, 1415913130, 2),
(1609, 1, 9, 'report/security:view', -1000, 1415913130, 2),
(1610, 1, 9, 'tool/customlang:edit', -1000, 1415913130, 2),
(1611, 1, 9, 'tool/customlang:view', -1000, 1415913130, 2),
(1612, 1, 9, 'tool/uploaduser:uploaduserpictures', -1000, 1415913130, 2),
(1613, 1, 9, 'moodle/badges:manageownbadges', -1000, 1415913130, 2),
(1614, 1, 9, 'moodle/badges:viewotherbadges', -1000, 1415913130, 2),
(1615, 1, 9, 'moodle/user:editmessageprofile', -1000, 1415913130, 2),
(1616, 1, 9, 'moodle/user:editprofile', -1000, 1415913130, 2),
(1617, 1, 9, 'moodle/user:manageblocks', -1000, 1415913130, 2),
(1618, 1, 9, 'moodle/user:viewalldetails', -1000, 1415913130, 2),
(1619, 1, 9, 'moodle/user:viewlastip', -1000, 1415913130, 2),
(1620, 1, 9, 'moodle/user:viewuseractivitiesreport', -1000, 1415913130, 2),
(1621, 1, 9, 'moodle/category:manage', -1000, 1415913130, 2),
(1622, 1, 9, 'moodle/category:viewhiddencategories', -1000, 1415913130, 2),
(1623, 1, 9, 'moodle/cohort:assign', -1000, 1415913130, 2),
(1624, 1, 9, 'moodle/cohort:manage', -1000, 1415913130, 2),
(1625, 1, 9, 'moodle/course:create', -1000, 1415913130, 2),
(1626, 1, 9, 'block/recent_activity:viewaddupdatemodule', -1000, 1415913130, 2),
(1627, 1, 9, 'block/recent_activity:viewdeletemodule', -1000, 1415913130, 2),
(1628, 1, 9, 'enrol/cohort:unenrol', -1000, 1415913130, 2),
(1629, 1, 9, 'enrol/database:unenrol', -1000, 1415913130, 2),
(1630, 1, 9, 'enrol/flatfile:manage', -1000, 1415913130, 2),
(1631, 1, 9, 'enrol/flatfile:unenrol', -1000, 1415913130, 2),
(1632, 1, 9, 'enrol/ldap:manage', -1000, 1415913130, 2),
(1633, 1, 9, 'enrol/manual:config', -1000, 1415913130, 2),
(1634, 1, 9, 'enrol/manual:unenrolself', -1000, 1415913130, 2),
(1635, 1, 9, 'enrol/meta:selectaslinked', -1000, 1415913130, 2),
(1636, 1, 9, 'enrol/meta:unenrol', -1000, 1415913130, 2),
(1637, 1, 9, 'enrol/paypal:config', -1000, 1415913130, 2),
(1638, 1, 9, 'enrol/paypal:unenrol', -1000, 1415913130, 2),
(1639, 1, 9, 'enrol/paypal:unenrolself', -1000, 1415913130, 2),
(1640, 1, 9, 'enrol/self:unenrolself', -1000, 1415913130, 2),
(1641, 1, 9, 'gradeexport/ods:publish', -1000, 1415913130, 2),
(1642, 1, 9, 'gradeexport/txt:publish', -1000, 1415913130, 2),
(1643, 1, 9, 'gradeexport/xls:publish', -1000, 1415913130, 2),
(1644, 1, 9, 'gradeexport/xml:publish', -1000, 1415913130, 2),
(1645, 1, 9, 'gradeimport/xml:publish', -1000, 1415913130, 2),
(1646, 1, 9, 'gradereport/overview:view', -1000, 1415913130, 2),
(1647, 1, 9, 'moodle/backup:anonymise', -1000, 1415913130, 2),
(1648, 1, 9, 'moodle/backup:userinfo', -1000, 1415913130, 2),
(1649, 1, 9, 'moodle/badges:earnbadge', -1000, 1415913130, 2),
(1650, 1, 9, 'moodle/badges:viewbadges', -1000, 1415913130, 2),
(1651, 1, 9, 'moodle/blog:associatecourse', -1000, 1415913130, 2),
(1652, 1, 9, 'moodle/calendar:manageownentries', 1, 1415915911, 2),
(1653, 1, 9, 'moodle/course:delete', -1000, 1415913130, 2),
(1654, 1, 9, 'moodle/course:ignorefilesizelimits', -1000, 1415913130, 2),
(1655, 1, 9, 'moodle/course:isincompletionreports', -1000, 1415913130, 2),
(1656, 1, 9, 'moodle/course:view', -1000, 1415913130, 2),
(1657, 1, 9, 'moodle/grade:view', -1000, 1415913130, 2),
(1658, 1, 9, 'moodle/restore:rolldates', -1000, 1415913130, 2),
(1659, 1, 9, 'moodle/restore:userinfo', -1000, 1415913130, 2),
(1660, 1, 9, 'moodle/restore:viewautomatedfilearea', -1000, 1415913130, 2),
(1661, 1, 9, 'moodle/role:override', -1000, 1415913130, 2),
(1662, 1, 9, 'moodle/user:loginas', -1000, 1415913130, 2),
(1663, 1, 9, 'webservice/amf:use', -1000, 1415913130, 2),
(1664, 1, 9, 'webservice/rest:use', -1000, 1415913130, 2),
(1665, 1, 9, 'webservice/soap:use', -1000, 1415913130, 2),
(1666, 1, 9, 'webservice/xmlrpc:use', -1000, 1415913130, 2),
(1667, 1, 9, 'booktool/exportimscp:export', -1000, 1415913130, 2),
(1668, 1, 9, 'mod/assign:editothersubmission', -1000, 1415913130, 2),
(1669, 1, 9, 'mod/assign:submit', -1000, 1415913130, 2),
(1670, 1, 9, 'mod/assignment:submit', -1000, 1415913130, 2),
(1671, 1, 9, 'mod/data:manageuserpresets', -1000, 1415913130, 2),
(1672, 1, 9, 'mod/feedback:complete', -1000, 1415913130, 2),
(1673, 1, 9, 'mod/feedback:mapcourse', -1000, 1415913130, 2),
(1674, 1, 9, 'mod/folder:view', -1000, 1415913130, 2),
(1675, 1, 9, 'mod/imscp:view', -1000, 1415913130, 2),
(1676, 1, 9, 'mod/page:view', -1000, 1415913130, 2),
(1677, 1, 9, 'mod/quiz:attempt', -1000, 1415913130, 2),
(1678, 1, 9, 'mod/quiz:emailconfirmsubmission', -1000, 1415913130, 2),
(1679, 1, 9, 'mod/quiz:emailnotifysubmission', -1000, 1415913130, 2),
(1680, 1, 9, 'mod/quiz:emailwarnoverdue', -1000, 1415913130, 2),
(1681, 1, 9, 'mod/quiz:ignoretimelimits', -1000, 1415913130, 2),
(1682, 1, 9, 'mod/quiz:reviewmyattempts', -1000, 1415913130, 2),
(1683, 1, 9, 'mod/resource:view', -1000, 1415913130, 2),
(1684, 1, 9, 'mod/scorm:deleteownresponses', 1, 1415915911, 2),
(1685, 1, 9, 'mod/scorm:skipview', -1000, 1415913130, 2),
(1686, 1, 9, 'mod/url:view', -1000, 1415913130, 2),
(1687, 1, 9, 'mod/workshop:peerassess', -1000, 1415913130, 2),
(1688, 1, 9, 'mod/workshop:submit', -1000, 1415913130, 2),
(1689, 1, 9, 'moodle/blog:associatemodule', -1000, 1415913130, 2),
(1690, 1, 9, 'repository/alfresco:view', -1000, 1415913130, 2),
(1691, 1, 9, 'repository/areafiles:view', -1000, 1415913130, 2),
(1692, 1, 9, 'repository/boxnet:view', -1000, 1415913130, 2),
(1693, 1, 9, 'repository/dropbox:view', 1, 1415915911, 2),
(1694, 1, 9, 'repository/equella:view', -1000, 1415913130, 2),
(1695, 1, 9, 'repository/flickr:view', -1000, 1415913130, 2),
(1696, 1, 9, 'repository/flickr_public:view', -1000, 1415913130, 2),
(1697, 1, 9, 'repository/googledocs:view', 1, 1415915911, 2),
(1698, 1, 9, 'repository/merlot:view', -1000, 1415913130, 2),
(1699, 1, 9, 'repository/picasa:view', -1000, 1415913130, 2),
(1700, 1, 9, 'repository/recent:view', -1000, 1415913130, 2),
(1701, 1, 9, 'repository/s3:view', -1000, 1415913130, 2),
(1702, 1, 9, 'repository/skydrive:view', 1, 1415915911, 2),
(1703, 1, 9, 'repository/upload:view', 1, 1415915911, 2),
(1704, 1, 9, 'repository/url:view', 1, 1415915911, 2),
(1705, 1, 9, 'repository/user:view', 1, 1415915911, 2),
(1706, 1, 9, 'repository/wikimedia:view', -1000, 1415913130, 2),
(1707, 1, 9, 'repository/youtube:view', 1, 1415915911, 2),
(1708, 1, 9, 'block/rss_client:manageanyfeeds', -1000, 1415913130, 2),
(1709, 1, 10, 'block/admin_bookmarks:myaddinstance', -1000, 1416163598, 2),
(1710, 1, 10, 'block/badges:myaddinstance', -1000, 1416163598, 2),
(1711, 1, 10, 'block/calendar_month:myaddinstance', -1000, 1416163598, 2),
(1712, 1, 10, 'block/calendar_upcoming:myaddinstance', -1000, 1416163598, 2),
(1713, 1, 10, 'block/comments:myaddinstance', -1000, 1416163598, 2),
(1714, 1, 10, 'block/community:myaddinstance', -1000, 1416163598, 2),
(1715, 1, 10, 'block/course_list:myaddinstance', -1000, 1416163598, 2),
(1716, 1, 10, 'block/course_overview:myaddinstance', -1000, 1416163598, 2),
(1717, 1, 10, 'block/glossary_random:myaddinstance', -1000, 1416163598, 2),
(1718, 1, 10, 'block/html:myaddinstance', -1000, 1416163598, 2),
(1719, 1, 10, 'block/mentees:myaddinstance', -1000, 1416163598, 2),
(1720, 1, 10, 'block/messages:myaddinstance', -1000, 1416163598, 2),
(1721, 1, 10, 'block/mnet_hosts:myaddinstance', -1000, 1416163598, 2),
(1722, 1, 10, 'block/myprofile:myaddinstance', -1000, 1416163598, 2),
(1723, 1, 10, 'block/navigation:myaddinstance', -1000, 1416163598, 2),
(1724, 1, 10, 'block/news_items:myaddinstance', -1000, 1416163598, 2),
(1725, 1, 10, 'block/online_users:myaddinstance', -1000, 1416163598, 2),
(1726, 1, 10, 'block/private_files:myaddinstance', -1000, 1418228394, 2),
(1727, 1, 10, 'block/rss_client:myaddinstance', -1000, 1416163598, 2),
(1728, 1, 10, 'block/settings:myaddinstance', -1000, 1416163598, 2),
(1729, 1, 10, 'block/tags:myaddinstance', -1000, 1416163598, 2);
INSERT INTO `mdl_role_capabilities` (`id`, `contextid`, `roleid`, `capability`, `permission`, `timemodified`, `modifierid`) VALUES
(1730, 1, 10, 'enrol/category:synchronised', -1000, 1416163598, 2),
(1731, 1, 10, 'message/airnotifier:managedevice', -1000, 1416163598, 2),
(1732, 1, 10, 'moodle/badges:manageglobalsettings', -1000, 1416163598, 2),
(1733, 1, 10, 'moodle/blog:create', -1000, 1416163598, 2),
(1734, 1, 10, 'moodle/blog:manageentries', -1000, 1416163598, 2),
(1735, 1, 10, 'moodle/blog:viewdrafts', -1000, 1416163598, 2),
(1736, 1, 10, 'moodle/community:add', -1000, 1416163598, 2),
(1737, 1, 10, 'moodle/community:download', -1000, 1416163598, 2),
(1738, 1, 10, 'moodle/course:publish', -1000, 1416163598, 2),
(1739, 1, 10, 'moodle/course:request', -1000, 1416163598, 2),
(1740, 1, 10, 'moodle/course:viewsuspendedusers', -1000, 1416163598, 2),
(1741, 1, 10, 'moodle/grade:managesharedforms', -1000, 1416163598, 2),
(1742, 1, 10, 'moodle/grade:sharegradingforms', -1000, 1416163598, 2),
(1743, 1, 10, 'moodle/my:configsyspages', -1000, 1416163598, 2),
(1744, 1, 10, 'moodle/my:manageblocks', -1000, 1416163598, 2),
(1745, 1, 10, 'moodle/question:config', -1000, 1416163598, 2),
(1746, 1, 10, 'moodle/restore:createuser', -1000, 1416163598, 2),
(1747, 1, 10, 'moodle/role:manage', -1000, 1416163598, 2),
(1748, 1, 10, 'moodle/site:approvecourse', -1000, 1416163598, 2),
(1749, 1, 10, 'moodle/site:config', -1000, 1416163598, 2),
(1750, 1, 10, 'moodle/site:doclinks', -1000, 1416163598, 2),
(1751, 1, 10, 'moodle/site:forcelanguage', -1000, 1416163598, 2),
(1752, 1, 10, 'moodle/site:mnetlogintoremote', -1000, 1416163598, 2),
(1753, 1, 10, 'moodle/site:readallmessages', -1000, 1416163598, 2),
(1754, 1, 10, 'moodle/site:sendmessage', -1000, 1416163599, 2),
(1755, 1, 10, 'moodle/site:uploadusers', -1000, 1416163599, 2),
(1756, 1, 10, 'moodle/site:viewparticipants', -1000, 1416163599, 2),
(1757, 1, 10, 'moodle/tag:create', -1000, 1416163599, 2),
(1758, 1, 10, 'moodle/tag:edit', -1000, 1416163599, 2),
(1759, 1, 10, 'moodle/tag:editblocks', -1000, 1416163599, 2),
(1760, 1, 10, 'moodle/tag:flag', -1000, 1416163599, 2),
(1761, 1, 10, 'moodle/tag:manage', -1000, 1416163599, 2),
(1762, 1, 10, 'moodle/user:changeownpassword', -1000, 1416163599, 2),
(1763, 1, 10, 'moodle/user:create', -1000, 1416163599, 2),
(1764, 1, 10, 'moodle/user:delete', -1000, 1416163599, 2),
(1765, 1, 10, 'moodle/user:editownmessageprofile', -1000, 1416163599, 2),
(1766, 1, 10, 'moodle/user:editownprofile', -1000, 1416163599, 2),
(1767, 1, 10, 'moodle/user:ignoreuserquota', -1000, 1416163599, 2),
(1768, 1, 10, 'moodle/user:manageownblocks', -1000, 1416163599, 2),
(1769, 1, 10, 'moodle/user:manageownfiles', -1000, 1416163599, 2),
(1770, 1, 10, 'moodle/user:managesyspages', -1000, 1416163599, 2),
(1771, 1, 10, 'moodle/user:update', -1000, 1416163599, 2),
(1772, 1, 10, 'moodle/webservice:createmobiletoken', -1000, 1416163599, 2),
(1773, 1, 10, 'moodle/webservice:createtoken', -1000, 1416163599, 2),
(1774, 1, 10, 'report/courseoverview:view', -1000, 1416163599, 2),
(1775, 1, 10, 'report/performance:view', -1000, 1416163599, 2),
(1776, 1, 10, 'report/questioninstances:view', -1000, 1416163599, 2),
(1777, 1, 10, 'report/security:view', -1000, 1416163599, 2),
(1778, 1, 10, 'tool/customlang:edit', -1000, 1416163599, 2),
(1779, 1, 10, 'tool/customlang:view', -1000, 1416163599, 2),
(1780, 1, 10, 'tool/uploaduser:uploaduserpictures', -1000, 1416163599, 2),
(1781, 1, 10, 'moodle/badges:manageownbadges', -1000, 1416163599, 2),
(1782, 1, 10, 'moodle/badges:viewotherbadges', -1000, 1416163599, 2),
(1783, 1, 10, 'moodle/user:editmessageprofile', -1000, 1416163599, 2),
(1784, 1, 10, 'moodle/user:editprofile', -1000, 1416163599, 2),
(1785, 1, 10, 'moodle/user:manageblocks', -1000, 1416163599, 2),
(1786, 1, 10, 'moodle/user:viewalldetails', -1000, 1416163599, 2),
(1787, 1, 10, 'moodle/user:viewlastip', -1000, 1416163599, 2),
(1788, 1, 10, 'moodle/user:viewuseractivitiesreport', -1000, 1416163599, 2),
(1789, 1, 10, 'moodle/category:manage', -1000, 1416163599, 2),
(1790, 1, 10, 'moodle/category:viewhiddencategories', -1000, 1416163599, 2),
(1791, 1, 10, 'moodle/cohort:assign', -1000, 1416163599, 2),
(1792, 1, 10, 'moodle/cohort:manage', -1000, 1416163599, 2),
(1793, 1, 10, 'moodle/course:create', -1000, 1416163599, 2),
(1794, 1, 10, 'block/recent_activity:viewaddupdatemodule', -1000, 1416163599, 2),
(1795, 1, 10, 'block/recent_activity:viewdeletemodule', -1000, 1416163599, 2),
(1796, 1, 10, 'enrol/cohort:config', -1000, 1416163599, 2),
(1797, 1, 10, 'enrol/cohort:unenrol', -1000, 1416163599, 2),
(1798, 1, 10, 'enrol/database:unenrol', -1000, 1416163599, 2),
(1799, 1, 10, 'enrol/flatfile:manage', -1000, 1416163599, 2),
(1800, 1, 10, 'enrol/flatfile:unenrol', -1000, 1416163599, 2),
(1801, 1, 10, 'enrol/guest:config', -1000, 1416163599, 2),
(1802, 1, 10, 'enrol/ldap:manage', -1000, 1416163599, 2),
(1803, 1, 10, 'enrol/manual:config', -1000, 1416163599, 2),
(1804, 1, 10, 'enrol/manual:enrol', -1000, 1416163599, 2),
(1805, 1, 10, 'enrol/manual:manage', -1000, 1416163599, 2),
(1806, 1, 10, 'enrol/manual:unenrol', -1000, 1416163599, 2),
(1807, 1, 10, 'enrol/manual:unenrolself', -1000, 1416163599, 2),
(1808, 1, 10, 'enrol/meta:config', -1000, 1416163599, 2),
(1809, 1, 10, 'enrol/meta:selectaslinked', -1000, 1416163599, 2),
(1810, 1, 10, 'enrol/meta:unenrol', -1000, 1416163599, 2),
(1811, 1, 10, 'enrol/paypal:config', -1000, 1416163599, 2),
(1812, 1, 10, 'enrol/paypal:manage', -1000, 1416163599, 2),
(1813, 1, 10, 'enrol/paypal:unenrol', -1000, 1416163599, 2),
(1814, 1, 10, 'enrol/paypal:unenrolself', -1000, 1416163599, 2),
(1815, 1, 10, 'enrol/self:config', -1000, 1416163599, 2),
(1816, 1, 10, 'enrol/self:manage', -1000, 1416163599, 2),
(1817, 1, 10, 'enrol/self:unenrol', -1000, 1416163599, 2),
(1818, 1, 10, 'gradeexport/ods:publish', -1000, 1416163599, 2),
(1819, 1, 10, 'gradeexport/ods:view', -1000, 1416163599, 2),
(1820, 1, 10, 'gradeexport/txt:publish', -1000, 1416163599, 2),
(1821, 1, 10, 'gradeexport/txt:view', -1000, 1416163599, 2),
(1822, 1, 10, 'gradeexport/xls:publish', -1000, 1416163599, 2),
(1823, 1, 10, 'gradeexport/xls:view', -1000, 1416163599, 2),
(1824, 1, 10, 'gradeexport/xml:publish', -1000, 1416163599, 2),
(1825, 1, 10, 'gradeexport/xml:view', -1000, 1416163599, 2),
(1826, 1, 10, 'gradeimport/csv:view', -1000, 1416163599, 2),
(1827, 1, 10, 'gradeimport/xml:publish', -1000, 1416163599, 2),
(1828, 1, 10, 'gradeimport/xml:view', -1000, 1416163599, 2),
(1829, 1, 10, 'gradereport/grader:view', -1000, 1416163599, 2),
(1830, 1, 10, 'gradereport/outcomes:view', -1000, 1416163599, 2),
(1831, 1, 10, 'mod/assign:addinstance', -1000, 1416163599, 2),
(1832, 1, 10, 'mod/assignment:addinstance', -1000, 1416163599, 2),
(1833, 1, 10, 'mod/book:addinstance', -1000, 1416163599, 2),
(1834, 1, 10, 'mod/chat:addinstance', -1000, 1416163599, 2),
(1835, 1, 10, 'mod/choice:addinstance', -1000, 1416163599, 2),
(1836, 1, 10, 'mod/data:addinstance', -1000, 1416163599, 2),
(1837, 1, 10, 'mod/feedback:addinstance', -1000, 1416163599, 2),
(1838, 1, 10, 'mod/folder:addinstance', -1000, 1416163599, 2),
(1839, 1, 10, 'mod/forum:addinstance', -1000, 1416163599, 2),
(1840, 1, 10, 'mod/glossary:addinstance', -1000, 1416163599, 2),
(1841, 1, 10, 'mod/imscp:addinstance', -1000, 1416163599, 2),
(1842, 1, 10, 'mod/label:addinstance', -1000, 1416163599, 2),
(1843, 1, 10, 'mod/lesson:addinstance', -1000, 1416163599, 2),
(1844, 1, 10, 'mod/lti:addcoursetool', -1000, 1416163599, 2),
(1845, 1, 10, 'mod/lti:addinstance', -1000, 1416163599, 2),
(1846, 1, 10, 'mod/lti:requesttooladd', -1000, 1416163599, 2),
(1847, 1, 10, 'mod/page:addinstance', -1000, 1416163599, 2),
(1848, 1, 10, 'mod/quiz:addinstance', -1000, 1416163599, 2),
(1849, 1, 10, 'mod/resource:addinstance', -1000, 1416163599, 2),
(1850, 1, 10, 'mod/scorm:addinstance', -1000, 1416163599, 2),
(1851, 1, 10, 'mod/survey:addinstance', -1000, 1416163599, 2),
(1852, 1, 10, 'mod/url:addinstance', -1000, 1416163599, 2),
(1853, 1, 10, 'mod/wiki:addinstance', -1000, 1416163599, 2),
(1854, 1, 10, 'mod/workshop:addinstance', -1000, 1416163599, 2),
(1855, 1, 10, 'moodle/backup:anonymise', -1000, 1416163599, 2),
(1856, 1, 10, 'moodle/backup:backupcourse', -1000, 1416163599, 2),
(1857, 1, 10, 'moodle/backup:backupsection', -1000, 1416163599, 2),
(1858, 1, 10, 'moodle/backup:backuptargethub', -1000, 1416163599, 2),
(1859, 1, 10, 'moodle/backup:backuptargetimport', -1000, 1416163599, 2),
(1860, 1, 10, 'moodle/backup:configure', -1000, 1416163599, 2),
(1861, 1, 10, 'moodle/backup:downloadfile', -1000, 1416163599, 2),
(1862, 1, 10, 'moodle/backup:userinfo', -1000, 1416163599, 2),
(1863, 1, 10, 'moodle/badges:awardbadge', -1000, 1416163599, 2),
(1864, 1, 10, 'moodle/badges:configurecriteria', -1000, 1416163599, 2),
(1865, 1, 10, 'moodle/badges:configuredetails', -1000, 1416163599, 2),
(1866, 1, 10, 'moodle/badges:configuremessages', -1000, 1416163599, 2),
(1867, 1, 10, 'moodle/badges:createbadge', -1000, 1416163599, 2),
(1868, 1, 10, 'moodle/badges:deletebadge', -1000, 1416163599, 2),
(1869, 1, 10, 'moodle/badges:earnbadge', -1000, 1416163599, 2),
(1870, 1, 10, 'moodle/badges:viewawarded', -1000, 1416163599, 2),
(1871, 1, 10, 'moodle/badges:viewbadges', -1000, 1416163599, 2),
(1872, 1, 10, 'moodle/blog:associatecourse', -1000, 1416163599, 2),
(1873, 1, 10, 'moodle/calendar:manageentries', -1000, 1416163599, 2),
(1874, 1, 10, 'moodle/calendar:managegroupentries', -1000, 1416163599, 2),
(1875, 1, 10, 'moodle/calendar:manageownentries', -1000, 1416163599, 2),
(1876, 1, 10, 'moodle/cohort:view', -1000, 1416163599, 2),
(1877, 1, 10, 'moodle/comment:delete', -1000, 1416163599, 2),
(1878, 1, 10, 'moodle/course:bulkmessaging', -1000, 1416163599, 2),
(1879, 1, 10, 'moodle/course:changecategory', -1000, 1416163599, 2),
(1880, 1, 10, 'moodle/course:changefullname', -1000, 1416163599, 2),
(1881, 1, 10, 'moodle/course:changeidnumber', -1000, 1416163599, 2),
(1882, 1, 10, 'moodle/course:changeshortname', -1000, 1416163599, 2),
(1883, 1, 10, 'moodle/course:changesummary', -1000, 1416163599, 2),
(1884, 1, 10, 'moodle/course:delete', -1000, 1416163599, 2),
(1885, 1, 10, 'moodle/course:enrolconfig', -1000, 1416163599, 2),
(1886, 1, 10, 'moodle/course:enrolreview', -1000, 1416163599, 2),
(1887, 1, 10, 'moodle/course:ignorefilesizelimits', -1000, 1416163599, 2),
(1888, 1, 10, 'moodle/course:managefiles', -1000, 1416163599, 2),
(1889, 1, 10, 'moodle/course:managegroups', -1000, 1416163599, 2),
(1890, 1, 10, 'moodle/course:managescales', -1000, 1416163599, 2),
(1891, 1, 10, 'moodle/course:markcomplete', -1000, 1416163599, 2),
(1892, 1, 10, 'moodle/course:movesections', -1000, 1416163599, 2),
(1893, 1, 10, 'moodle/course:reset', -1000, 1416163599, 2),
(1894, 1, 10, 'moodle/course:reviewotherusers', -1000, 1416163599, 2),
(1895, 1, 10, 'moodle/course:sectionvisibility', -1000, 1416163599, 2),
(1896, 1, 10, 'moodle/course:setcurrentsection', -1000, 1416163599, 2),
(1897, 1, 10, 'moodle/course:update', -1000, 1416163599, 2),
(1898, 1, 10, 'moodle/course:useremail', -1000, 1416163599, 2),
(1899, 1, 10, 'moodle/course:view', -1000, 1416163599, 2),
(1900, 1, 10, 'moodle/course:viewhiddencourses', -1000, 1416163599, 2),
(1901, 1, 10, 'moodle/course:viewhiddensections', -1000, 1416163599, 2),
(1902, 1, 10, 'moodle/course:viewhiddenuserfields', -1000, 1416163599, 2),
(1903, 1, 10, 'moodle/course:visibility', -1000, 1416163599, 2),
(1904, 1, 10, 'moodle/filter:manage', -1000, 1416163599, 2),
(1905, 1, 10, 'moodle/grade:edit', -1000, 1416163599, 2),
(1906, 1, 10, 'moodle/grade:export', -1000, 1416163599, 2),
(1907, 1, 10, 'moodle/grade:hide', -1000, 1416163599, 2),
(1908, 1, 10, 'moodle/grade:import', -1000, 1416163599, 2),
(1909, 1, 10, 'moodle/grade:lock', -1000, 1416163599, 2),
(1910, 1, 10, 'moodle/grade:manage', -1000, 1416163599, 2),
(1911, 1, 10, 'moodle/grade:managegradingforms', -1000, 1416163599, 2),
(1912, 1, 10, 'moodle/grade:manageletters', -1000, 1416163599, 2),
(1913, 1, 10, 'moodle/grade:manageoutcomes', -1000, 1416163599, 2),
(1914, 1, 10, 'moodle/grade:unlock', -1000, 1416163599, 2),
(1915, 1, 10, 'moodle/grade:viewall', -1000, 1416163599, 2),
(1916, 1, 10, 'moodle/grade:viewhidden', -1000, 1416163599, 2),
(1917, 1, 10, 'moodle/notes:manage', -1000, 1416163599, 2),
(1918, 1, 10, 'moodle/notes:view', -1000, 1416163599, 2),
(1919, 1, 10, 'moodle/question:add', -1000, 1416163599, 2),
(1920, 1, 10, 'moodle/question:editall', -1000, 1416163599, 2),
(1921, 1, 10, 'moodle/question:editmine', -1000, 1416163599, 2),
(1922, 1, 10, 'moodle/question:managecategory', -1000, 1416163599, 2),
(1923, 1, 10, 'moodle/question:moveall', -1000, 1416163599, 2),
(1924, 1, 10, 'moodle/question:movemine', -1000, 1416163599, 2),
(1925, 1, 10, 'moodle/question:useall', -1000, 1416163599, 2),
(1926, 1, 10, 'moodle/question:usemine', -1000, 1416163599, 2),
(1927, 1, 10, 'moodle/question:viewall', -1000, 1416163599, 2),
(1928, 1, 10, 'moodle/question:viewmine', -1000, 1416163599, 2),
(1929, 1, 10, 'moodle/restore:configure', -1000, 1416163599, 2),
(1930, 1, 10, 'moodle/restore:restoreactivity', -1000, 1416163599, 2),
(1931, 1, 10, 'moodle/restore:restorecourse', -1000, 1416163599, 2),
(1932, 1, 10, 'moodle/restore:restoresection', -1000, 1416163599, 2),
(1933, 1, 10, 'moodle/restore:restoretargethub', -1000, 1416163599, 2),
(1934, 1, 10, 'moodle/restore:restoretargetimport', -1000, 1416163599, 2),
(1935, 1, 10, 'moodle/restore:rolldates', -1000, 1416163599, 2),
(1936, 1, 10, 'moodle/restore:uploadfile', -1000, 1416163599, 2),
(1937, 1, 10, 'moodle/restore:userinfo', -1000, 1416163599, 2),
(1938, 1, 10, 'moodle/restore:viewautomatedfilearea', -1000, 1416163599, 2),
(1939, 1, 10, 'moodle/role:assign', -1000, 1416163599, 2),
(1940, 1, 10, 'moodle/role:override', -1000, 1416163599, 2),
(1941, 1, 10, 'moodle/role:review', -1000, 1416163599, 2),
(1942, 1, 10, 'moodle/role:safeoverride', -1000, 1416163599, 2),
(1943, 1, 10, 'moodle/role:switchroles', -1000, 1416163599, 2),
(1944, 1, 10, 'moodle/site:accessallgroups', -1000, 1416163599, 2),
(1945, 1, 10, 'moodle/site:trustcontent', -1000, 1416163599, 2),
(1946, 1, 10, 'moodle/site:viewfullnames', -1000, 1416163599, 2),
(1947, 1, 10, 'moodle/site:viewreports', -1000, 1416163599, 2),
(1948, 1, 10, 'moodle/site:viewuseridentity', -1000, 1416163599, 2),
(1949, 1, 10, 'moodle/user:loginas', -1000, 1416163599, 2),
(1950, 1, 10, 'moodle/user:viewhiddendetails', -1000, 1416163599, 2),
(1951, 1, 10, 'report/completion:view', -1000, 1416163599, 2),
(1952, 1, 10, 'report/log:view', -1000, 1416163599, 2),
(1953, 1, 10, 'report/log:viewtoday', -1000, 1416163599, 2),
(1954, 1, 10, 'report/loglive:view', -1000, 1416163599, 2),
(1955, 1, 10, 'report/outline:view', -1000, 1416163599, 2),
(1956, 1, 10, 'report/participation:view', -1000, 1416163599, 2),
(1957, 1, 10, 'report/progress:view', -1000, 1416163599, 2),
(1958, 1, 10, 'report/stats:view', -1000, 1416163599, 2),
(1959, 1, 10, 'webservice/amf:use', -1000, 1416163599, 2),
(1960, 1, 10, 'webservice/rest:use', -1000, 1416163599, 2),
(1961, 1, 10, 'webservice/soap:use', -1000, 1416163599, 2),
(1962, 1, 10, 'webservice/xmlrpc:use', -1000, 1416163599, 2),
(1963, 1, 10, 'booktool/exportimscp:export', -1000, 1416163599, 2),
(1964, 1, 10, 'booktool/importhtml:import', -1000, 1416163599, 2),
(1965, 1, 10, 'mod/assign:editothersubmission', -1000, 1416163599, 2),
(1966, 1, 10, 'mod/assign:grade', -1000, 1416163599, 2),
(1967, 1, 10, 'mod/assign:grantextension', -1000, 1416163599, 2),
(1968, 1, 10, 'mod/assign:manageallocations', -1000, 1416163599, 2),
(1969, 1, 10, 'mod/assign:managegrades', -1000, 1416163599, 2),
(1970, 1, 10, 'mod/assign:releasegrades', -1000, 1416163599, 2),
(1971, 1, 10, 'mod/assign:revealidentities', -1000, 1416163599, 2),
(1972, 1, 10, 'mod/assign:reviewgrades', -1000, 1416163599, 2),
(1973, 1, 10, 'mod/assign:viewgrades', -1000, 1416163599, 2),
(1974, 1, 10, 'mod/assignment:grade', -1000, 1416163599, 2),
(1975, 1, 10, 'mod/book:edit', -1000, 1416163599, 2),
(1976, 1, 10, 'mod/book:viewhiddenchapters', -1000, 1416163599, 2),
(1977, 1, 10, 'mod/chat:deletelog', -1000, 1416163599, 2),
(1978, 1, 10, 'mod/chat:exportparticipatedsession', -1000, 1416163599, 2),
(1979, 1, 10, 'mod/chat:exportsession', -1000, 1416163599, 2),
(1980, 1, 10, 'mod/choice:deleteresponses', -1000, 1416163599, 2),
(1981, 1, 10, 'mod/choice:downloadresponses', -1000, 1416163599, 2),
(1982, 1, 10, 'mod/choice:readresponses', -1000, 1416163599, 2),
(1983, 1, 10, 'mod/data:approve', -1000, 1416163599, 2),
(1984, 1, 10, 'mod/data:exportallentries', -1000, 1416163599, 2),
(1985, 1, 10, 'mod/data:exportentry', -1000, 1416163599, 2),
(1986, 1, 10, 'mod/data:exportuserinfo', -1000, 1416163599, 2),
(1987, 1, 10, 'mod/data:managecomments', -1000, 1416163599, 2),
(1988, 1, 10, 'mod/data:manageentries', -1000, 1416163599, 2),
(1989, 1, 10, 'mod/data:managetemplates', -1000, 1416163599, 2),
(1990, 1, 10, 'mod/data:manageuserpresets', -1000, 1416163599, 2),
(1991, 1, 10, 'mod/data:rate', -1000, 1416163599, 2),
(1992, 1, 10, 'mod/data:viewallratings', -1000, 1416163599, 2),
(1993, 1, 10, 'mod/data:viewalluserpresets', -1000, 1416163599, 2),
(1994, 1, 10, 'mod/data:viewanyrating', -1000, 1416163599, 2),
(1995, 1, 10, 'mod/data:viewrating', -1000, 1416163599, 2),
(1996, 1, 10, 'mod/feedback:createprivatetemplate', -1000, 1418228394, 2),
(1997, 1, 10, 'mod/feedback:createpublictemplate', -1000, 1416163599, 2),
(1998, 1, 10, 'mod/feedback:deletesubmissions', -1000, 1416163599, 2),
(1999, 1, 10, 'mod/feedback:deletetemplate', -1000, 1416163599, 2),
(2000, 1, 10, 'mod/feedback:edititems', -1000, 1416163599, 2),
(2001, 1, 10, 'mod/feedback:mapcourse', -1000, 1416163599, 2),
(2002, 1, 10, 'mod/feedback:receivemail', -1000, 1416163599, 2),
(2003, 1, 10, 'mod/feedback:viewreports', -1000, 1416163599, 2),
(2004, 1, 10, 'mod/folder:managefiles', -1000, 1416163599, 2),
(2005, 1, 10, 'mod/folder:view', -1000, 1416163599, 2),
(2006, 1, 10, 'mod/forum:addnews', -1000, 1416163599, 2),
(2007, 1, 10, 'mod/forum:addquestion', -1000, 1416163599, 2),
(2008, 1, 10, 'mod/forum:deleteanypost', -1000, 1416163599, 2),
(2009, 1, 10, 'mod/forum:editanypost', -1000, 1416163599, 2),
(2010, 1, 10, 'mod/forum:exportdiscussion', -1000, 1416163599, 2),
(2011, 1, 10, 'mod/forum:exportpost', -1000, 1416163599, 2),
(2012, 1, 10, 'mod/forum:managesubscriptions', -1000, 1416163599, 2),
(2013, 1, 10, 'mod/forum:movediscussions', -1000, 1416163599, 2),
(2014, 1, 10, 'mod/forum:postwithoutthrottling', -1000, 1416163599, 2),
(2015, 1, 10, 'mod/forum:rate', -1000, 1416163599, 2),
(2016, 1, 10, 'mod/forum:replynews', -1000, 1416163599, 2),
(2017, 1, 10, 'mod/forum:splitdiscussions', -1000, 1416163599, 2),
(2018, 1, 10, 'mod/forum:viewallratings', -1000, 1416163599, 2),
(2019, 1, 10, 'mod/forum:viewanyrating', -1000, 1416163599, 2),
(2020, 1, 10, 'mod/forum:viewhiddentimedposts', -1000, 1416163599, 2),
(2021, 1, 10, 'mod/forum:viewqandawithoutposting', -1000, 1416163599, 2),
(2022, 1, 10, 'mod/forum:viewsubscribers', -1000, 1416163599, 2),
(2023, 1, 10, 'mod/glossary:approve', -1000, 1416163599, 2),
(2024, 1, 10, 'mod/glossary:export', -1000, 1416163599, 2),
(2025, 1, 10, 'mod/glossary:exportentry', -1000, 1416163599, 2),
(2026, 1, 10, 'mod/glossary:import', -1000, 1416163599, 2),
(2027, 1, 10, 'mod/glossary:managecategories', -1000, 1416163599, 2),
(2028, 1, 10, 'mod/glossary:managecomments', -1000, 1416163599, 2),
(2029, 1, 10, 'mod/glossary:manageentries', -1000, 1416163599, 2),
(2030, 1, 10, 'mod/glossary:rate', -1000, 1416163599, 2),
(2031, 1, 10, 'mod/glossary:viewallratings', -1000, 1416163599, 2),
(2032, 1, 10, 'mod/glossary:viewanyrating', -1000, 1416163599, 2),
(2033, 1, 10, 'mod/glossary:viewrating', -1000, 1416163599, 2),
(2034, 1, 10, 'mod/imscp:view', -1000, 1416163599, 2),
(2035, 1, 10, 'mod/lesson:edit', -1000, 1416163599, 2),
(2036, 1, 10, 'mod/lesson:manage', -1000, 1416163599, 2),
(2037, 1, 10, 'mod/lti:grade', -1000, 1416163599, 2),
(2038, 1, 10, 'mod/lti:manage', -1000, 1416163599, 2),
(2039, 1, 10, 'mod/page:view', -1000, 1416163599, 2),
(2040, 1, 10, 'mod/quiz:deleteattempts', -1000, 1416163599, 2),
(2041, 1, 10, 'mod/quiz:emailconfirmsubmission', 1, 1416169355, 2),
(2042, 1, 10, 'mod/quiz:emailnotifysubmission', 1, 1416169355, 2),
(2043, 1, 10, 'mod/quiz:emailwarnoverdue', -1000, 1416163599, 2),
(2044, 1, 10, 'mod/quiz:grade', -1000, 1416163599, 2),
(2045, 1, 10, 'mod/quiz:ignoretimelimits', -1000, 1416163599, 2),
(2046, 1, 10, 'mod/quiz:manage', -1000, 1416163599, 2),
(2047, 1, 10, 'mod/quiz:manageoverrides', -1000, 1416163599, 2),
(2048, 1, 10, 'mod/quiz:preview', -1000, 1416163599, 2),
(2049, 1, 10, 'mod/quiz:regrade', -1000, 1416163599, 2),
(2050, 1, 10, 'mod/quiz:viewreports', -1000, 1416163599, 2),
(2051, 1, 10, 'mod/resource:view', -1000, 1416163599, 2),
(2052, 1, 10, 'mod/scorm:deleteownresponses', -1000, 1416163599, 2),
(2053, 1, 10, 'mod/scorm:deleteresponses', -1000, 1416163599, 2),
(2054, 1, 10, 'mod/scorm:viewreport', -1000, 1416163599, 2),
(2055, 1, 10, 'mod/survey:download', -1000, 1416163599, 2),
(2056, 1, 10, 'mod/survey:readresponses', -1000, 1416163599, 2),
(2057, 1, 10, 'mod/url:view', -1000, 1416163599, 2),
(2058, 1, 10, 'mod/wiki:managecomment', -1000, 1416163599, 2),
(2059, 1, 10, 'mod/wiki:managefiles', -1000, 1416163599, 2),
(2060, 1, 10, 'mod/wiki:managewiki', -1000, 1416163599, 2),
(2061, 1, 10, 'mod/wiki:overridelock', -1000, 1416163599, 2),
(2062, 1, 10, 'mod/workshop:allocate', -1000, 1416163599, 2),
(2063, 1, 10, 'mod/workshop:editdimensions', -1000, 1416163599, 2),
(2064, 1, 10, 'mod/workshop:ignoredeadlines', -1000, 1416163599, 2),
(2065, 1, 10, 'mod/workshop:manageexamples', -1000, 1416163599, 2),
(2066, 1, 10, 'mod/workshop:overridegrades', -1000, 1416163599, 2),
(2067, 1, 10, 'mod/workshop:publishsubmissions', -1000, 1416163599, 2),
(2068, 1, 10, 'mod/workshop:switchphase', -1000, 1416163599, 2),
(2069, 1, 10, 'mod/workshop:viewallassessments', -1000, 1416163599, 2),
(2070, 1, 10, 'mod/workshop:viewallsubmissions', -1000, 1416163599, 2),
(2071, 1, 10, 'mod/workshop:viewreviewernames', -1000, 1416163599, 2),
(2072, 1, 10, 'moodle/backup:backupactivity', -1000, 1416163599, 2),
(2073, 1, 10, 'moodle/blog:associatemodule', -1000, 1416163599, 2),
(2074, 1, 10, 'moodle/course:activityvisibility', -1000, 1416163599, 2),
(2075, 1, 10, 'moodle/course:manageactivities', -1000, 1416163599, 2),
(2076, 1, 10, 'moodle/course:viewhiddenactivities', -1000, 1416163599, 2),
(2077, 1, 10, 'quiz/grading:viewidnumber', -1000, 1416163599, 2),
(2078, 1, 10, 'quiz/grading:viewstudentnames', -1000, 1416163599, 2),
(2079, 1, 10, 'quiz/statistics:view', -1000, 1416163599, 2),
(2080, 1, 10, 'repository/alfresco:view', -1000, 1416163599, 2),
(2081, 1, 10, 'repository/areafiles:view', -1000, 1416163599, 2),
(2082, 1, 10, 'repository/boxnet:view', -1000, 1416163599, 2),
(2083, 1, 10, 'repository/coursefiles:view', -1000, 1416163599, 2),
(2084, 1, 10, 'repository/dropbox:view', -1000, 1416163599, 2),
(2085, 1, 10, 'repository/equella:view', -1000, 1416163599, 2),
(2086, 1, 10, 'repository/filesystem:view', -1000, 1416163599, 2),
(2087, 1, 10, 'repository/flickr:view', -1000, 1416163599, 2),
(2088, 1, 10, 'repository/flickr_public:view', -1000, 1416163599, 2),
(2089, 1, 10, 'repository/googledocs:view', -1000, 1416163599, 2),
(2090, 1, 10, 'repository/local:view', -1000, 1416163599, 2),
(2091, 1, 10, 'repository/merlot:view', -1000, 1416163599, 2),
(2092, 1, 10, 'repository/picasa:view', -1000, 1416163599, 2),
(2093, 1, 10, 'repository/recent:view', -1000, 1416163599, 2),
(2094, 1, 10, 'repository/s3:view', -1000, 1416163599, 2),
(2095, 1, 10, 'repository/skydrive:view', -1000, 1416163599, 2),
(2096, 1, 10, 'repository/upload:view', -1000, 1416163599, 2),
(2097, 1, 10, 'repository/url:view', -1000, 1416163599, 2),
(2098, 1, 10, 'repository/user:view', -1000, 1416163599, 2),
(2099, 1, 10, 'repository/webdav:view', -1000, 1416163599, 2),
(2100, 1, 10, 'repository/wikimedia:view', -1000, 1416163599, 2),
(2101, 1, 10, 'repository/youtube:view', -1000, 1416163599, 2),
(2102, 1, 10, 'block/activity_modules:addinstance', -1000, 1416163599, 2),
(2103, 1, 10, 'block/admin_bookmarks:addinstance', -1000, 1416163599, 2),
(2104, 1, 10, 'block/badges:addinstance', -1000, 1416163599, 2),
(2105, 1, 10, 'block/blog_menu:addinstance', -1000, 1416163599, 2),
(2106, 1, 10, 'block/blog_recent:addinstance', -1000, 1416163599, 2),
(2107, 1, 10, 'block/blog_tags:addinstance', -1000, 1416163599, 2),
(2108, 1, 10, 'block/calendar_month:addinstance', -1000, 1416163599, 2),
(2109, 1, 10, 'block/calendar_upcoming:addinstance', -1000, 1416163599, 2),
(2110, 1, 10, 'block/comments:addinstance', -1000, 1416163599, 2),
(2111, 1, 10, 'block/community:addinstance', -1000, 1416163599, 2),
(2112, 1, 10, 'block/completionstatus:addinstance', -1000, 1416163599, 2),
(2113, 1, 10, 'block/course_list:addinstance', -1000, 1416163599, 2),
(2114, 1, 10, 'block/course_overview:addinstance', -1000, 1416163599, 2),
(2115, 1, 10, 'block/course_summary:addinstance', -1000, 1416163599, 2),
(2116, 1, 10, 'block/feedback:addinstance', -1000, 1416163599, 2),
(2117, 1, 10, 'block/glossary_random:addinstance', -1000, 1416163599, 2),
(2118, 1, 10, 'block/html:addinstance', -1000, 1416163599, 2),
(2119, 1, 10, 'block/login:addinstance', -1000, 1416163599, 2),
(2120, 1, 10, 'block/mentees:addinstance', -1000, 1416163599, 2),
(2121, 1, 10, 'block/messages:addinstance', -1000, 1416163599, 2),
(2122, 1, 10, 'block/mnet_hosts:addinstance', -1000, 1416163599, 2),
(2123, 1, 10, 'block/myprofile:addinstance', -1000, 1416163599, 2),
(2124, 1, 10, 'block/navigation:addinstance', -1000, 1416163599, 2),
(2125, 1, 10, 'block/news_items:addinstance', -1000, 1416163599, 2),
(2126, 1, 10, 'block/online_users:addinstance', -1000, 1416163599, 2),
(2127, 1, 10, 'block/participants:addinstance', -1000, 1416163599, 2),
(2128, 1, 10, 'block/private_files:addinstance', -1000, 1418228394, 2),
(2129, 1, 10, 'block/quiz_results:addinstance', -1000, 1416163599, 2),
(2130, 1, 10, 'block/recent_activity:addinstance', -1000, 1416163599, 2),
(2131, 1, 10, 'block/rss_client:addinstance', -1000, 1416163599, 2),
(2132, 1, 10, 'block/rss_client:manageanyfeeds', -1000, 1416163599, 2),
(2133, 1, 10, 'block/rss_client:manageownfeeds', -1000, 1416163599, 2),
(2134, 1, 10, 'block/search_forums:addinstance', -1000, 1416163599, 2),
(2135, 1, 10, 'block/section_links:addinstance', -1000, 1416163599, 2),
(2136, 1, 10, 'block/selfcompletion:addinstance', -1000, 1416163599, 2),
(2137, 1, 10, 'block/settings:addinstance', -1000, 1416163599, 2),
(2138, 1, 10, 'block/site_main_menu:addinstance', -1000, 1416163599, 2),
(2139, 1, 10, 'block/social_activities:addinstance', -1000, 1416163599, 2),
(2140, 1, 10, 'block/tags:addinstance', -1000, 1416163599, 2),
(2141, 1, 10, 'block/tag_flickr:addinstance', -1000, 1416163599, 2),
(2142, 1, 10, 'block/tag_youtube:addinstance', -1000, 1416163599, 2),
(2143, 1, 10, 'moodle/block:edit', -1000, 1416163599, 2),
(2144, 1, 10, 'moodle/site:manageblocks', -1000, 1416163599, 2),
(2145, 1, 1, 'block/quickmail:myaddinstance', 1, 1417664309, 2),
(2146, 1, 8, 'block/quickmail:myaddinstance', -1, 1417664309, 2),
(2147, 1, 7, 'block/quickmail:myaddinstance', -1, 1417664309, 2),
(2148, 1, 3, 'block/quickmail:addinstance', 1, 1417664309, 2),
(2149, 1, 1, 'block/quickmail:addinstance', 1, 1417664309, 2),
(2150, 1, 9, 'block/quickmail:addinstance', -1000, 1417664309, 2),
(2151, 1, 10, 'block/quickmail:addinstance', -1000, 1417664309, 2),
(2152, 1, 1, 'block/quickmail:cansend', 1, 1417664309, 2),
(2153, 1, 3, 'block/quickmail:cansend', 1, 1417664309, 2),
(2154, 1, 9, 'block/quickmail:cansend', 1, 1417664309, 2),
(2155, 1, 2, 'block/quickmail:cansend', 1, 1417664309, 2),
(2156, 1, 4, 'block/quickmail:cansend', 1, 1417664309, 2),
(2157, 1, 1, 'block/quickmail:allowalternate', 1, 1417664309, 2),
(2158, 1, 3, 'block/quickmail:allowalternate', 1, 1417664310, 2),
(2159, 1, 9, 'block/quickmail:allowalternate', 1, 1417664310, 2),
(2160, 1, 4, 'block/quickmail:allowalternate', 1, 1417664310, 2),
(2161, 1, 2, 'block/quickmail:allowalternate', 1, 1417664310, 2),
(2162, 1, 1, 'block/quickmail:canconfig', 1, 1417664310, 2),
(2163, 1, 3, 'block/quickmail:canconfig', 1, 1417664310, 2),
(2164, 1, 9, 'block/quickmail:canconfig', 1, 1417664310, 2),
(2165, 1, 1, 'block/quickmail:canimpersonate', 1, 1417664310, 2),
(2166, 1, 1, 'block/quickmail:candelete', 1, 1417664310, 2),
(2167, 1, 10, 'block/quickmail:myaddinstance', -1000, 1418226823, 2),
(2168, 1, 10, 'block/quickmail:allowalternate', -1000, 1418226823, 2),
(2169, 1, 10, 'block/quickmail:canconfig', -1000, 1418226823, 2),
(2170, 1, 10, 'block/quickmail:candelete', -1000, 1418226823, 2),
(2171, 1, 10, 'block/quickmail:canimpersonate', -1000, 1418226823, 2),
(2172, 1, 10, 'block/quickmail:cansend', -1000, 1418226823, 2),
(2173, 1, 7, 'mod/feedback:createprivatetemplate', -1000, 1418231124, 2),
(2174, 1, 7, 'block/private_files:addinstance', -1000, 1418231124, 2),
(2175, 1, 5, 'block/private_files:myaddinstance', -1000, 1418231154, 2),
(2176, 1, 5, 'moodle/user:manageownfiles', -1000, 1418231154, 2),
(2177, 1, 5, 'mod/feedback:createprivatetemplate', -1000, 1418231154, 2),
(2178, 1, 5, 'repository/user:view', -1000, 1418231154, 2),
(2179, 1, 5, 'block/private_files:addinstance', -1000, 1418231154, 2);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_role_context_levels`
--

CREATE TABLE IF NOT EXISTS `mdl_role_context_levels` (
`id` bigint(10) NOT NULL,
  `roleid` bigint(10) NOT NULL,
  `contextlevel` bigint(10) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8 COMMENT='Lists which roles can be assigned at which context levels. T';

--
-- Dumping data for table `mdl_role_context_levels`
--

INSERT INTO `mdl_role_context_levels` (`id`, `roleid`, `contextlevel`) VALUES
(1, 1, 10),
(4, 2, 10),
(2, 1, 40),
(5, 2, 40),
(3, 1, 50),
(6, 3, 50),
(8, 4, 50),
(48, 5, 50),
(28, 9, 50),
(42, 10, 50),
(7, 3, 70),
(9, 4, 70),
(49, 5, 70),
(29, 9, 70),
(43, 10, 70);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_role_names`
--

CREATE TABLE IF NOT EXISTS `mdl_role_names` (
`id` bigint(10) NOT NULL,
  `roleid` bigint(10) NOT NULL DEFAULT '0',
  `contextid` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='role names in native strings';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_role_sortorder`
--

CREATE TABLE IF NOT EXISTS `mdl_role_sortorder` (
`id` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `roleid` bigint(10) NOT NULL,
  `contextid` bigint(10) NOT NULL,
  `sortoder` bigint(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='sort order of course managers in a course';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_scale`
--

CREATE TABLE IF NOT EXISTS `mdl_scale` (
`id` bigint(10) NOT NULL,
  `courseid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `scale` longtext NOT NULL,
  `description` longtext NOT NULL,
  `descriptionformat` tinyint(2) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='Defines grading scales';

--
-- Dumping data for table `mdl_scale`
--

INSERT INTO `mdl_scale` (`id`, `courseid`, `userid`, `name`, `scale`, `description`, `descriptionformat`, `timemodified`) VALUES
(1, 0, 0, 'Separate and Connected ways of knowing', 'Mostly separate knowing,Separate and connected,Mostly connected knowing', 'The scale based on the theory of separate and connected knowing. This theory describes two different ways that we can evaluate and learn about the things we see and hear.<ul><li><strong>Separate knowers</strong> remain as objective as possible without including feelings and emotions. In a discussion with other people, they like to defend their own ideas, using logic to find holes in opponent''s ideas.</li><li><strong>Connected knowers</strong> are more sensitive to other people. They are skilled at empathy and tends to listen and ask questions until they feel they can connect and "understand things from their point of view". They learn by trying to share the experiences that led to the knowledge they find in other people.</li></ul>', 0, 1418230094);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_scale_history`
--

CREATE TABLE IF NOT EXISTS `mdl_scale_history` (
`id` bigint(10) NOT NULL,
  `action` bigint(10) NOT NULL DEFAULT '0',
  `oldid` bigint(10) NOT NULL,
  `source` varchar(255) DEFAULT NULL,
  `timemodified` bigint(10) DEFAULT NULL,
  `loggeduser` bigint(10) DEFAULT NULL,
  `courseid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `scale` longtext NOT NULL,
  `description` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='History table';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_scorm`
--

CREATE TABLE IF NOT EXISTS `mdl_scorm` (
`id` bigint(10) NOT NULL,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `scormtype` varchar(50) NOT NULL DEFAULT 'local',
  `reference` varchar(255) NOT NULL DEFAULT '',
  `intro` longtext NOT NULL,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `version` varchar(9) NOT NULL DEFAULT '',
  `maxgrade` double NOT NULL DEFAULT '0',
  `grademethod` tinyint(2) NOT NULL DEFAULT '0',
  `whatgrade` bigint(10) NOT NULL DEFAULT '0',
  `maxattempt` bigint(10) NOT NULL DEFAULT '1',
  `forcecompleted` tinyint(1) NOT NULL DEFAULT '1',
  `forcenewattempt` tinyint(1) NOT NULL DEFAULT '0',
  `lastattemptlock` tinyint(1) NOT NULL DEFAULT '0',
  `displayattemptstatus` tinyint(1) NOT NULL DEFAULT '1',
  `displaycoursestructure` tinyint(1) NOT NULL DEFAULT '1',
  `updatefreq` tinyint(1) NOT NULL DEFAULT '0',
  `sha1hash` varchar(40) DEFAULT NULL,
  `md5hash` varchar(32) NOT NULL DEFAULT '',
  `revision` bigint(10) NOT NULL DEFAULT '0',
  `launch` bigint(10) NOT NULL DEFAULT '0',
  `skipview` tinyint(1) NOT NULL DEFAULT '1',
  `hidebrowse` tinyint(1) NOT NULL DEFAULT '0',
  `hidetoc` tinyint(1) NOT NULL DEFAULT '0',
  `nav` tinyint(1) NOT NULL DEFAULT '1',
  `navpositionleft` bigint(10) DEFAULT '-100',
  `navpositiontop` bigint(10) DEFAULT '-100',
  `auto` tinyint(1) NOT NULL DEFAULT '0',
  `popup` tinyint(1) NOT NULL DEFAULT '0',
  `options` varchar(255) NOT NULL DEFAULT '',
  `width` bigint(10) NOT NULL DEFAULT '100',
  `height` bigint(10) NOT NULL DEFAULT '600',
  `timeopen` bigint(10) NOT NULL DEFAULT '0',
  `timeclose` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `completionstatusrequired` tinyint(1) DEFAULT NULL,
  `completionscorerequired` tinyint(2) DEFAULT NULL,
  `displayactivityname` smallint(4) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='each table is one SCORM module and its configuration';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_scorm_aicc_session`
--

CREATE TABLE IF NOT EXISTS `mdl_scorm_aicc_session` (
`id` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `scormid` bigint(10) NOT NULL DEFAULT '0',
  `hacpsession` varchar(255) NOT NULL DEFAULT '',
  `scoid` bigint(10) DEFAULT '0',
  `scormmode` varchar(50) DEFAULT NULL,
  `scormstatus` varchar(255) DEFAULT NULL,
  `attempt` bigint(10) DEFAULT NULL,
  `lessonstatus` varchar(255) DEFAULT NULL,
  `sessiontime` varchar(255) DEFAULT NULL,
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Used by AICC HACP to store session information';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_scorm_scoes`
--

CREATE TABLE IF NOT EXISTS `mdl_scorm_scoes` (
`id` bigint(10) NOT NULL,
  `scorm` bigint(10) NOT NULL DEFAULT '0',
  `manifest` varchar(255) NOT NULL DEFAULT '',
  `organization` varchar(255) NOT NULL DEFAULT '',
  `parent` varchar(255) NOT NULL DEFAULT '',
  `identifier` varchar(255) NOT NULL DEFAULT '',
  `launch` longtext NOT NULL,
  `scormtype` varchar(5) NOT NULL DEFAULT '',
  `title` varchar(255) NOT NULL DEFAULT '',
  `sortorder` bigint(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='each SCO part of the SCORM module';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_scorm_scoes_data`
--

CREATE TABLE IF NOT EXISTS `mdl_scorm_scoes_data` (
`id` bigint(10) NOT NULL,
  `scoid` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `value` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Contains variable data get from packages';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_scorm_scoes_track`
--

CREATE TABLE IF NOT EXISTS `mdl_scorm_scoes_track` (
`id` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `scormid` bigint(10) NOT NULL DEFAULT '0',
  `scoid` bigint(10) NOT NULL DEFAULT '0',
  `attempt` bigint(10) NOT NULL DEFAULT '1',
  `element` varchar(255) NOT NULL DEFAULT '',
  `value` longtext NOT NULL,
  `timemodified` bigint(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='to track SCOes';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_scorm_seq_mapinfo`
--

CREATE TABLE IF NOT EXISTS `mdl_scorm_seq_mapinfo` (
`id` bigint(10) NOT NULL,
  `scoid` bigint(10) NOT NULL DEFAULT '0',
  `objectiveid` bigint(10) NOT NULL DEFAULT '0',
  `targetobjectiveid` bigint(10) NOT NULL DEFAULT '0',
  `readsatisfiedstatus` tinyint(1) NOT NULL DEFAULT '1',
  `readnormalizedmeasure` tinyint(1) NOT NULL DEFAULT '1',
  `writesatisfiedstatus` tinyint(1) NOT NULL DEFAULT '0',
  `writenormalizedmeasure` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='SCORM2004 objective mapinfo description';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_scorm_seq_objective`
--

CREATE TABLE IF NOT EXISTS `mdl_scorm_seq_objective` (
`id` bigint(10) NOT NULL,
  `scoid` bigint(10) NOT NULL DEFAULT '0',
  `primaryobj` tinyint(1) NOT NULL DEFAULT '0',
  `objectiveid` varchar(255) NOT NULL DEFAULT '',
  `satisfiedbymeasure` tinyint(1) NOT NULL DEFAULT '1',
  `minnormalizedmeasure` float(11,4) NOT NULL DEFAULT '0.0000'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='SCORM2004 objective description';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_scorm_seq_rolluprule`
--

CREATE TABLE IF NOT EXISTS `mdl_scorm_seq_rolluprule` (
`id` bigint(10) NOT NULL,
  `scoid` bigint(10) NOT NULL DEFAULT '0',
  `childactivityset` varchar(15) NOT NULL DEFAULT '',
  `minimumcount` bigint(10) NOT NULL DEFAULT '0',
  `minimumpercent` float(11,4) NOT NULL DEFAULT '0.0000',
  `conditioncombination` varchar(3) NOT NULL DEFAULT 'all',
  `action` varchar(15) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='SCORM2004 sequencing rule';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_scorm_seq_rolluprulecond`
--

CREATE TABLE IF NOT EXISTS `mdl_scorm_seq_rolluprulecond` (
`id` bigint(10) NOT NULL,
  `scoid` bigint(10) NOT NULL DEFAULT '0',
  `rollupruleid` bigint(10) NOT NULL DEFAULT '0',
  `operator` varchar(5) NOT NULL DEFAULT 'noOp',
  `cond` varchar(25) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='SCORM2004 sequencing rule';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_scorm_seq_rulecond`
--

CREATE TABLE IF NOT EXISTS `mdl_scorm_seq_rulecond` (
`id` bigint(10) NOT NULL,
  `scoid` bigint(10) NOT NULL DEFAULT '0',
  `ruleconditionsid` bigint(10) NOT NULL DEFAULT '0',
  `refrencedobjective` varchar(255) NOT NULL DEFAULT '',
  `measurethreshold` float(11,4) NOT NULL DEFAULT '0.0000',
  `operator` varchar(5) NOT NULL DEFAULT 'noOp',
  `cond` varchar(30) NOT NULL DEFAULT 'always'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='SCORM2004 rule condition';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_scorm_seq_ruleconds`
--

CREATE TABLE IF NOT EXISTS `mdl_scorm_seq_ruleconds` (
`id` bigint(10) NOT NULL,
  `scoid` bigint(10) NOT NULL DEFAULT '0',
  `conditioncombination` varchar(3) NOT NULL DEFAULT 'all',
  `ruletype` tinyint(2) NOT NULL DEFAULT '0',
  `action` varchar(25) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='SCORM2004 rule conditions';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_sessions`
--

CREATE TABLE IF NOT EXISTS `mdl_sessions` (
`id` bigint(10) NOT NULL,
  `state` bigint(10) NOT NULL DEFAULT '0',
  `sid` varchar(128) NOT NULL DEFAULT '',
  `userid` bigint(10) NOT NULL,
  `sessdata` longtext,
  `timecreated` bigint(10) NOT NULL,
  `timemodified` bigint(10) NOT NULL,
  `firstip` varchar(45) DEFAULT NULL,
  `lastip` varchar(45) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=151 DEFAULT CHARSET=utf8 COMMENT='Database based session storage - now recommended';

--
-- Dumping data for table `mdl_sessions`
--

INSERT INTO `mdl_sessions` (`id`, `state`, `sid`, `userid`, `sessdata`, `timecreated`, `timemodified`, `firstip`, `lastip`) VALUES
(77, 0, '15nj4l806bj1o7bbt1uamm7ft0', 2, NULL, 1417663658, 1417667739, '201.195.217.90', '201.195.217.90'),
(80, 0, '40m6o0r8bqc5fjd95o1c3nu233', 0, NULL, 1417872441, 1417872442, '201.195.209.206', '201.195.209.206'),
(82, 0, '2von778i795lt41ev0rhp4h792', 2, NULL, 1418101546, 1418102365, '201.195.217.90', '201.195.217.90'),
(85, 0, '5oh69e3pffu8pisp1r2igrudk0', 0, NULL, 1418136084, 1418136085, '201.191.199.122', '201.191.199.122'),
(89, 0, '3d85ggsjop8dlnrlmbmhc3gdb1', 4, NULL, 1418138563, 1418139082, '186.177.163.99', '186.177.163.99'),
(90, 0, 'tg2q81ktsmqp2o1j0ohb2v3052', 0, NULL, 1418139127, 1418139128, '186.177.163.99', '186.177.163.99'),
(92, 0, 'dne5rp8hinjvkvqeeb825vgti0', 2, NULL, 1418178340, 1418179031, '201.195.209.206', '201.195.209.206'),
(94, 0, 'uc3h7gms1bjsnh2kj5se80u410', 4, NULL, 1418178571, 1418178770, '201.195.209.206', '201.195.209.206'),
(123, 0, 'to5k2obic5ptut5gn863jnjqd6', 0, NULL, 1418231634, 1418231641, '163.178.208.16', '163.178.208.16'),
(134, 0, 'pb1c4dhk6sfq73f6hru0p1sch6', 0, NULL, 1418234237, 1418234238, '163.178.208.16', '163.178.208.16'),
(135, 0, '0dana537he83fs6hilbe5l9ve5', 0, NULL, 1418417031, 1418417031, '201.195.209.206', '201.195.209.206'),
(139, 0, '79oba4kmcglpkrbu173qck9fs3', 2, NULL, 1419009928, 1419011038, '201.195.209.206', '201.195.209.206'),
(142, 0, 'ajst8hejkst2fhmn0p9p8pee05', 0, NULL, 1419011747, 1419011748, '201.195.209.206', '201.195.209.206'),
(144, 0, '11skjo601g6pnq44b2dcuebo12', 2, NULL, 1419698194, 1419704602, '201.195.217.90', '201.195.217.90'),
(145, 0, 'kd3kbu7f1unfmigahlkfp7n936', 0, NULL, 1420253760, 1420253761, '201.195.217.90', '201.195.217.90'),
(146, 0, '1r7suodt3k3gq704ibpgjjht42', 0, NULL, 1420253773, 1420253773, '66.220.152.119', '66.220.152.119'),
(147, 0, 'jrenh3mteeo0f4i1m8e6td6rn5', 0, NULL, 1420253989, 1420253989, '201.198.20.165', '201.198.20.165'),
(148, 0, 'lsjgo6t5httvnhm0gmcpu18mr0', 0, NULL, 1420654508, 1420654510, '186.177.163.99', '186.177.163.99'),
(150, 0, '17opjqgm2anmo6ncmr40p9v215', 2, NULL, 1420730790, 1420730791, '201.195.209.206', '201.195.209.206');

-- --------------------------------------------------------

--
-- Table structure for table `mdl_stats_daily`
--

CREATE TABLE IF NOT EXISTS `mdl_stats_daily` (
`id` bigint(10) NOT NULL,
  `courseid` bigint(10) NOT NULL DEFAULT '0',
  `timeend` bigint(10) NOT NULL DEFAULT '0',
  `roleid` bigint(10) NOT NULL DEFAULT '0',
  `stattype` varchar(20) NOT NULL DEFAULT 'activity',
  `stat1` bigint(10) NOT NULL DEFAULT '0',
  `stat2` bigint(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='to accumulate daily stats';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_stats_monthly`
--

CREATE TABLE IF NOT EXISTS `mdl_stats_monthly` (
`id` bigint(10) NOT NULL,
  `courseid` bigint(10) NOT NULL DEFAULT '0',
  `timeend` bigint(10) NOT NULL DEFAULT '0',
  `roleid` bigint(10) NOT NULL DEFAULT '0',
  `stattype` varchar(20) NOT NULL DEFAULT 'activity',
  `stat1` bigint(10) NOT NULL DEFAULT '0',
  `stat2` bigint(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='To accumulate monthly stats';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_stats_user_daily`
--

CREATE TABLE IF NOT EXISTS `mdl_stats_user_daily` (
`id` bigint(10) NOT NULL,
  `courseid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `roleid` bigint(10) NOT NULL DEFAULT '0',
  `timeend` bigint(10) NOT NULL DEFAULT '0',
  `statsreads` bigint(10) NOT NULL DEFAULT '0',
  `statswrites` bigint(10) NOT NULL DEFAULT '0',
  `stattype` varchar(30) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='To accumulate daily stats per course/user';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_stats_user_monthly`
--

CREATE TABLE IF NOT EXISTS `mdl_stats_user_monthly` (
`id` bigint(10) NOT NULL,
  `courseid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `roleid` bigint(10) NOT NULL DEFAULT '0',
  `timeend` bigint(10) NOT NULL DEFAULT '0',
  `statsreads` bigint(10) NOT NULL DEFAULT '0',
  `statswrites` bigint(10) NOT NULL DEFAULT '0',
  `stattype` varchar(30) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='To accumulate monthly stats per course/user';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_stats_user_weekly`
--

CREATE TABLE IF NOT EXISTS `mdl_stats_user_weekly` (
`id` bigint(10) NOT NULL,
  `courseid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `roleid` bigint(10) NOT NULL DEFAULT '0',
  `timeend` bigint(10) NOT NULL DEFAULT '0',
  `statsreads` bigint(10) NOT NULL DEFAULT '0',
  `statswrites` bigint(10) NOT NULL DEFAULT '0',
  `stattype` varchar(30) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='To accumulate weekly stats per course/user';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_stats_weekly`
--

CREATE TABLE IF NOT EXISTS `mdl_stats_weekly` (
`id` bigint(10) NOT NULL,
  `courseid` bigint(10) NOT NULL DEFAULT '0',
  `timeend` bigint(10) NOT NULL DEFAULT '0',
  `roleid` bigint(10) NOT NULL DEFAULT '0',
  `stattype` varchar(20) NOT NULL DEFAULT 'activity',
  `stat1` bigint(10) NOT NULL DEFAULT '0',
  `stat2` bigint(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='To accumulate weekly stats';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_survey`
--

CREATE TABLE IF NOT EXISTS `mdl_survey` (
`id` bigint(10) NOT NULL,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `template` bigint(10) NOT NULL DEFAULT '0',
  `days` mediumint(6) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `intro` longtext NOT NULL,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `questions` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='Each record is one SURVEY module with its configuration';

--
-- Dumping data for table `mdl_survey`
--

INSERT INTO `mdl_survey` (`id`, `course`, `template`, `days`, `timecreated`, `timemodified`, `name`, `intro`, `introformat`, `questions`) VALUES
(1, 0, 0, 0, 985017600, 985017600, 'collesaname', 'collesaintro', 0, '25,26,27,28,29,30,43,44'),
(2, 0, 0, 0, 985017600, 985017600, 'collespname', 'collespintro', 0, '31,32,33,34,35,36,43,44'),
(3, 0, 0, 0, 985017600, 985017600, 'collesapname', 'collesapintro', 0, '37,38,39,40,41,42,43,44'),
(4, 0, 0, 0, 985017600, 985017600, 'attlsname', 'attlsintro', 0, '65,67,68'),
(5, 0, 0, 0, 985017600, 985017600, 'ciqname', 'ciqintro', 0, '69,70,71,72,73');

-- --------------------------------------------------------

--
-- Table structure for table `mdl_survey_analysis`
--

CREATE TABLE IF NOT EXISTS `mdl_survey_analysis` (
`id` bigint(10) NOT NULL,
  `survey` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `notes` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='text about each survey submission';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_survey_answers`
--

CREATE TABLE IF NOT EXISTS `mdl_survey_answers` (
`id` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `survey` bigint(10) NOT NULL DEFAULT '0',
  `question` bigint(10) NOT NULL DEFAULT '0',
  `time` bigint(10) NOT NULL DEFAULT '0',
  `answer1` longtext NOT NULL,
  `answer2` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='the answers to each questions filled by the users';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_survey_questions`
--

CREATE TABLE IF NOT EXISTS `mdl_survey_questions` (
`id` bigint(10) NOT NULL,
  `text` varchar(255) NOT NULL DEFAULT '',
  `shorttext` varchar(30) NOT NULL DEFAULT '',
  `multi` varchar(100) NOT NULL DEFAULT '',
  `intro` varchar(50) NOT NULL DEFAULT '',
  `type` smallint(3) NOT NULL DEFAULT '0',
  `options` longtext
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=utf8 COMMENT='the questions conforming one survey';

--
-- Dumping data for table `mdl_survey_questions`
--

INSERT INTO `mdl_survey_questions` (`id`, `text`, `shorttext`, `multi`, `intro`, `type`, `options`) VALUES
(1, 'colles1', 'colles1short', '', '', 1, 'scaletimes5'),
(2, 'colles2', 'colles2short', '', '', 1, 'scaletimes5'),
(3, 'colles3', 'colles3short', '', '', 1, 'scaletimes5'),
(4, 'colles4', 'colles4short', '', '', 1, 'scaletimes5'),
(5, 'colles5', 'colles5short', '', '', 1, 'scaletimes5'),
(6, 'colles6', 'colles6short', '', '', 1, 'scaletimes5'),
(7, 'colles7', 'colles7short', '', '', 1, 'scaletimes5'),
(8, 'colles8', 'colles8short', '', '', 1, 'scaletimes5'),
(9, 'colles9', 'colles9short', '', '', 1, 'scaletimes5'),
(10, 'colles10', 'colles10short', '', '', 1, 'scaletimes5'),
(11, 'colles11', 'colles11short', '', '', 1, 'scaletimes5'),
(12, 'colles12', 'colles12short', '', '', 1, 'scaletimes5'),
(13, 'colles13', 'colles13short', '', '', 1, 'scaletimes5'),
(14, 'colles14', 'colles14short', '', '', 1, 'scaletimes5'),
(15, 'colles15', 'colles15short', '', '', 1, 'scaletimes5'),
(16, 'colles16', 'colles16short', '', '', 1, 'scaletimes5'),
(17, 'colles17', 'colles17short', '', '', 1, 'scaletimes5'),
(18, 'colles18', 'colles18short', '', '', 1, 'scaletimes5'),
(19, 'colles19', 'colles19short', '', '', 1, 'scaletimes5'),
(20, 'colles20', 'colles20short', '', '', 1, 'scaletimes5'),
(21, 'colles21', 'colles21short', '', '', 1, 'scaletimes5'),
(22, 'colles22', 'colles22short', '', '', 1, 'scaletimes5'),
(23, 'colles23', 'colles23short', '', '', 1, 'scaletimes5'),
(24, 'colles24', 'colles24short', '', '', 1, 'scaletimes5'),
(25, 'collesm1', 'collesm1short', '1,2,3,4', 'collesmintro', 1, 'scaletimes5'),
(26, 'collesm2', 'collesm2short', '5,6,7,8', 'collesmintro', 1, 'scaletimes5'),
(27, 'collesm3', 'collesm3short', '9,10,11,12', 'collesmintro', 1, 'scaletimes5'),
(28, 'collesm4', 'collesm4short', '13,14,15,16', 'collesmintro', 1, 'scaletimes5'),
(29, 'collesm5', 'collesm5short', '17,18,19,20', 'collesmintro', 1, 'scaletimes5'),
(30, 'collesm6', 'collesm6short', '21,22,23,24', 'collesmintro', 1, 'scaletimes5'),
(31, 'collesm1', 'collesm1short', '1,2,3,4', 'collesmintro', 2, 'scaletimes5'),
(32, 'collesm2', 'collesm2short', '5,6,7,8', 'collesmintro', 2, 'scaletimes5'),
(33, 'collesm3', 'collesm3short', '9,10,11,12', 'collesmintro', 2, 'scaletimes5'),
(34, 'collesm4', 'collesm4short', '13,14,15,16', 'collesmintro', 2, 'scaletimes5'),
(35, 'collesm5', 'collesm5short', '17,18,19,20', 'collesmintro', 2, 'scaletimes5'),
(36, 'collesm6', 'collesm6short', '21,22,23,24', 'collesmintro', 2, 'scaletimes5'),
(37, 'collesm1', 'collesm1short', '1,2,3,4', 'collesmintro', 3, 'scaletimes5'),
(38, 'collesm2', 'collesm2short', '5,6,7,8', 'collesmintro', 3, 'scaletimes5'),
(39, 'collesm3', 'collesm3short', '9,10,11,12', 'collesmintro', 3, 'scaletimes5'),
(40, 'collesm4', 'collesm4short', '13,14,15,16', 'collesmintro', 3, 'scaletimes5'),
(41, 'collesm5', 'collesm5short', '17,18,19,20', 'collesmintro', 3, 'scaletimes5'),
(42, 'collesm6', 'collesm6short', '21,22,23,24', 'collesmintro', 3, 'scaletimes5'),
(43, 'howlong', '', '', '', 1, 'howlongoptions'),
(44, 'othercomments', '', '', '', 0, NULL),
(45, 'attls1', 'attls1short', '', '', 1, 'scaleagree5'),
(46, 'attls2', 'attls2short', '', '', 1, 'scaleagree5'),
(47, 'attls3', 'attls3short', '', '', 1, 'scaleagree5'),
(48, 'attls4', 'attls4short', '', '', 1, 'scaleagree5'),
(49, 'attls5', 'attls5short', '', '', 1, 'scaleagree5'),
(50, 'attls6', 'attls6short', '', '', 1, 'scaleagree5'),
(51, 'attls7', 'attls7short', '', '', 1, 'scaleagree5'),
(52, 'attls8', 'attls8short', '', '', 1, 'scaleagree5'),
(53, 'attls9', 'attls9short', '', '', 1, 'scaleagree5'),
(54, 'attls10', 'attls10short', '', '', 1, 'scaleagree5'),
(55, 'attls11', 'attls11short', '', '', 1, 'scaleagree5'),
(56, 'attls12', 'attls12short', '', '', 1, 'scaleagree5'),
(57, 'attls13', 'attls13short', '', '', 1, 'scaleagree5'),
(58, 'attls14', 'attls14short', '', '', 1, 'scaleagree5'),
(59, 'attls15', 'attls15short', '', '', 1, 'scaleagree5'),
(60, 'attls16', 'attls16short', '', '', 1, 'scaleagree5'),
(61, 'attls17', 'attls17short', '', '', 1, 'scaleagree5'),
(62, 'attls18', 'attls18short', '', '', 1, 'scaleagree5'),
(63, 'attls19', 'attls19short', '', '', 1, 'scaleagree5'),
(64, 'attls20', 'attls20short', '', '', 1, 'scaleagree5'),
(65, 'attlsm1', 'attlsm1', '45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64', 'attlsmintro', 1, 'scaleagree5'),
(66, '-', '-', '-', '-', 0, '-'),
(67, 'attlsm2', 'attlsm2', '63,62,59,57,55,49,52,50,48,47', 'attlsmintro', -1, 'scaleagree5'),
(68, 'attlsm3', 'attlsm3', '46,54,45,51,60,53,56,58,61,64', 'attlsmintro', -1, 'scaleagree5'),
(69, 'ciq1', 'ciq1short', '', '', 0, NULL),
(70, 'ciq2', 'ciq2short', '', '', 0, NULL),
(71, 'ciq3', 'ciq3short', '', '', 0, NULL),
(72, 'ciq4', 'ciq4short', '', '', 0, NULL),
(73, 'ciq5', 'ciq5short', '', '', 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_tag`
--

CREATE TABLE IF NOT EXISTS `mdl_tag` (
`id` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `rawname` varchar(255) NOT NULL DEFAULT '',
  `tagtype` varchar(255) DEFAULT NULL,
  `description` longtext,
  `descriptionformat` tinyint(2) NOT NULL DEFAULT '0',
  `flag` smallint(4) DEFAULT '0',
  `timemodified` bigint(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tag table - this generic table will replace the old "tags" t';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_tag_correlation`
--

CREATE TABLE IF NOT EXISTS `mdl_tag_correlation` (
`id` bigint(10) NOT NULL,
  `tagid` bigint(10) NOT NULL,
  `correlatedtags` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='The rationale for the ''tag_correlation'' table is performance';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_tag_instance`
--

CREATE TABLE IF NOT EXISTS `mdl_tag_instance` (
`id` bigint(10) NOT NULL,
  `tagid` bigint(10) NOT NULL,
  `component` varchar(100) DEFAULT NULL,
  `itemtype` varchar(255) NOT NULL DEFAULT '',
  `itemid` bigint(10) NOT NULL,
  `contextid` bigint(10) DEFAULT NULL,
  `tiuserid` bigint(10) NOT NULL DEFAULT '0',
  `ordering` bigint(10) DEFAULT NULL,
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='tag_instance table holds the information of associations bet';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_task_adhoc`
--

CREATE TABLE IF NOT EXISTS `mdl_task_adhoc` (
`id` bigint(10) NOT NULL,
  `component` varchar(255) NOT NULL DEFAULT '',
  `classname` varchar(255) NOT NULL DEFAULT '',
  `nextruntime` bigint(10) NOT NULL,
  `faildelay` bigint(10) DEFAULT NULL,
  `customdata` longtext,
  `blocking` tinyint(2) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='List of adhoc tasks waiting to run.';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_task_scheduled`
--

CREATE TABLE IF NOT EXISTS `mdl_task_scheduled` (
`id` bigint(10) NOT NULL,
  `component` varchar(255) NOT NULL DEFAULT '',
  `classname` varchar(255) NOT NULL DEFAULT '',
  `lastruntime` bigint(10) DEFAULT NULL,
  `nextruntime` bigint(10) DEFAULT NULL,
  `blocking` tinyint(2) NOT NULL DEFAULT '0',
  `minute` varchar(25) NOT NULL DEFAULT '',
  `hour` varchar(25) NOT NULL DEFAULT '',
  `day` varchar(25) NOT NULL DEFAULT '',
  `month` varchar(25) NOT NULL DEFAULT '',
  `dayofweek` varchar(25) NOT NULL DEFAULT '',
  `faildelay` bigint(10) DEFAULT NULL,
  `customised` tinyint(2) NOT NULL DEFAULT '0',
  `disabled` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8 COMMENT='List of scheduled tasks to be run by cron.';

--
-- Dumping data for table `mdl_task_scheduled`
--

INSERT INTO `mdl_task_scheduled` (`id`, `component`, `classname`, `lastruntime`, `nextruntime`, `blocking`, `minute`, `hour`, `day`, `month`, `dayofweek`, `faildelay`, `customised`, `disabled`) VALUES
(1, 'moodle', '\\core\\task\\session_cleanup_task', 1415196025, 1415196060, 0, '*', '*', '*', '*', '*', 0, 0, 0),
(2, 'moodle', '\\core\\task\\delete_unconfirmed_users_task', 1415196025, 1415199600, 0, '0', '*', '*', '*', '*', 0, 0, 0),
(3, 'moodle', '\\core\\task\\delete_incomplete_users_task', 1415196025, 1415196300, 0, '5', '*', '*', '*', '*', 0, 0, 0),
(4, 'moodle', '\\core\\task\\backup_cleanup_task', 1415196025, 1415196600, 0, '10', '*', '*', '*', '*', 0, 0, 0),
(5, 'moodle', '\\core\\task\\tag_cron_task', 1415196025, 1415197200, 0, '20', '*', '*', '*', '*', 0, 0, 0),
(6, 'moodle', '\\core\\task\\context_cleanup_task', 1415196025, 1415197500, 0, '25', '*', '*', '*', '*', 0, 0, 0),
(7, 'moodle', '\\core\\task\\cache_cleanup_task', 1415196025, 1415197800, 0, '30', '*', '*', '*', '*', 0, 0, 0),
(8, 'moodle', '\\core\\task\\messaging_cleanup_task', 1415196025, 1415198100, 0, '35', '*', '*', '*', '*', 0, 0, 0),
(9, 'moodle', '\\core\\task\\send_new_user_passwords_task', 1415196025, 1415196060, 0, '*', '*', '*', '*', '*', 0, 0, 0),
(10, 'moodle', '\\core\\task\\send_failed_login_notifications_task', 1415196025, 1415196060, 0, '*', '*', '*', '*', '*', 0, 0, 0),
(11, 'moodle', '\\core\\task\\create_contexts_task', 1415196025, 1415196060, 1, '*', '*', '*', '*', '*', 0, 0, 0),
(12, 'moodle', '\\core\\task\\legacy_plugin_cron_task', 1415196028, 1415196060, 0, '*', '*', '*', '*', '*', 0, 0, 0),
(13, 'moodle', '\\core\\task\\grade_cron_task', 1415196028, 1415196060, 0, '*', '*', '*', '*', '*', 0, 0, 0),
(14, 'moodle', '\\core\\task\\events_cron_task', 1415196028, 1415196060, 0, '*', '*', '*', '*', '*', 0, 0, 0),
(15, 'moodle', '\\core\\task\\completion_cron_task', 1415196028, 1415196060, 0, '*', '*', '*', '*', '*', 0, 0, 0),
(16, 'moodle', '\\core\\task\\portfolio_cron_task', 1415196028, 1415196060, 0, '*', '*', '*', '*', '*', 0, 0, 0),
(17, 'moodle', '\\core\\task\\plagiarism_cron_task', 1415196028, 1415196060, 0, '*', '*', '*', '*', '*', 0, 0, 0),
(18, 'moodle', '\\core\\task\\calendar_cron_task', 1415196028, 1415196060, 0, '*', '*', '*', '*', '*', 0, 0, 0),
(19, 'moodle', '\\core\\task\\blog_cron_task', 1415196028, 1415196060, 0, '*', '*', '*', '*', '*', 0, 0, 0),
(20, 'moodle', '\\core\\task\\question_cron_task', 1415196028, 1415196060, 0, '*', '*', '*', '*', '*', 0, 0, 0),
(21, 'moodle', '\\core\\task\\registration_cron_task', 1415196028, 1415268000, 0, '0', '3', '*', '*', '*', 0, 0, 0),
(22, 'moodle', '\\core\\task\\check_for_updates_task', 1415196029, 1415199600, 0, '0', '*/2', '*', '*', '*', 0, 0, 0),
(23, 'moodle', '\\core\\task\\cache_cron_task', 1415196029, 1415199000, 0, '50', '*', '*', '*', '*', 0, 0, 0),
(24, 'moodle', '\\core\\task\\automated_backup_task', 1415196030, 1415199000, 0, '50', '*', '*', '*', '*', 0, 0, 0),
(25, 'moodle', '\\core\\task\\badges_cron_task', 1415196030, 1415196300, 0, '*/5', '*', '*', '*', '*', 0, 0, 0),
(26, 'moodle', '\\core\\task\\file_temp_cleanup_task', 1415196030, 1415217300, 0, '55', '*/6', '*', '*', '*', 0, 0, 0),
(27, 'moodle', '\\core\\task\\file_trash_cleanup_task', 1415196030, 1415217300, 0, '55', '*/6', '*', '*', '*', 0, 0, 0),
(28, 'moodle', '\\core\\task\\stats_cron_task', 1415196030, 1415199600, 0, '0', '*', '*', '*', '*', 0, 0, 0),
(29, 'moodle', '\\core\\task\\password_reset_cleanup_task', 1415196030, 1415214000, 0, '0', '*/6', '*', '*', '*', 0, 0, 0),
(30, 'mod_forum', '\\mod_forum\\task\\cron_task', 1415196030, 1415196060, 0, '*', '*', '*', '*', '*', 0, 0, 0),
(31, 'logstore_legacy', '\\logstore_legacy\\task\\cleanup_task', 1415196030, 1415275260, 0, '*', '5', '*', '*', '*', 0, 0, 0),
(32, 'logstore_standard', '\\logstore_standard\\task\\cleanup_task', 1415196030, 1415271660, 0, '*', '4', '*', '*', '*', 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_timezone`
--

CREATE TABLE IF NOT EXISTS `mdl_timezone` (
`id` bigint(10) NOT NULL,
  `name` varchar(100) NOT NULL DEFAULT '',
  `year` bigint(11) NOT NULL DEFAULT '0',
  `tzrule` varchar(20) NOT NULL DEFAULT '',
  `gmtoff` bigint(11) NOT NULL DEFAULT '0',
  `dstoff` bigint(11) NOT NULL DEFAULT '0',
  `dst_month` tinyint(2) NOT NULL DEFAULT '0',
  `dst_startday` smallint(3) NOT NULL DEFAULT '0',
  `dst_weekday` smallint(3) NOT NULL DEFAULT '0',
  `dst_skipweeks` smallint(3) NOT NULL DEFAULT '0',
  `dst_time` varchar(6) NOT NULL DEFAULT '00:00',
  `std_month` tinyint(2) NOT NULL DEFAULT '0',
  `std_startday` smallint(3) NOT NULL DEFAULT '0',
  `std_weekday` smallint(3) NOT NULL DEFAULT '0',
  `std_skipweeks` smallint(3) NOT NULL DEFAULT '0',
  `std_time` varchar(6) NOT NULL DEFAULT '00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Rules for calculating local wall clock time for users';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_tool_customlang`
--

CREATE TABLE IF NOT EXISTS `mdl_tool_customlang` (
`id` bigint(10) NOT NULL,
  `lang` varchar(20) NOT NULL DEFAULT '',
  `componentid` bigint(10) NOT NULL,
  `stringid` varchar(255) NOT NULL DEFAULT '',
  `original` longtext NOT NULL,
  `master` longtext,
  `local` longtext,
  `timemodified` bigint(10) NOT NULL,
  `timecustomized` bigint(10) DEFAULT NULL,
  `outdated` smallint(3) DEFAULT '0',
  `modified` smallint(3) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Contains the working checkout of all strings and their custo';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_tool_customlang_components`
--

CREATE TABLE IF NOT EXISTS `mdl_tool_customlang_components` (
`id` bigint(10) NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `version` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Contains the list of all installed plugins that provide thei';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_upgrade_log`
--

CREATE TABLE IF NOT EXISTS `mdl_upgrade_log` (
`id` bigint(10) NOT NULL,
  `type` bigint(10) NOT NULL,
  `plugin` varchar(100) DEFAULT NULL,
  `version` varchar(100) DEFAULT NULL,
  `targetversion` varchar(100) DEFAULT NULL,
  `info` varchar(255) NOT NULL DEFAULT '',
  `details` longtext,
  `backtrace` longtext,
  `userid` bigint(10) NOT NULL,
  `timemodified` bigint(10) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=1047 DEFAULT CHARSET=utf8 COMMENT='Upgrade logging';

--
-- Dumping data for table `mdl_upgrade_log`
--

INSERT INTO `mdl_upgrade_log` (`id`, `type`, `plugin`, `version`, `targetversion`, `info`, `details`, `backtrace`, `userid`, `timemodified`) VALUES
(1, 0, 'core', '2014051202', '2014051202', 'Upgrade savepoint reached', NULL, '', 0, 1415060951),
(2, 0, 'core', '2014051202', '2014051202', 'Core installed', NULL, '', 0, 1415060962),
(3, 0, 'availability_completion', NULL, '2014051200', 'Starting plugin installation', NULL, '', 0, 1415060962),
(4, 0, 'availability_completion', '2014051200', '2014051200', 'Upgrade savepoint reached', NULL, '', 0, 1415060962),
(5, 0, 'availability_completion', '2014051200', '2014051200', 'Plugin installed', NULL, '', 0, 1415060962),
(6, 0, 'availability_date', NULL, '2014051200', 'Starting plugin installation', NULL, '', 0, 1415060962),
(7, 0, 'availability_date', '2014051200', '2014051200', 'Upgrade savepoint reached', NULL, '', 0, 1415060962),
(8, 0, 'availability_date', '2014051200', '2014051200', 'Plugin installed', NULL, '', 0, 1415060962),
(9, 0, 'availability_grade', NULL, '2014051200', 'Starting plugin installation', NULL, '', 0, 1415060962),
(10, 0, 'availability_grade', '2014051200', '2014051200', 'Upgrade savepoint reached', NULL, '', 0, 1415060962),
(11, 0, 'availability_grade', '2014051200', '2014051200', 'Plugin installed', NULL, '', 0, 1415060962),
(12, 0, 'availability_group', NULL, '2014051200', 'Starting plugin installation', NULL, '', 0, 1415060962),
(13, 0, 'availability_group', '2014051200', '2014051200', 'Upgrade savepoint reached', NULL, '', 0, 1415060962),
(14, 0, 'availability_group', '2014051200', '2014051200', 'Plugin installed', NULL, '', 0, 1415060962),
(15, 0, 'availability_grouping', NULL, '2014051200', 'Starting plugin installation', NULL, '', 0, 1415060962),
(16, 0, 'availability_grouping', '2014051200', '2014051200', 'Upgrade savepoint reached', NULL, '', 0, 1415060962),
(17, 0, 'availability_grouping', '2014051200', '2014051200', 'Plugin installed', NULL, '', 0, 1415060962),
(18, 0, 'availability_profile', NULL, '2014051200', 'Starting plugin installation', NULL, '', 0, 1415060962),
(19, 0, 'availability_profile', '2014051200', '2014051200', 'Upgrade savepoint reached', NULL, '', 0, 1415060962),
(20, 0, 'availability_profile', '2014051200', '2014051200', 'Plugin installed', NULL, '', 0, 1415060962),
(21, 0, 'qtype_calculated', NULL, '2014051200', 'Starting plugin installation', NULL, '', 0, 1415060962),
(22, 0, 'qtype_calculated', '2014051200', '2014051200', 'Upgrade savepoint reached', NULL, '', 0, 1415060963),
(23, 0, 'qtype_calculated', '2014051200', '2014051200', 'Plugin installed', NULL, '', 0, 1415060963),
(24, 0, 'qtype_calculatedmulti', NULL, '2014051200', 'Starting plugin installation', NULL, '', 0, 1415060963),
(25, 0, 'qtype_calculatedmulti', '2014051200', '2014051200', 'Upgrade savepoint reached', NULL, '', 0, 1415060963),
(26, 0, 'qtype_calculatedmulti', '2014051200', '2014051200', 'Plugin installed', NULL, '', 0, 1415060963),
(27, 0, 'qtype_calculatedsimple', NULL, '2014051200', 'Starting plugin installation', NULL, '', 0, 1415060963),
(28, 0, 'qtype_calculatedsimple', '2014051200', '2014051200', 'Upgrade savepoint reached', NULL, '', 0, 1415060963),
(29, 0, 'qtype_calculatedsimple', '2014051200', '2014051200', 'Plugin installed', NULL, '', 0, 1415060963),
(30, 0, 'qtype_description', NULL, '2014051200', 'Starting plugin installation', NULL, '', 0, 1415060963),
(31, 0, 'qtype_description', '2014051200', '2014051200', 'Upgrade savepoint reached', NULL, '', 0, 1415060963),
(32, 0, 'qtype_description', '2014051200', '2014051200', 'Plugin installed', NULL, '', 0, 1415060963),
(33, 0, 'qtype_essay', NULL, '2014051200', 'Starting plugin installation', NULL, '', 0, 1415060963),
(34, 0, 'qtype_essay', '2014051200', '2014051200', 'Upgrade savepoint reached', NULL, '', 0, 1415060964),
(35, 0, 'qtype_essay', '2014051200', '2014051200', 'Plugin installed', NULL, '', 0, 1415060964),
(36, 0, 'qtype_match', NULL, '2014051200', 'Starting plugin installation', NULL, '', 0, 1415060964),
(37, 0, 'qtype_match', '2014051200', '2014051200', 'Upgrade savepoint reached', NULL, '', 0, 1415060964),
(38, 0, 'qtype_match', '2014051200', '2014051200', 'Plugin installed', NULL, '', 0, 1415060964),
(39, 0, 'qtype_missingtype', NULL, '2014051200', 'Starting plugin installation', NULL, '', 0, 1415060964),
(40, 0, 'qtype_missingtype', '2014051200', '2014051200', 'Upgrade savepoint reached', NULL, '', 0, 1415060964),
(41, 0, 'qtype_missingtype', '2014051200', '2014051200', 'Plugin installed', NULL, '', 0, 1415060964),
(42, 0, 'qtype_multianswer', NULL, '2014051200', 'Starting plugin installation', NULL, '', 0, 1415060964),
(43, 0, 'qtype_multianswer', '2014051200', '2014051200', 'Upgrade savepoint reached', NULL, '', 0, 1415060964),
(44, 0, 'qtype_multianswer', '2014051200', '2014051200', 'Plugin installed', NULL, '', 0, 1415060964),
(45, 0, 'qtype_multichoice', NULL, '2014051200', 'Starting plugin installation', NULL, '', 0, 1415060964),
(46, 0, 'qtype_multichoice', '2014051200', '2014051200', 'Upgrade savepoint reached', NULL, '', 0, 1415060965),
(47, 0, 'qtype_multichoice', '2014051200', '2014051200', 'Plugin installed', NULL, '', 0, 1415060965),
(48, 0, 'qtype_numerical', NULL, '2014051200', 'Starting plugin installation', NULL, '', 0, 1415060965),
(49, 0, 'qtype_numerical', '2014051200', '2014051200', 'Upgrade savepoint reached', NULL, '', 0, 1415060965),
(50, 0, 'qtype_numerical', '2014051200', '2014051200', 'Plugin installed', NULL, '', 0, 1415060965),
(51, 0, 'qtype_random', NULL, '2014051201', 'Starting plugin installation', NULL, '', 0, 1415060965),
(52, 0, 'qtype_random', '2014051201', '2014051201', 'Upgrade savepoint reached', NULL, '', 0, 1415060965),
(53, 0, 'qtype_random', '2014051201', '2014051201', 'Plugin installed', NULL, '', 0, 1415060965),
(54, 0, 'qtype_randomsamatch', NULL, '2014051200', 'Starting plugin installation', NULL, '', 0, 1415060965),
(55, 0, 'qtype_randomsamatch', '2014051200', '2014051200', 'Upgrade savepoint reached', NULL, '', 0, 1415060966),
(56, 0, 'qtype_randomsamatch', '2014051200', '2014051200', 'Plugin installed', NULL, '', 0, 1415060966),
(57, 0, 'qtype_shortanswer', NULL, '2014051200', 'Starting plugin installation', NULL, '', 0, 1415060966),
(58, 0, 'qtype_shortanswer', '2014051200', '2014051200', 'Upgrade savepoint reached', NULL, '', 0, 1415060966),
(59, 0, 'qtype_shortanswer', '2014051200', '2014051200', 'Plugin installed', NULL, '', 0, 1415060966),
(60, 0, 'qtype_truefalse', NULL, '2014051200', 'Starting plugin installation', NULL, '', 0, 1415060966),
(61, 0, 'qtype_truefalse', '2014051200', '2014051200', 'Upgrade savepoint reached', NULL, '', 0, 1415060966),
(62, 0, 'qtype_truefalse', '2014051200', '2014051200', 'Plugin installed', NULL, '', 0, 1415060966),
(63, 0, 'mod_assign', NULL, '2014051201', 'Starting plugin installation', NULL, '', 0, 1415060966),
(64, 0, 'mod_assign', '2014051201', '2014051201', 'Upgrade savepoint reached', NULL, '', 0, 1415060967),
(65, 0, 'mod_assign', '2014051201', '2014051201', 'Plugin installed', NULL, '', 0, 1415060968),
(66, 0, 'mod_assignment', NULL, '2014051200', 'Starting plugin installation', NULL, '', 0, 1415060968),
(67, 0, 'mod_assignment', '2014051200', '2014051200', 'Upgrade savepoint reached', NULL, '', 0, 1415060969),
(68, 0, 'mod_assignment', '2014051200', '2014051200', 'Plugin installed', NULL, '', 0, 1415060969),
(69, 0, 'mod_book', NULL, '2014051200', 'Starting plugin installation', NULL, '', 0, 1415060969),
(70, 0, 'mod_book', '2014051200', '2014051200', 'Upgrade savepoint reached', NULL, '', 0, 1415060969),
(71, 0, 'mod_book', '2014051200', '2014051200', 'Plugin installed', NULL, '', 0, 1415060969),
(72, 0, 'mod_chat', NULL, '2014051200', 'Starting plugin installation', NULL, '', 0, 1415060969),
(73, 0, 'mod_chat', '2014051200', '2014051200', 'Upgrade savepoint reached', NULL, '', 0, 1415060970),
(74, 0, 'mod_chat', '2014051200', '2014051200', 'Plugin installed', NULL, '', 0, 1415060970),
(75, 0, 'mod_choice', NULL, '2014051200', 'Starting plugin installation', NULL, '', 0, 1415060970),
(76, 0, 'mod_choice', '2014051200', '2014051200', 'Upgrade savepoint reached', NULL, '', 0, 1415060971),
(77, 0, 'mod_choice', '2014051200', '2014051200', 'Plugin installed', NULL, '', 0, 1415060971),
(78, 0, 'mod_data', NULL, '2014051200', 'Starting plugin installation', NULL, '', 0, 1415060971),
(79, 0, 'mod_data', '2014051200', '2014051200', 'Upgrade savepoint reached', NULL, '', 0, 1415060972),
(80, 0, 'mod_data', '2014051200', '2014051200', 'Plugin installed', NULL, '', 0, 1415060973),
(81, 0, 'mod_feedback', NULL, '2014051200', 'Starting plugin installation', NULL, '', 0, 1415060973),
(82, 0, 'mod_feedback', '2014051200', '2014051200', 'Upgrade savepoint reached', NULL, '', 0, 1415060975),
(83, 0, 'mod_feedback', '2014051200', '2014051200', 'Plugin installed', NULL, '', 0, 1415060975),
(84, 0, 'mod_folder', NULL, '2014051200', 'Starting plugin installation', NULL, '', 0, 1415060975),
(85, 0, 'mod_folder', '2014051200', '2014051200', 'Upgrade savepoint reached', NULL, '', 0, 1415060976),
(86, 0, 'mod_folder', '2014051200', '2014051200', 'Plugin installed', NULL, '', 0, 1415060976),
(87, 0, 'mod_forum', NULL, '2014051202', 'Starting plugin installation', NULL, '', 0, 1415060976),
(88, 0, 'mod_forum', '2014051202', '2014051202', 'Upgrade savepoint reached', NULL, '', 0, 1415060977),
(89, 0, 'mod_forum', '2014051202', '2014051202', 'Plugin installed', NULL, '', 0, 1415060978),
(90, 0, 'mod_glossary', NULL, '2014051200', 'Starting plugin installation', NULL, '', 0, 1415060978),
(91, 0, 'mod_glossary', '2014051200', '2014051200', 'Upgrade savepoint reached', NULL, '', 0, 1415060979),
(92, 0, 'mod_glossary', '2014051200', '2014051200', 'Plugin installed', NULL, '', 0, 1415060980),
(93, 0, 'mod_imscp', NULL, '2014051200', 'Starting plugin installation', NULL, '', 0, 1415060980),
(94, 0, 'mod_imscp', '2014051200', '2014051200', 'Upgrade savepoint reached', NULL, '', 0, 1415060980),
(95, 0, 'mod_imscp', '2014051200', '2014051200', 'Plugin installed', NULL, '', 0, 1415060980),
(96, 0, 'mod_label', NULL, '2014051200', 'Starting plugin installation', NULL, '', 0, 1415060980),
(97, 0, 'mod_label', '2014051200', '2014051200', 'Upgrade savepoint reached', NULL, '', 0, 1415060981),
(98, 0, 'mod_label', '2014051200', '2014051200', 'Plugin installed', NULL, '', 0, 1415060981),
(99, 0, 'mod_lesson', NULL, '2014051200', 'Starting plugin installation', NULL, '', 0, 1415060981),
(100, 0, 'mod_lesson', '2014051200', '2014051200', 'Upgrade savepoint reached', NULL, '', 0, 1415060982),
(101, 0, 'mod_lesson', '2014051200', '2014051200', 'Plugin installed', NULL, '', 0, 1415060982),
(102, 0, 'mod_lti', NULL, '2014051200', 'Starting plugin installation', NULL, '', 0, 1415060982),
(103, 0, 'mod_lti', '2014051200', '2014051200', 'Upgrade savepoint reached', NULL, '', 0, 1415060983),
(104, 0, 'mod_lti', '2014051200', '2014051200', 'Plugin installed', NULL, '', 0, 1415060983),
(105, 0, 'mod_page', NULL, '2014051200', 'Starting plugin installation', NULL, '', 0, 1415060983),
(106, 0, 'mod_page', '2014051200', '2014051200', 'Upgrade savepoint reached', NULL, '', 0, 1415060984),
(107, 0, 'mod_page', '2014051200', '2014051200', 'Plugin installed', NULL, '', 0, 1415060984),
(108, 0, 'mod_quiz', NULL, '2014051200', 'Starting plugin installation', NULL, '', 0, 1415060984),
(109, 0, 'mod_quiz', '2014051200', '2014051200', 'Upgrade savepoint reached', NULL, '', 0, 1415060985),
(110, 0, 'mod_quiz', '2014051200', '2014051200', 'Plugin installed', NULL, '', 0, 1415060986),
(111, 0, 'mod_resource', NULL, '2014051200', 'Starting plugin installation', NULL, '', 0, 1415060986),
(112, 0, 'mod_resource', '2014051200', '2014051200', 'Upgrade savepoint reached', NULL, '', 0, 1415060986),
(113, 0, 'mod_resource', '2014051200', '2014051200', 'Plugin installed', NULL, '', 0, 1415060986),
(114, 0, 'mod_scorm', NULL, '2014051200', 'Starting plugin installation', NULL, '', 0, 1415060986),
(115, 0, 'mod_scorm', '2014051200', '2014051200', 'Upgrade savepoint reached', NULL, '', 0, 1415060988),
(116, 0, 'mod_scorm', '2014051200', '2014051200', 'Plugin installed', NULL, '', 0, 1415060989),
(117, 0, 'mod_survey', NULL, '2014051200', 'Starting plugin installation', NULL, '', 0, 1415060989),
(118, 0, 'mod_survey', '2014051200', '2014051200', 'Upgrade savepoint reached', NULL, '', 0, 1415060989),
(119, 0, 'mod_survey', '2014051200', '2014051200', 'Plugin installed', NULL, '', 0, 1415060990),
(120, 0, 'mod_url', NULL, '2014051200', 'Starting plugin installation', NULL, '', 0, 1415060990),
(121, 0, 'mod_url', '2014051200', '2014051200', 'Upgrade savepoint reached', NULL, '', 0, 1415060991),
(122, 0, 'mod_url', '2014051200', '2014051200', 'Plugin installed', NULL, '', 0, 1415060991),
(123, 0, 'mod_wiki', NULL, '2014051200', 'Starting plugin installation', NULL, '', 0, 1415060991),
(124, 0, 'mod_wiki', '2014051200', '2014051200', 'Upgrade savepoint reached', NULL, '', 0, 1415060992),
(125, 0, 'mod_wiki', '2014051200', '2014051200', 'Plugin installed', NULL, '', 0, 1415060992),
(126, 0, 'mod_workshop', NULL, '2014051200', 'Starting plugin installation', NULL, '', 0, 1415060992),
(127, 0, 'mod_workshop', '2014051200', '2014051200', 'Upgrade savepoint reached', NULL, '', 0, 1415060996),
(128, 0, 'mod_workshop', '2014051200', '2014051200', 'Plugin installed', NULL, '', 0, 1415060998),
(129, 0, 'auth_cas', NULL, '2014051200', 'Starting plugin installation', NULL, '', 0, 1415060999),
(130, 0, 'auth_cas', '2014051200', '2014051200', 'Upgrade savepoint reached', NULL, '', 0, 1415060999),
(131, 0, 'auth_cas', '2014051200', '2014051200', 'Plugin installed', NULL, '', 0, 1415060999),
(132, 0, 'auth_db', NULL, '2014051200', 'Starting plugin installation', NULL, '', 0, 1415060999),
(133, 0, 'auth_db', '2014051200', '2014051200', 'Upgrade savepoint reached', NULL, '', 0, 1415060999),
(134, 0, 'auth_db', '2014051200', '2014051200', 'Plugin installed', NULL, '', 0, 1415060999),
(135, 0, 'auth_email', NULL, '2014051200', 'Starting plugin installation', NULL, '', 0, 1415060999),
(136, 0, 'auth_email', '2014051200', '2014051200', 'Upgrade savepoint reached', NULL, '', 0, 1415060999),
(137, 0, 'auth_email', '2014051200', '2014051200', 'Plugin installed', NULL, '', 0, 1415060999),
(138, 0, 'auth_fc', NULL, '2014051200', 'Starting plugin installation', NULL, '', 0, 1415060999),
(139, 0, 'auth_fc', '2014051200', '2014051200', 'Upgrade savepoint reached', NULL, '', 0, 1415060999),
(140, 0, 'auth_fc', '2014051200', '2014051200', 'Plugin installed', NULL, '', 0, 1415060999),
(141, 0, 'auth_imap', NULL, '2014051200', 'Starting plugin installation', NULL, '', 0, 1415060999),
(142, 0, 'auth_imap', '2014051200', '2014051200', 'Upgrade savepoint reached', NULL, '', 0, 1415060999),
(143, 0, 'auth_imap', '2014051200', '2014051200', 'Plugin installed', NULL, '', 0, 1415060999),
(144, 0, 'auth_ldap', NULL, '2014051200', 'Starting plugin installation', NULL, '', 0, 1415060999),
(145, 0, 'auth_ldap', '2014051200', '2014051200', 'Upgrade savepoint reached', NULL, '', 0, 1415060999),
(146, 0, 'auth_ldap', '2014051200', '2014051200', 'Plugin installed', NULL, '', 0, 1415061000),
(147, 0, 'auth_manual', NULL, '2014051200', 'Starting plugin installation', NULL, '', 0, 1415061000),
(148, 0, 'auth_manual', '2014051200', '2014051200', 'Upgrade savepoint reached', NULL, '', 0, 1415061000),
(149, 0, 'auth_manual', '2014051200', '2014051200', 'Plugin installed', NULL, '', 0, 1415061000),
(150, 0, 'auth_mnet', NULL, '2014051200', 'Starting plugin installation', NULL, '', 0, 1415061000),
(151, 0, 'auth_mnet', '2014051200', '2014051200', 'Upgrade savepoint reached', NULL, '', 0, 1415061000),
(152, 0, 'auth_mnet', '2014051200', '2014051200', 'Plugin installed', NULL, '', 0, 1415061001),
(153, 0, 'auth_nntp', NULL, '2014051200', 'Starting plugin installation', NULL, '', 0, 1415061001),
(154, 0, 'auth_nntp', '2014051200', '2014051200', 'Upgrade savepoint reached', NULL, '', 0, 1415061001),
(155, 0, 'auth_nntp', '2014051200', '2014051200', 'Plugin installed', NULL, '', 0, 1415061001),
(156, 0, 'auth_nologin', NULL, '2014051200', 'Starting plugin installation', NULL, '', 0, 1415061001),
(157, 0, 'auth_nologin', '2014051200', '2014051200', 'Upgrade savepoint reached', NULL, '', 0, 1415061001),
(158, 0, 'auth_nologin', '2014051200', '2014051200', 'Plugin installed', NULL, '', 0, 1415061001),
(159, 0, 'auth_none', NULL, '2014051200', 'Starting plugin installation', NULL, '', 0, 1415061001),
(160, 0, 'auth_none', '2014051200', '2014051200', 'Upgrade savepoint reached', NULL, '', 0, 1415061001),
(161, 0, 'auth_none', '2014051200', '2014051200', 'Plugin installed', NULL, '', 0, 1415061001),
(162, 0, 'auth_pam', NULL, '2014051200', 'Starting plugin installation', NULL, '', 0, 1415061001),
(163, 0, 'auth_pam', '2014051200', '2014051200', 'Upgrade savepoint reached', NULL, '', 0, 1415061001),
(164, 0, 'auth_pam', '2014051200', '2014051200', 'Plugin installed', NULL, '', 0, 1415061001),
(165, 0, 'auth_pop3', NULL, '2014051200', 'Starting plugin installation', NULL, '', 0, 1415061001),
(166, 0, 'auth_pop3', '2014051200', '2014051200', 'Upgrade savepoint reached', NULL, '', 0, 1415061001),
(167, 0, 'auth_pop3', '2014051200', '2014051200', 'Plugin installed', NULL, '', 0, 1415061001),
(168, 0, 'auth_radius', NULL, '2014051200', 'Starting plugin installation', NULL, '', 0, 1415061001),
(169, 0, 'auth_radius', '2014051200', '2014051200', 'Upgrade savepoint reached', NULL, '', 0, 1415061001),
(170, 0, 'auth_radius', '2014051200', '2014051200', 'Plugin installed', NULL, '', 0, 1415061001),
(171, 0, 'auth_shibboleth', NULL, '2014051200', 'Starting plugin installation', NULL, '', 0, 1415061001),
(172, 0, 'auth_shibboleth', '2014051200', '2014051200', 'Upgrade savepoint reached', NULL, '', 0, 1415061001),
(173, 0, 'auth_shibboleth', '2014051200', '2014051200', 'Plugin installed', NULL, '', 0, 1415061001),
(174, 0, 'auth_webservice', NULL, '2014051200', 'Starting plugin installation', NULL, '', 0, 1415061001),
(175, 0, 'auth_webservice', '2014051200', '2014051200', 'Upgrade savepoint reached', NULL, '', 0, 1415061001),
(176, 0, 'auth_webservice', '2014051200', '2014051200', 'Plugin installed', NULL, '', 0, 1415061001),
(177, 0, 'calendartype_gregorian', NULL, '2014051200', 'Starting plugin installation', NULL, '', 0, 1415061001),
(178, 0, 'calendartype_gregorian', '2014051200', '2014051200', 'Upgrade savepoint reached', NULL, '', 0, 1415061001),
(179, 0, 'calendartype_gregorian', '2014051200', '2014051200', 'Plugin installed', NULL, '', 0, 1415061002),
(180, 0, 'enrol_category', NULL, '2014051200', 'Starting plugin installation', NULL, '', 0, 1415061002),
(181, 0, 'enrol_category', '2014051200', '2014051200', 'Upgrade savepoint reached', NULL, '', 0, 1415061002),
(182, 0, 'enrol_category', '2014051200', '2014051200', 'Plugin installed', NULL, '', 0, 1415061002),
(183, 0, 'enrol_cohort', NULL, '2014051200', 'Starting plugin installation', NULL, '', 0, 1415061002),
(184, 0, 'enrol_cohort', '2014051200', '2014051200', 'Upgrade savepoint reached', NULL, '', 0, 1415061002),
(185, 0, 'enrol_cohort', '2014051200', '2014051200', 'Plugin installed', NULL, '', 0, 1415061002),
(186, 0, 'enrol_database', NULL, '2014051200', 'Starting plugin installation', NULL, '', 0, 1415061002),
(187, 0, 'enrol_database', '2014051200', '2014051200', 'Upgrade savepoint reached', NULL, '', 0, 1415061002),
(188, 0, 'enrol_database', '2014051200', '2014051200', 'Plugin installed', NULL, '', 0, 1415061002),
(189, 0, 'enrol_flatfile', NULL, '2014051200', 'Starting plugin installation', NULL, '', 0, 1415061002),
(190, 0, 'enrol_flatfile', '2014051200', '2014051200', 'Upgrade savepoint reached', NULL, '', 0, 1415061002),
(191, 0, 'enrol_flatfile', '2014051200', '2014051200', 'Plugin installed', NULL, '', 0, 1415061002),
(192, 0, 'enrol_guest', NULL, '2014051200', 'Starting plugin installation', NULL, '', 0, 1415061002),
(193, 0, 'enrol_guest', '2014051200', '2014051200', 'Upgrade savepoint reached', NULL, '', 0, 1415061002),
(194, 0, 'enrol_guest', '2014051200', '2014051200', 'Plugin installed', NULL, '', 0, 1415061002),
(195, 0, 'enrol_imsenterprise', NULL, '2014051200', 'Starting plugin installation', NULL, '', 0, 1415061002),
(196, 0, 'enrol_imsenterprise', '2014051200', '2014051200', 'Upgrade savepoint reached', NULL, '', 0, 1415061002),
(197, 0, 'enrol_imsenterprise', '2014051200', '2014051200', 'Plugin installed', NULL, '', 0, 1415061002),
(198, 0, 'enrol_ldap', NULL, '2014051200', 'Starting plugin installation', NULL, '', 0, 1415061002),
(199, 0, 'enrol_ldap', '2014051200', '2014051200', 'Upgrade savepoint reached', NULL, '', 0, 1415061002),
(200, 0, 'enrol_ldap', '2014051200', '2014051200', 'Plugin installed', NULL, '', 0, 1415061002),
(201, 0, 'enrol_manual', NULL, '2014051200', 'Starting plugin installation', NULL, '', 0, 1415061002),
(202, 0, 'enrol_manual', '2014051200', '2014051200', 'Upgrade savepoint reached', NULL, '', 0, 1415061002),
(203, 0, 'enrol_manual', '2014051200', '2014051200', 'Plugin installed', NULL, '', 0, 1415061003),
(204, 0, 'enrol_meta', NULL, '2014051200', 'Starting plugin installation', NULL, '', 0, 1415061003),
(205, 0, 'enrol_meta', '2014051200', '2014051200', 'Upgrade savepoint reached', NULL, '', 0, 1415061003),
(206, 0, 'enrol_meta', '2014051200', '2014051200', 'Plugin installed', NULL, '', 0, 1415061003),
(207, 0, 'enrol_mnet', NULL, '2014051200', 'Starting plugin installation', NULL, '', 0, 1415061003),
(208, 0, 'enrol_mnet', '2014051200', '2014051200', 'Upgrade savepoint reached', NULL, '', 0, 1415061003),
(209, 0, 'enrol_mnet', '2014051200', '2014051200', 'Plugin installed', NULL, '', 0, 1415061003),
(210, 0, 'enrol_paypal', NULL, '2014051200', 'Starting plugin installation', NULL, '', 0, 1415061003),
(211, 0, 'enrol_paypal', '2014051200', '2014051200', 'Upgrade savepoint reached', NULL, '', 0, 1415061003),
(212, 0, 'enrol_paypal', '2014051200', '2014051200', 'Plugin installed', NULL, '', 0, 1415061003),
(213, 0, 'enrol_self', NULL, '2014051200', 'Starting plugin installation', NULL, '', 0, 1415061003),
(214, 0, 'enrol_self', '2014051200', '2014051200', 'Upgrade savepoint reached', NULL, '', 0, 1415061003),
(215, 0, 'enrol_self', '2014051200', '2014051200', 'Plugin installed', NULL, '', 0, 1415061003),
(216, 0, 'message_airnotifier', NULL, '2014051200', 'Starting plugin installation', NULL, '', 0, 1415061003),
(217, 0, 'message_airnotifier', '2014051200', '2014051200', 'Upgrade savepoint reached', NULL, '', 0, 1415061004),
(218, 0, 'message_airnotifier', '2014051200', '2014051200', 'Plugin installed', NULL, '', 0, 1415061004),
(219, 0, 'message_email', NULL, '2014051200', 'Starting plugin installation', NULL, '', 0, 1415061004),
(220, 0, 'message_email', '2014051200', '2014051200', 'Upgrade savepoint reached', NULL, '', 0, 1415061004),
(221, 0, 'message_email', '2014051200', '2014051200', 'Plugin installed', NULL, '', 0, 1415061004),
(222, 0, 'message_jabber', NULL, '2014051200', 'Starting plugin installation', NULL, '', 0, 1415061004),
(223, 0, 'message_jabber', '2014051200', '2014051200', 'Upgrade savepoint reached', NULL, '', 0, 1415061004),
(224, 0, 'message_jabber', '2014051200', '2014051200', 'Plugin installed', NULL, '', 0, 1415061005),
(225, 0, 'message_popup', NULL, '2014051200', 'Starting plugin installation', NULL, '', 0, 1415061005),
(226, 0, 'message_popup', '2014051200', '2014051200', 'Upgrade savepoint reached', NULL, '', 0, 1415061005),
(227, 0, 'message_popup', '2014051200', '2014051200', 'Plugin installed', NULL, '', 0, 1415061005),
(228, 0, 'block_activity_modules', NULL, '2014051200', 'Starting plugin installation', NULL, '', 0, 1415061005),
(229, 0, 'block_activity_modules', '2014051200', '2014051200', 'Upgrade savepoint reached', NULL, '', 0, 1415061005),
(230, 0, 'block_activity_modules', '2014051200', '2014051200', 'Plugin installed', NULL, '', 0, 1415061005),
(231, 0, 'block_admin_bookmarks', NULL, '2014051200', 'Starting plugin installation', NULL, '', 0, 1415061005),
(232, 0, 'block_admin_bookmarks', '2014051200', '2014051200', 'Upgrade savepoint reached', NULL, '', 0, 1415061005),
(233, 0, 'block_admin_bookmarks', '2014051200', '2014051200', 'Plugin installed', NULL, '', 0, 1415061005),
(234, 0, 'block_badges', NULL, '2014051200', 'Starting plugin installation', NULL, '', 0, 1415061005),
(235, 0, 'block_badges', '2014051200', '2014051200', 'Upgrade savepoint reached', NULL, '', 0, 1415061005),
(236, 0, 'block_badges', '2014051200', '2014051200', 'Plugin installed', NULL, '', 0, 1415061005),
(237, 0, 'block_blog_menu', NULL, '2014051200', 'Starting plugin installation', NULL, '', 0, 1415061005),
(238, 0, 'block_blog_menu', '2014051200', '2014051200', 'Upgrade savepoint reached', NULL, '', 0, 1415061005),
(239, 0, 'block_blog_menu', '2014051200', '2014051200', 'Plugin installed', NULL, '', 0, 1415061006),
(240, 0, 'block_blog_recent', NULL, '2014051200', 'Starting plugin installation', NULL, '', 0, 1415061006),
(241, 0, 'block_blog_recent', '2014051200', '2014051200', 'Upgrade savepoint reached', NULL, '', 0, 1415061006),
(242, 0, 'block_blog_recent', '2014051200', '2014051200', 'Plugin installed', NULL, '', 0, 1415061006),
(243, 0, 'block_blog_tags', NULL, '2014051200', 'Starting plugin installation', NULL, '', 0, 1415061006),
(244, 0, 'block_blog_tags', '2014051200', '2014051200', 'Upgrade savepoint reached', NULL, '', 0, 1415061006),
(245, 0, 'block_blog_tags', '2014051200', '2014051200', 'Plugin installed', NULL, '', 0, 1415061006),
(246, 0, 'block_calendar_month', NULL, '2014051200', 'Starting plugin installation', NULL, '', 0, 1415061006),
(247, 0, 'block_calendar_month', '2014051200', '2014051200', 'Upgrade savepoint reached', NULL, '', 0, 1415061006),
(248, 0, 'block_calendar_month', '2014051200', '2014051200', 'Plugin installed', NULL, '', 0, 1415061006),
(249, 0, 'block_calendar_upcoming', NULL, '2014051200', 'Starting plugin installation', NULL, '', 0, 1415061006),
(250, 0, 'block_calendar_upcoming', '2014051200', '2014051200', 'Upgrade savepoint reached', NULL, '', 0, 1415061006),
(251, 0, 'block_calendar_upcoming', '2014051200', '2014051200', 'Plugin installed', NULL, '', 0, 1415061006),
(252, 0, 'block_comments', NULL, '2014051200', 'Starting plugin installation', NULL, '', 0, 1415061006),
(253, 0, 'block_comments', '2014051200', '2014051200', 'Upgrade savepoint reached', NULL, '', 0, 1415061006),
(254, 0, 'block_comments', '2014051200', '2014051200', 'Plugin installed', NULL, '', 0, 1415061006),
(255, 0, 'block_community', NULL, '2014051200', 'Starting plugin installation', NULL, '', 0, 1415061006),
(256, 0, 'block_community', '2014051200', '2014051200', 'Upgrade savepoint reached', NULL, '', 0, 1415061006),
(257, 0, 'block_community', '2014051200', '2014051200', 'Plugin installed', NULL, '', 0, 1415061006),
(258, 0, 'block_completionstatus', NULL, '2014051200', 'Starting plugin installation', NULL, '', 0, 1415061006),
(259, 0, 'block_completionstatus', '2014051200', '2014051200', 'Upgrade savepoint reached', NULL, '', 0, 1415061006),
(260, 0, 'block_completionstatus', '2014051200', '2014051200', 'Plugin installed', NULL, '', 0, 1415061006),
(261, 0, 'block_course_list', NULL, '2014051200', 'Starting plugin installation', NULL, '', 0, 1415061006),
(262, 0, 'block_course_list', '2014051200', '2014051200', 'Upgrade savepoint reached', NULL, '', 0, 1415061006),
(263, 0, 'block_course_list', '2014051200', '2014051200', 'Plugin installed', NULL, '', 0, 1415061006),
(264, 0, 'block_course_overview', NULL, '2014051200', 'Starting plugin installation', NULL, '', 0, 1415061006),
(265, 0, 'block_course_overview', '2014051200', '2014051200', 'Upgrade savepoint reached', NULL, '', 0, 1415061006),
(266, 0, 'block_course_overview', '2014051200', '2014051200', 'Plugin installed', NULL, '', 0, 1415061006),
(267, 0, 'block_course_summary', NULL, '2014051200', 'Starting plugin installation', NULL, '', 0, 1415061007),
(268, 0, 'block_course_summary', '2014051200', '2014051200', 'Upgrade savepoint reached', NULL, '', 0, 1415061007),
(269, 0, 'block_course_summary', '2014051200', '2014051200', 'Plugin installed', NULL, '', 0, 1415061007),
(270, 0, 'block_feedback', NULL, '2014051200', 'Starting plugin installation', NULL, '', 0, 1415061007),
(271, 0, 'block_feedback', '2014051200', '2014051200', 'Upgrade savepoint reached', NULL, '', 0, 1415061007),
(272, 0, 'block_feedback', '2014051200', '2014051200', 'Plugin installed', NULL, '', 0, 1415061007),
(273, 0, 'block_glossary_random', NULL, '2014051200', 'Starting plugin installation', NULL, '', 0, 1415061007),
(274, 0, 'block_glossary_random', '2014051200', '2014051200', 'Upgrade savepoint reached', NULL, '', 0, 1415061007),
(275, 0, 'block_glossary_random', '2014051200', '2014051200', 'Plugin installed', NULL, '', 0, 1415061007),
(276, 0, 'block_html', NULL, '2014051200', 'Starting plugin installation', NULL, '', 0, 1415061007),
(277, 0, 'block_html', '2014051200', '2014051200', 'Upgrade savepoint reached', NULL, '', 0, 1415061007),
(278, 0, 'block_html', '2014051200', '2014051200', 'Plugin installed', NULL, '', 0, 1415061007),
(279, 0, 'block_login', NULL, '2014051200', 'Starting plugin installation', NULL, '', 0, 1415061007),
(280, 0, 'block_login', '2014051200', '2014051200', 'Upgrade savepoint reached', NULL, '', 0, 1415061007),
(281, 0, 'block_login', '2014051200', '2014051200', 'Plugin installed', NULL, '', 0, 1415061007),
(282, 0, 'block_mentees', NULL, '2014051200', 'Starting plugin installation', NULL, '', 0, 1415061007),
(283, 0, 'block_mentees', '2014051200', '2014051200', 'Upgrade savepoint reached', NULL, '', 0, 1415061007),
(284, 0, 'block_mentees', '2014051200', '2014051200', 'Plugin installed', NULL, '', 0, 1415061007),
(285, 0, 'block_messages', NULL, '2014051200', 'Starting plugin installation', NULL, '', 0, 1415061007),
(286, 0, 'block_messages', '2014051200', '2014051200', 'Upgrade savepoint reached', NULL, '', 0, 1415061007),
(287, 0, 'block_messages', '2014051200', '2014051200', 'Plugin installed', NULL, '', 0, 1415061007),
(288, 0, 'block_mnet_hosts', NULL, '2014051200', 'Starting plugin installation', NULL, '', 0, 1415061007),
(289, 0, 'block_mnet_hosts', '2014051200', '2014051200', 'Upgrade savepoint reached', NULL, '', 0, 1415061007),
(290, 0, 'block_mnet_hosts', '2014051200', '2014051200', 'Plugin installed', NULL, '', 0, 1415061007),
(291, 0, 'block_myprofile', NULL, '2014051200', 'Starting plugin installation', NULL, '', 0, 1415061007),
(292, 0, 'block_myprofile', '2014051200', '2014051200', 'Upgrade savepoint reached', NULL, '', 0, 1415061007),
(293, 0, 'block_myprofile', '2014051200', '2014051200', 'Plugin installed', NULL, '', 0, 1415061007),
(294, 0, 'block_navigation', NULL, '2014051200', 'Starting plugin installation', NULL, '', 0, 1415061007),
(295, 0, 'block_navigation', '2014051200', '2014051200', 'Upgrade savepoint reached', NULL, '', 0, 1415061007),
(296, 0, 'block_navigation', '2014051200', '2014051200', 'Plugin installed', NULL, '', 0, 1415061008),
(297, 0, 'block_news_items', NULL, '2014051200', 'Starting plugin installation', NULL, '', 0, 1415061008),
(298, 0, 'block_news_items', '2014051200', '2014051200', 'Upgrade savepoint reached', NULL, '', 0, 1415061008),
(299, 0, 'block_news_items', '2014051200', '2014051200', 'Plugin installed', NULL, '', 0, 1415061008),
(300, 0, 'block_online_users', NULL, '2014051200', 'Starting plugin installation', NULL, '', 0, 1415061008),
(301, 0, 'block_online_users', '2014051200', '2014051200', 'Upgrade savepoint reached', NULL, '', 0, 1415061008),
(302, 0, 'block_online_users', '2014051200', '2014051200', 'Plugin installed', NULL, '', 0, 1415061008),
(303, 0, 'block_participants', NULL, '2014051200', 'Starting plugin installation', NULL, '', 0, 1415061008),
(304, 0, 'block_participants', '2014051200', '2014051200', 'Upgrade savepoint reached', NULL, '', 0, 1415061008),
(305, 0, 'block_participants', '2014051200', '2014051200', 'Plugin installed', NULL, '', 0, 1415061008),
(306, 0, 'block_private_files', NULL, '2014051200', 'Starting plugin installation', NULL, '', 0, 1415061008),
(307, 0, 'block_private_files', '2014051200', '2014051200', 'Upgrade savepoint reached', NULL, '', 0, 1415061008),
(308, 0, 'block_private_files', '2014051200', '2014051200', 'Plugin installed', NULL, '', 0, 1415061008),
(309, 0, 'block_quiz_results', NULL, '2014051200', 'Starting plugin installation', NULL, '', 0, 1415061008),
(310, 0, 'block_quiz_results', '2014051200', '2014051200', 'Upgrade savepoint reached', NULL, '', 0, 1415061008),
(311, 0, 'block_quiz_results', '2014051200', '2014051200', 'Plugin installed', NULL, '', 0, 1415061008),
(312, 0, 'block_recent_activity', NULL, '2014051200', 'Starting plugin installation', NULL, '', 0, 1415061008),
(313, 0, 'block_recent_activity', '2014051200', '2014051200', 'Upgrade savepoint reached', NULL, '', 0, 1415061008),
(314, 0, 'block_recent_activity', '2014051200', '2014051200', 'Plugin installed', NULL, '', 0, 1415061009),
(315, 0, 'block_rss_client', NULL, '2014051200', 'Starting plugin installation', NULL, '', 0, 1415061009),
(316, 0, 'block_rss_client', '2014051200', '2014051200', 'Upgrade savepoint reached', NULL, '', 0, 1415061009),
(317, 0, 'block_rss_client', '2014051200', '2014051200', 'Plugin installed', NULL, '', 0, 1415061009),
(318, 0, 'block_search_forums', NULL, '2014051200', 'Starting plugin installation', NULL, '', 0, 1415061009),
(319, 0, 'block_search_forums', '2014051200', '2014051200', 'Upgrade savepoint reached', NULL, '', 0, 1415061009),
(320, 0, 'block_search_forums', '2014051200', '2014051200', 'Plugin installed', NULL, '', 0, 1415061009),
(321, 0, 'block_section_links', NULL, '2014051200', 'Starting plugin installation', NULL, '', 0, 1415061009),
(322, 0, 'block_section_links', '2014051200', '2014051200', 'Upgrade savepoint reached', NULL, '', 0, 1415061009),
(323, 0, 'block_section_links', '2014051200', '2014051200', 'Plugin installed', NULL, '', 0, 1415061009),
(324, 0, 'block_selfcompletion', NULL, '2014051200', 'Starting plugin installation', NULL, '', 0, 1415061009),
(325, 0, 'block_selfcompletion', '2014051200', '2014051200', 'Upgrade savepoint reached', NULL, '', 0, 1415061009),
(326, 0, 'block_selfcompletion', '2014051200', '2014051200', 'Plugin installed', NULL, '', 0, 1415061009),
(327, 0, 'block_settings', NULL, '2014051200', 'Starting plugin installation', NULL, '', 0, 1415061009),
(328, 0, 'block_settings', '2014051200', '2014051200', 'Upgrade savepoint reached', NULL, '', 0, 1415061009),
(329, 0, 'block_settings', '2014051200', '2014051200', 'Plugin installed', NULL, '', 0, 1415061009),
(330, 0, 'block_site_main_menu', NULL, '2014051200', 'Starting plugin installation', NULL, '', 0, 1415061009),
(331, 0, 'block_site_main_menu', '2014051200', '2014051200', 'Upgrade savepoint reached', NULL, '', 0, 1415061009),
(332, 0, 'block_site_main_menu', '2014051200', '2014051200', 'Plugin installed', NULL, '', 0, 1415061009),
(333, 0, 'block_social_activities', NULL, '2014051200', 'Starting plugin installation', NULL, '', 0, 1415061009),
(334, 0, 'block_social_activities', '2014051200', '2014051200', 'Upgrade savepoint reached', NULL, '', 0, 1415061009),
(335, 0, 'block_social_activities', '2014051200', '2014051200', 'Plugin installed', NULL, '', 0, 1415061009),
(336, 0, 'block_tag_flickr', NULL, '2014051200', 'Starting plugin installation', NULL, '', 0, 1415061009),
(337, 0, 'block_tag_flickr', '2014051200', '2014051200', 'Upgrade savepoint reached', NULL, '', 0, 1415061009),
(338, 0, 'block_tag_flickr', '2014051200', '2014051200', 'Plugin installed', NULL, '', 0, 1415061009),
(339, 0, 'block_tag_youtube', NULL, '2014051200', 'Starting plugin installation', NULL, '', 0, 1415061009),
(340, 0, 'block_tag_youtube', '2014051200', '2014051200', 'Upgrade savepoint reached', NULL, '', 0, 1415061009),
(341, 0, 'block_tag_youtube', '2014051200', '2014051200', 'Plugin installed', NULL, '', 0, 1415061009),
(342, 0, 'block_tags', NULL, '2014051200', 'Starting plugin installation', NULL, '', 0, 1415061009),
(343, 0, 'block_tags', '2014051200', '2014051200', 'Upgrade savepoint reached', NULL, '', 0, 1415061009),
(344, 0, 'block_tags', '2014051200', '2014051200', 'Plugin installed', NULL, '', 0, 1415061009),
(345, 0, 'filter_activitynames', NULL, '2014051200', 'Starting plugin installation', NULL, '', 0, 1415061010),
(346, 0, 'filter_activitynames', '2014051200', '2014051200', 'Upgrade savepoint reached', NULL, '', 0, 1415061010),
(347, 0, 'filter_activitynames', '2014051200', '2014051200', 'Plugin installed', NULL, '', 0, 1415061010),
(348, 0, 'filter_algebra', NULL, '2014051200', 'Starting plugin installation', NULL, '', 0, 1415061010),
(349, 0, 'filter_algebra', '2014051200', '2014051200', 'Upgrade savepoint reached', NULL, '', 0, 1415061010),
(350, 0, 'filter_algebra', '2014051200', '2014051200', 'Plugin installed', NULL, '', 0, 1415061010),
(351, 0, 'filter_censor', NULL, '2014051200', 'Starting plugin installation', NULL, '', 0, 1415061010),
(352, 0, 'filter_censor', '2014051200', '2014051200', 'Upgrade savepoint reached', NULL, '', 0, 1415061010),
(353, 0, 'filter_censor', '2014051200', '2014051200', 'Plugin installed', NULL, '', 0, 1415061010),
(354, 0, 'filter_data', NULL, '2014051200', 'Starting plugin installation', NULL, '', 0, 1415061010),
(355, 0, 'filter_data', '2014051200', '2014051200', 'Upgrade savepoint reached', NULL, '', 0, 1415061010),
(356, 0, 'filter_data', '2014051200', '2014051200', 'Plugin installed', NULL, '', 0, 1415061010),
(357, 0, 'filter_emailprotect', NULL, '2014051200', 'Starting plugin installation', NULL, '', 0, 1415061010),
(358, 0, 'filter_emailprotect', '2014051200', '2014051200', 'Upgrade savepoint reached', NULL, '', 0, 1415061010),
(359, 0, 'filter_emailprotect', '2014051200', '2014051200', 'Plugin installed', NULL, '', 0, 1415061010),
(360, 0, 'filter_emoticon', NULL, '2014051200', 'Starting plugin installation', NULL, '', 0, 1415061010),
(361, 0, 'filter_emoticon', '2014051200', '2014051200', 'Upgrade savepoint reached', NULL, '', 0, 1415061010),
(362, 0, 'filter_emoticon', '2014051200', '2014051200', 'Plugin installed', NULL, '', 0, 1415061010),
(363, 0, 'filter_glossary', NULL, '2014051200', 'Starting plugin installation', NULL, '', 0, 1415061010),
(364, 0, 'filter_glossary', '2014051200', '2014051200', 'Upgrade savepoint reached', NULL, '', 0, 1415061010),
(365, 0, 'filter_glossary', '2014051200', '2014051200', 'Plugin installed', NULL, '', 0, 1415061010),
(366, 0, 'filter_mathjaxloader', NULL, '2014051201', 'Starting plugin installation', NULL, '', 0, 1415061010),
(367, 0, 'filter_mathjaxloader', '2014051201', '2014051201', 'Upgrade savepoint reached', NULL, '', 0, 1415061010),
(368, 0, 'filter_mathjaxloader', '2014051201', '2014051201', 'Plugin installed', NULL, '', 0, 1415061010),
(369, 0, 'filter_mediaplugin', NULL, '2014051200', 'Starting plugin installation', NULL, '', 0, 1415061010),
(370, 0, 'filter_mediaplugin', '2014051200', '2014051200', 'Upgrade savepoint reached', NULL, '', 0, 1415061010),
(371, 0, 'filter_mediaplugin', '2014051200', '2014051200', 'Plugin installed', NULL, '', 0, 1415061011),
(372, 0, 'filter_multilang', NULL, '2014051200', 'Starting plugin installation', NULL, '', 0, 1415061011),
(373, 0, 'filter_multilang', '2014051200', '2014051200', 'Upgrade savepoint reached', NULL, '', 0, 1415061011),
(374, 0, 'filter_multilang', '2014051200', '2014051200', 'Plugin installed', NULL, '', 0, 1415061011),
(375, 0, 'filter_tex', NULL, '2014051200', 'Starting plugin installation', NULL, '', 0, 1415061011),
(376, 0, 'filter_tex', '2014051200', '2014051200', 'Upgrade savepoint reached', NULL, '', 0, 1415061011),
(377, 0, 'filter_tex', '2014051200', '2014051200', 'Plugin installed', NULL, '', 0, 1415061011),
(378, 0, 'filter_tidy', NULL, '2014051200', 'Starting plugin installation', NULL, '', 0, 1415061011),
(379, 0, 'filter_tidy', '2014051200', '2014051200', 'Upgrade savepoint reached', NULL, '', 0, 1415061011),
(380, 0, 'filter_tidy', '2014051200', '2014051200', 'Plugin installed', NULL, '', 0, 1415061011),
(381, 0, 'filter_urltolink', NULL, '2014051200', 'Starting plugin installation', NULL, '', 0, 1415061011),
(382, 0, 'filter_urltolink', '2014051200', '2014051200', 'Upgrade savepoint reached', NULL, '', 0, 1415061011),
(383, 0, 'filter_urltolink', '2014051200', '2014051200', 'Plugin installed', NULL, '', 0, 1415061011),
(384, 0, 'editor_atto', NULL, '2014051200', 'Starting plugin installation', NULL, '', 0, 1415061011),
(385, 0, 'editor_atto', '2014051200', '2014051200', 'Upgrade savepoint reached', NULL, '', 0, 1415061011),
(386, 0, 'editor_atto', '2014051200', '2014051200', 'Plugin installed', NULL, '', 0, 1415061011),
(387, 0, 'editor_textarea', NULL, '2014051200', 'Starting plugin installation', NULL, '', 0, 1415061011),
(388, 0, 'editor_textarea', '2014051200', '2014051200', 'Upgrade savepoint reached', NULL, '', 0, 1415061011),
(389, 0, 'editor_textarea', '2014051200', '2014051200', 'Plugin installed', NULL, '', 0, 1415061011),
(390, 0, 'editor_tinymce', NULL, '2014051201', 'Starting plugin installation', NULL, '', 0, 1415061011),
(391, 0, 'editor_tinymce', '2014051201', '2014051201', 'Upgrade savepoint reached', NULL, '', 0, 1415061011),
(392, 0, 'editor_tinymce', '2014051201', '2014051201', 'Plugin installed', NULL, '', 0, 1415061011),
(393, 0, 'format_singleactivity', NULL, '2014051200', 'Starting plugin installation', NULL, '', 0, 1415061011),
(394, 0, 'format_singleactivity', '2014051200', '2014051200', 'Upgrade savepoint reached', NULL, '', 0, 1415061011),
(395, 0, 'format_singleactivity', '2014051200', '2014051200', 'Plugin installed', NULL, '', 0, 1415061011),
(396, 0, 'format_social', NULL, '2014051200', 'Starting plugin installation', NULL, '', 0, 1415061011),
(397, 0, 'format_social', '2014051200', '2014051200', 'Upgrade savepoint reached', NULL, '', 0, 1415061011),
(398, 0, 'format_social', '2014051200', '2014051200', 'Plugin installed', NULL, '', 0, 1415061011),
(399, 0, 'format_topics', NULL, '2014051200', 'Starting plugin installation', NULL, '', 0, 1415061011),
(400, 0, 'format_topics', '2014051200', '2014051200', 'Upgrade savepoint reached', NULL, '', 0, 1415061011),
(401, 0, 'format_topics', '2014051200', '2014051200', 'Plugin installed', NULL, '', 0, 1415061011),
(402, 0, 'format_weeks', NULL, '2014051200', 'Starting plugin installation', NULL, '', 0, 1415061011),
(403, 0, 'format_weeks', '2014051200', '2014051200', 'Upgrade savepoint reached', NULL, '', 0, 1415061011),
(404, 0, 'format_weeks', '2014051200', '2014051200', 'Plugin installed', NULL, '', 0, 1415061011),
(405, 0, 'profilefield_checkbox', NULL, '2014051200', 'Starting plugin installation', NULL, '', 0, 1415061011),
(406, 0, 'profilefield_checkbox', '2014051200', '2014051200', 'Upgrade savepoint reached', NULL, '', 0, 1415061011),
(407, 0, 'profilefield_checkbox', '2014051200', '2014051200', 'Plugin installed', NULL, '', 0, 1415061011),
(408, 0, 'profilefield_datetime', NULL, '2014051200', 'Starting plugin installation', NULL, '', 0, 1415061011),
(409, 0, 'profilefield_datetime', '2014051200', '2014051200', 'Upgrade savepoint reached', NULL, '', 0, 1415061011),
(410, 0, 'profilefield_datetime', '2014051200', '2014051200', 'Plugin installed', NULL, '', 0, 1415061011),
(411, 0, 'profilefield_menu', NULL, '2014051200', 'Starting plugin installation', NULL, '', 0, 1415061011),
(412, 0, 'profilefield_menu', '2014051200', '2014051200', 'Upgrade savepoint reached', NULL, '', 0, 1415061011),
(413, 0, 'profilefield_menu', '2014051200', '2014051200', 'Plugin installed', NULL, '', 0, 1415061011),
(414, 0, 'profilefield_text', NULL, '2014051200', 'Starting plugin installation', NULL, '', 0, 1415061011),
(415, 0, 'profilefield_text', '2014051200', '2014051200', 'Upgrade savepoint reached', NULL, '', 0, 1415061011),
(416, 0, 'profilefield_text', '2014051200', '2014051200', 'Plugin installed', NULL, '', 0, 1415061011),
(417, 0, 'profilefield_textarea', NULL, '2014051200', 'Starting plugin installation', NULL, '', 0, 1415061011),
(418, 0, 'profilefield_textarea', '2014051200', '2014051200', 'Upgrade savepoint reached', NULL, '', 0, 1415061011),
(419, 0, 'profilefield_textarea', '2014051200', '2014051200', 'Plugin installed', NULL, '', 0, 1415061012),
(420, 0, 'report_backups', NULL, '2014051200', 'Starting plugin installation', NULL, '', 0, 1415061012),
(421, 0, 'report_backups', '2014051200', '2014051200', 'Upgrade savepoint reached', NULL, '', 0, 1415061012),
(422, 0, 'report_backups', '2014051200', '2014051200', 'Plugin installed', NULL, '', 0, 1415061012),
(423, 0, 'report_completion', NULL, '2014051200', 'Starting plugin installation', NULL, '', 0, 1415061012),
(424, 0, 'report_completion', '2014051200', '2014051200', 'Upgrade savepoint reached', NULL, '', 0, 1415061012),
(425, 0, 'report_completion', '2014051200', '2014051200', 'Plugin installed', NULL, '', 0, 1415061012),
(426, 0, 'report_configlog', NULL, '2014051200', 'Starting plugin installation', NULL, '', 0, 1415061012),
(427, 0, 'report_configlog', '2014051200', '2014051200', 'Upgrade savepoint reached', NULL, '', 0, 1415061012),
(428, 0, 'report_configlog', '2014051200', '2014051200', 'Plugin installed', NULL, '', 0, 1415061012),
(429, 0, 'report_courseoverview', NULL, '2014051200', 'Starting plugin installation', NULL, '', 0, 1415061012),
(430, 0, 'report_courseoverview', '2014051200', '2014051200', 'Upgrade savepoint reached', NULL, '', 0, 1415061012),
(431, 0, 'report_courseoverview', '2014051200', '2014051200', 'Plugin installed', NULL, '', 0, 1415061012),
(432, 0, 'report_eventlist', NULL, '2014051200', 'Starting plugin installation', NULL, '', 0, 1415061012),
(433, 0, 'report_eventlist', '2014051200', '2014051200', 'Upgrade savepoint reached', NULL, '', 0, 1415061012),
(434, 0, 'report_eventlist', '2014051200', '2014051200', 'Plugin installed', NULL, '', 0, 1415061012),
(435, 0, 'report_log', NULL, '2014051200', 'Starting plugin installation', NULL, '', 0, 1415061012),
(436, 0, 'report_log', '2014051200', '2014051200', 'Upgrade savepoint reached', NULL, '', 0, 1415061012),
(437, 0, 'report_log', '2014051200', '2014051200', 'Plugin installed', NULL, '', 0, 1415061012),
(438, 0, 'report_loglive', NULL, '2014051200', 'Starting plugin installation', NULL, '', 0, 1415061012),
(439, 0, 'report_loglive', '2014051200', '2014051200', 'Upgrade savepoint reached', NULL, '', 0, 1415061012),
(440, 0, 'report_loglive', '2014051200', '2014051200', 'Plugin installed', NULL, '', 0, 1415061012),
(441, 0, 'report_outline', NULL, '2014051200', 'Starting plugin installation', NULL, '', 0, 1415061012),
(442, 0, 'report_outline', '2014051200', '2014051200', 'Upgrade savepoint reached', NULL, '', 0, 1415061012),
(443, 0, 'report_outline', '2014051200', '2014051200', 'Plugin installed', NULL, '', 0, 1415061012),
(444, 0, 'report_participation', NULL, '2014051200', 'Starting plugin installation', NULL, '', 0, 1415061012),
(445, 0, 'report_participation', '2014051200', '2014051200', 'Upgrade savepoint reached', NULL, '', 0, 1415061012),
(446, 0, 'report_participation', '2014051200', '2014051200', 'Plugin installed', NULL, '', 0, 1415061012),
(447, 0, 'report_performance', NULL, '2014051200', 'Starting plugin installation', NULL, '', 0, 1415061012),
(448, 0, 'report_performance', '2014051200', '2014051200', 'Upgrade savepoint reached', NULL, '', 0, 1415061012),
(449, 0, 'report_performance', '2014051200', '2014051200', 'Plugin installed', NULL, '', 0, 1415061012),
(450, 0, 'report_progress', NULL, '2014051200', 'Starting plugin installation', NULL, '', 0, 1415061012),
(451, 0, 'report_progress', '2014051200', '2014051200', 'Upgrade savepoint reached', NULL, '', 0, 1415061012),
(452, 0, 'report_progress', '2014051200', '2014051200', 'Plugin installed', NULL, '', 0, 1415061012),
(453, 0, 'report_questioninstances', NULL, '2014051200', 'Starting plugin installation', NULL, '', 0, 1415061012),
(454, 0, 'report_questioninstances', '2014051200', '2014051200', 'Upgrade savepoint reached', NULL, '', 0, 1415061012),
(455, 0, 'report_questioninstances', '2014051200', '2014051200', 'Plugin installed', NULL, '', 0, 1415061012),
(456, 0, 'report_security', NULL, '2014051200', 'Starting plugin installation', NULL, '', 0, 1415061012),
(457, 0, 'report_security', '2014051200', '2014051200', 'Upgrade savepoint reached', NULL, '', 0, 1415061013),
(458, 0, 'report_security', '2014051200', '2014051200', 'Plugin installed', NULL, '', 0, 1415061013),
(459, 0, 'report_stats', NULL, '2014051200', 'Starting plugin installation', NULL, '', 0, 1415061013),
(460, 0, 'report_stats', '2014051200', '2014051200', 'Upgrade savepoint reached', NULL, '', 0, 1415061013),
(461, 0, 'report_stats', '2014051200', '2014051200', 'Plugin installed', NULL, '', 0, 1415061013),
(462, 0, 'gradeexport_ods', NULL, '2014051200', 'Starting plugin installation', NULL, '', 0, 1415061013),
(463, 0, 'gradeexport_ods', '2014051200', '2014051200', 'Upgrade savepoint reached', NULL, '', 0, 1415061013),
(464, 0, 'gradeexport_ods', '2014051200', '2014051200', 'Plugin installed', NULL, '', 0, 1415061013),
(465, 0, 'gradeexport_txt', NULL, '2014051200', 'Starting plugin installation', NULL, '', 0, 1415061013),
(466, 0, 'gradeexport_txt', '2014051200', '2014051200', 'Upgrade savepoint reached', NULL, '', 0, 1415061013),
(467, 0, 'gradeexport_txt', '2014051200', '2014051200', 'Plugin installed', NULL, '', 0, 1415061013),
(468, 0, 'gradeexport_xls', NULL, '2014051200', 'Starting plugin installation', NULL, '', 0, 1415061013),
(469, 0, 'gradeexport_xls', '2014051200', '2014051200', 'Upgrade savepoint reached', NULL, '', 0, 1415061013),
(470, 0, 'gradeexport_xls', '2014051200', '2014051200', 'Plugin installed', NULL, '', 0, 1415061013),
(471, 0, 'gradeexport_xml', NULL, '2014051200', 'Starting plugin installation', NULL, '', 0, 1415061013),
(472, 0, 'gradeexport_xml', '2014051200', '2014051200', 'Upgrade savepoint reached', NULL, '', 0, 1415061013),
(473, 0, 'gradeexport_xml', '2014051200', '2014051200', 'Plugin installed', NULL, '', 0, 1415061013),
(474, 0, 'gradeimport_csv', NULL, '2014051200', 'Starting plugin installation', NULL, '', 0, 1415061013),
(475, 0, 'gradeimport_csv', '2014051200', '2014051200', 'Upgrade savepoint reached', NULL, '', 0, 1415061013),
(476, 0, 'gradeimport_csv', '2014051200', '2014051200', 'Plugin installed', NULL, '', 0, 1415061013),
(477, 0, 'gradeimport_xml', NULL, '2014051200', 'Starting plugin installation', NULL, '', 0, 1415061013),
(478, 0, 'gradeimport_xml', '2014051200', '2014051200', 'Upgrade savepoint reached', NULL, '', 0, 1415061013),
(479, 0, 'gradeimport_xml', '2014051200', '2014051200', 'Plugin installed', NULL, '', 0, 1415061013),
(480, 0, 'gradereport_grader', NULL, '2014051200', 'Starting plugin installation', NULL, '', 0, 1415061014);
INSERT INTO `mdl_upgrade_log` (`id`, `type`, `plugin`, `version`, `targetversion`, `info`, `details`, `backtrace`, `userid`, `timemodified`) VALUES
(481, 0, 'gradereport_grader', '2014051200', '2014051200', 'Upgrade savepoint reached', NULL, '', 0, 1415061014),
(482, 0, 'gradereport_grader', '2014051200', '2014051200', 'Plugin installed', NULL, '', 0, 1415061014),
(483, 0, 'gradereport_outcomes', NULL, '2014051200', 'Starting plugin installation', NULL, '', 0, 1415061014),
(484, 0, 'gradereport_outcomes', '2014051200', '2014051200', 'Upgrade savepoint reached', NULL, '', 0, 1415061014),
(485, 0, 'gradereport_outcomes', '2014051200', '2014051200', 'Plugin installed', NULL, '', 0, 1415061014),
(486, 0, 'gradereport_overview', NULL, '2014051200', 'Starting plugin installation', NULL, '', 0, 1415061014),
(487, 0, 'gradereport_overview', '2014051200', '2014051200', 'Upgrade savepoint reached', NULL, '', 0, 1415061014),
(488, 0, 'gradereport_overview', '2014051200', '2014051200', 'Plugin installed', NULL, '', 0, 1415061014),
(489, 0, 'gradereport_user', NULL, '2014051200', 'Starting plugin installation', NULL, '', 0, 1415061014),
(490, 0, 'gradereport_user', '2014051200', '2014051200', 'Upgrade savepoint reached', NULL, '', 0, 1415061014),
(491, 0, 'gradereport_user', '2014051200', '2014051200', 'Plugin installed', NULL, '', 0, 1415061014),
(492, 0, 'gradingform_guide', NULL, '2014051200', 'Starting plugin installation', NULL, '', 0, 1415061014),
(493, 0, 'gradingform_guide', '2014051200', '2014051200', 'Upgrade savepoint reached', NULL, '', 0, 1415061015),
(494, 0, 'gradingform_guide', '2014051200', '2014051200', 'Plugin installed', NULL, '', 0, 1415061015),
(495, 0, 'gradingform_rubric', NULL, '2014051200', 'Starting plugin installation', NULL, '', 0, 1415061015),
(496, 0, 'gradingform_rubric', '2014051200', '2014051200', 'Upgrade savepoint reached', NULL, '', 0, 1415061015),
(497, 0, 'gradingform_rubric', '2014051200', '2014051200', 'Plugin installed', NULL, '', 0, 1415061015),
(498, 0, 'mnetservice_enrol', NULL, '2014051200', 'Starting plugin installation', NULL, '', 0, 1415061015),
(499, 0, 'mnetservice_enrol', '2014051200', '2014051200', 'Upgrade savepoint reached', NULL, '', 0, 1415061016),
(500, 0, 'mnetservice_enrol', '2014051200', '2014051200', 'Plugin installed', NULL, '', 0, 1415061016),
(501, 0, 'webservice_amf', NULL, '2014051200', 'Starting plugin installation', NULL, '', 0, 1415061016),
(502, 0, 'webservice_amf', '2014051200', '2014051200', 'Upgrade savepoint reached', NULL, '', 0, 1415061016),
(503, 0, 'webservice_amf', '2014051200', '2014051200', 'Plugin installed', NULL, '', 0, 1415061016),
(504, 0, 'webservice_rest', NULL, '2014051200', 'Starting plugin installation', NULL, '', 0, 1415061016),
(505, 0, 'webservice_rest', '2014051200', '2014051200', 'Upgrade savepoint reached', NULL, '', 0, 1415061016),
(506, 0, 'webservice_rest', '2014051200', '2014051200', 'Plugin installed', NULL, '', 0, 1415061016),
(507, 0, 'webservice_soap', NULL, '2014051200', 'Starting plugin installation', NULL, '', 0, 1415061016),
(508, 0, 'webservice_soap', '2014051200', '2014051200', 'Upgrade savepoint reached', NULL, '', 0, 1415061016),
(509, 0, 'webservice_soap', '2014051200', '2014051200', 'Plugin installed', NULL, '', 0, 1415061016),
(510, 0, 'webservice_xmlrpc', NULL, '2014051200', 'Starting plugin installation', NULL, '', 0, 1415061016),
(511, 0, 'webservice_xmlrpc', '2014051200', '2014051200', 'Upgrade savepoint reached', NULL, '', 0, 1415061016),
(512, 0, 'webservice_xmlrpc', '2014051200', '2014051200', 'Plugin installed', NULL, '', 0, 1415061016),
(513, 0, 'repository_alfresco', NULL, '2014051200', 'Starting plugin installation', NULL, '', 0, 1415061016),
(514, 0, 'repository_alfresco', '2014051200', '2014051200', 'Upgrade savepoint reached', NULL, '', 0, 1415061016),
(515, 0, 'repository_alfresco', '2014051200', '2014051200', 'Plugin installed', NULL, '', 0, 1415061016),
(516, 0, 'repository_areafiles', NULL, '2014051200', 'Starting plugin installation', NULL, '', 0, 1415061016),
(517, 0, 'repository_areafiles', '2014051200', '2014051200', 'Upgrade savepoint reached', NULL, '', 0, 1415061016),
(518, 0, 'repository_areafiles', '2014051200', '2014051200', 'Plugin installed', NULL, '', 0, 1415061016),
(519, 0, 'repository_boxnet', NULL, '2014051200', 'Starting plugin installation', NULL, '', 0, 1415061016),
(520, 0, 'repository_boxnet', '2014051200', '2014051200', 'Upgrade savepoint reached', NULL, '', 0, 1415061016),
(521, 0, 'repository_boxnet', '2014051200', '2014051200', 'Plugin installed', NULL, '', 0, 1415061016),
(522, 0, 'repository_coursefiles', NULL, '2014051200', 'Starting plugin installation', NULL, '', 0, 1415061016),
(523, 0, 'repository_coursefiles', '2014051200', '2014051200', 'Upgrade savepoint reached', NULL, '', 0, 1415061016),
(524, 0, 'repository_coursefiles', '2014051200', '2014051200', 'Plugin installed', NULL, '', 0, 1415061016),
(525, 0, 'repository_dropbox', NULL, '2014051200', 'Starting plugin installation', NULL, '', 0, 1415061016),
(526, 0, 'repository_dropbox', '2014051200', '2014051200', 'Upgrade savepoint reached', NULL, '', 0, 1415061016),
(527, 0, 'repository_dropbox', '2014051200', '2014051200', 'Plugin installed', NULL, '', 0, 1415061016),
(528, 0, 'repository_equella', NULL, '2014051200', 'Starting plugin installation', NULL, '', 0, 1415061016),
(529, 0, 'repository_equella', '2014051200', '2014051200', 'Upgrade savepoint reached', NULL, '', 0, 1415061016),
(530, 0, 'repository_equella', '2014051200', '2014051200', 'Plugin installed', NULL, '', 0, 1415061016),
(531, 0, 'repository_filesystem', NULL, '2014051200', 'Starting plugin installation', NULL, '', 0, 1415061016),
(532, 0, 'repository_filesystem', '2014051200', '2014051200', 'Upgrade savepoint reached', NULL, '', 0, 1415061016),
(533, 0, 'repository_filesystem', '2014051200', '2014051200', 'Plugin installed', NULL, '', 0, 1415061016),
(534, 0, 'repository_flickr', NULL, '2014051200', 'Starting plugin installation', NULL, '', 0, 1415061016),
(535, 0, 'repository_flickr', '2014051200', '2014051200', 'Upgrade savepoint reached', NULL, '', 0, 1415061016),
(536, 0, 'repository_flickr', '2014051200', '2014051200', 'Plugin installed', NULL, '', 0, 1415061016),
(537, 0, 'repository_flickr_public', NULL, '2014051200', 'Starting plugin installation', NULL, '', 0, 1415061016),
(538, 0, 'repository_flickr_public', '2014051200', '2014051200', 'Upgrade savepoint reached', NULL, '', 0, 1415061016),
(539, 0, 'repository_flickr_public', '2014051200', '2014051200', 'Plugin installed', NULL, '', 0, 1415061016),
(540, 0, 'repository_googledocs', NULL, '2014051200', 'Starting plugin installation', NULL, '', 0, 1415061016),
(541, 0, 'repository_googledocs', '2014051200', '2014051200', 'Upgrade savepoint reached', NULL, '', 0, 1415061016),
(542, 0, 'repository_googledocs', '2014051200', '2014051200', 'Plugin installed', NULL, '', 0, 1415061016),
(543, 0, 'repository_local', NULL, '2014051200', 'Starting plugin installation', NULL, '', 0, 1415061016),
(544, 0, 'repository_local', '2014051200', '2014051200', 'Upgrade savepoint reached', NULL, '', 0, 1415061016),
(545, 0, 'repository_local', '2014051200', '2014051200', 'Plugin installed', NULL, '', 0, 1415061017),
(546, 0, 'repository_merlot', NULL, '2014051200', 'Starting plugin installation', NULL, '', 0, 1415061017),
(547, 0, 'repository_merlot', '2014051200', '2014051200', 'Upgrade savepoint reached', NULL, '', 0, 1415061017),
(548, 0, 'repository_merlot', '2014051200', '2014051200', 'Plugin installed', NULL, '', 0, 1415061017),
(549, 0, 'repository_picasa', NULL, '2014051200', 'Starting plugin installation', NULL, '', 0, 1415061017),
(550, 0, 'repository_picasa', '2014051200', '2014051200', 'Upgrade savepoint reached', NULL, '', 0, 1415061017),
(551, 0, 'repository_picasa', '2014051200', '2014051200', 'Plugin installed', NULL, '', 0, 1415061017),
(552, 0, 'repository_recent', NULL, '2014051200', 'Starting plugin installation', NULL, '', 0, 1415061017),
(553, 0, 'repository_recent', '2014051200', '2014051200', 'Upgrade savepoint reached', NULL, '', 0, 1415061017),
(554, 0, 'repository_recent', '2014051200', '2014051200', 'Plugin installed', NULL, '', 0, 1415061017),
(555, 0, 'repository_s3', NULL, '2014051200', 'Starting plugin installation', NULL, '', 0, 1415061017),
(556, 0, 'repository_s3', '2014051200', '2014051200', 'Upgrade savepoint reached', NULL, '', 0, 1415061017),
(557, 0, 'repository_s3', '2014051200', '2014051200', 'Plugin installed', NULL, '', 0, 1415061017),
(558, 0, 'repository_skydrive', NULL, '2014051200', 'Starting plugin installation', NULL, '', 0, 1415061017),
(559, 0, 'repository_skydrive', '2014051200', '2014051200', 'Upgrade savepoint reached', NULL, '', 0, 1415061017),
(560, 0, 'repository_skydrive', '2014051200', '2014051200', 'Plugin installed', NULL, '', 0, 1415061017),
(561, 0, 'repository_upload', NULL, '2014051200', 'Starting plugin installation', NULL, '', 0, 1415061017),
(562, 0, 'repository_upload', '2014051200', '2014051200', 'Upgrade savepoint reached', NULL, '', 0, 1415061017),
(563, 0, 'repository_upload', '2014051200', '2014051200', 'Plugin installed', NULL, '', 0, 1415061017),
(564, 0, 'repository_url', NULL, '2014051200', 'Starting plugin installation', NULL, '', 0, 1415061017),
(565, 0, 'repository_url', '2014051200', '2014051200', 'Upgrade savepoint reached', NULL, '', 0, 1415061017),
(566, 0, 'repository_url', '2014051200', '2014051200', 'Plugin installed', NULL, '', 0, 1415061017),
(567, 0, 'repository_user', NULL, '2014051200', 'Starting plugin installation', NULL, '', 0, 1415061018),
(568, 0, 'repository_user', '2014051200', '2014051200', 'Upgrade savepoint reached', NULL, '', 0, 1415061018),
(569, 0, 'repository_user', '2014051200', '2014051200', 'Plugin installed', NULL, '', 0, 1415061018),
(570, 0, 'repository_webdav', NULL, '2014051200', 'Starting plugin installation', NULL, '', 0, 1415061018),
(571, 0, 'repository_webdav', '2014051200', '2014051200', 'Upgrade savepoint reached', NULL, '', 0, 1415061018),
(572, 0, 'repository_webdav', '2014051200', '2014051200', 'Plugin installed', NULL, '', 0, 1415061018),
(573, 0, 'repository_wikimedia', NULL, '2014051200', 'Starting plugin installation', NULL, '', 0, 1415061018),
(574, 0, 'repository_wikimedia', '2014051200', '2014051200', 'Upgrade savepoint reached', NULL, '', 0, 1415061018),
(575, 0, 'repository_wikimedia', '2014051200', '2014051200', 'Plugin installed', NULL, '', 0, 1415061018),
(576, 0, 'repository_youtube', NULL, '2014051200', 'Starting plugin installation', NULL, '', 0, 1415061018),
(577, 0, 'repository_youtube', '2014051200', '2014051200', 'Upgrade savepoint reached', NULL, '', 0, 1415061018),
(578, 0, 'repository_youtube', '2014051200', '2014051200', 'Plugin installed', NULL, '', 0, 1415061018),
(579, 0, 'portfolio_boxnet', NULL, '2014051200', 'Starting plugin installation', NULL, '', 0, 1415061018),
(580, 0, 'portfolio_boxnet', '2014051200', '2014051200', 'Upgrade savepoint reached', NULL, '', 0, 1415061018),
(581, 0, 'portfolio_boxnet', '2014051200', '2014051200', 'Plugin installed', NULL, '', 0, 1415061018),
(582, 0, 'portfolio_download', NULL, '2014051200', 'Starting plugin installation', NULL, '', 0, 1415061018),
(583, 0, 'portfolio_download', '2014051200', '2014051200', 'Upgrade savepoint reached', NULL, '', 0, 1415061018),
(584, 0, 'portfolio_download', '2014051200', '2014051200', 'Plugin installed', NULL, '', 0, 1415061018),
(585, 0, 'portfolio_flickr', NULL, '2014051200', 'Starting plugin installation', NULL, '', 0, 1415061018),
(586, 0, 'portfolio_flickr', '2014051200', '2014051200', 'Upgrade savepoint reached', NULL, '', 0, 1415061018),
(587, 0, 'portfolio_flickr', '2014051200', '2014051200', 'Plugin installed', NULL, '', 0, 1415061018),
(588, 0, 'portfolio_googledocs', NULL, '2014051200', 'Starting plugin installation', NULL, '', 0, 1415061018),
(589, 0, 'portfolio_googledocs', '2014051200', '2014051200', 'Upgrade savepoint reached', NULL, '', 0, 1415061018),
(590, 0, 'portfolio_googledocs', '2014051200', '2014051200', 'Plugin installed', NULL, '', 0, 1415061018),
(591, 0, 'portfolio_mahara', NULL, '2014051200', 'Starting plugin installation', NULL, '', 0, 1415061018),
(592, 0, 'portfolio_mahara', '2014051200', '2014051200', 'Upgrade savepoint reached', NULL, '', 0, 1415061018),
(593, 0, 'portfolio_mahara', '2014051200', '2014051200', 'Plugin installed', NULL, '', 0, 1415061018),
(594, 0, 'portfolio_picasa', NULL, '2014051200', 'Starting plugin installation', NULL, '', 0, 1415061018),
(595, 0, 'portfolio_picasa', '2014051200', '2014051200', 'Upgrade savepoint reached', NULL, '', 0, 1415061019),
(596, 0, 'portfolio_picasa', '2014051200', '2014051200', 'Plugin installed', NULL, '', 0, 1415061019),
(597, 0, 'qbehaviour_adaptive', NULL, '2014051200', 'Starting plugin installation', NULL, '', 0, 1415061019),
(598, 0, 'qbehaviour_adaptive', '2014051200', '2014051200', 'Upgrade savepoint reached', NULL, '', 0, 1415061019),
(599, 0, 'qbehaviour_adaptive', '2014051200', '2014051200', 'Plugin installed', NULL, '', 0, 1415061019),
(600, 0, 'qbehaviour_adaptivenopenalty', NULL, '2014051200', 'Starting plugin installation', NULL, '', 0, 1415061019),
(601, 0, 'qbehaviour_adaptivenopenalty', '2014051200', '2014051200', 'Upgrade savepoint reached', NULL, '', 0, 1415061019),
(602, 0, 'qbehaviour_adaptivenopenalty', '2014051200', '2014051200', 'Plugin installed', NULL, '', 0, 1415061019),
(603, 0, 'qbehaviour_deferredcbm', NULL, '2014051200', 'Starting plugin installation', NULL, '', 0, 1415061019),
(604, 0, 'qbehaviour_deferredcbm', '2014051200', '2014051200', 'Upgrade savepoint reached', NULL, '', 0, 1415061019),
(605, 0, 'qbehaviour_deferredcbm', '2014051200', '2014051200', 'Plugin installed', NULL, '', 0, 1415061019),
(606, 0, 'qbehaviour_deferredfeedback', NULL, '2014051200', 'Starting plugin installation', NULL, '', 0, 1415061019),
(607, 0, 'qbehaviour_deferredfeedback', '2014051200', '2014051200', 'Upgrade savepoint reached', NULL, '', 0, 1415061019),
(608, 0, 'qbehaviour_deferredfeedback', '2014051200', '2014051200', 'Plugin installed', NULL, '', 0, 1415061019),
(609, 0, 'qbehaviour_immediatecbm', NULL, '2014051200', 'Starting plugin installation', NULL, '', 0, 1415061019),
(610, 0, 'qbehaviour_immediatecbm', '2014051200', '2014051200', 'Upgrade savepoint reached', NULL, '', 0, 1415061019),
(611, 0, 'qbehaviour_immediatecbm', '2014051200', '2014051200', 'Plugin installed', NULL, '', 0, 1415061019),
(612, 0, 'qbehaviour_immediatefeedback', NULL, '2014051200', 'Starting plugin installation', NULL, '', 0, 1415061019),
(613, 0, 'qbehaviour_immediatefeedback', '2014051200', '2014051200', 'Upgrade savepoint reached', NULL, '', 0, 1415061019),
(614, 0, 'qbehaviour_immediatefeedback', '2014051200', '2014051200', 'Plugin installed', NULL, '', 0, 1415061019),
(615, 0, 'qbehaviour_informationitem', NULL, '2014051200', 'Starting plugin installation', NULL, '', 0, 1415061019),
(616, 0, 'qbehaviour_informationitem', '2014051200', '2014051200', 'Upgrade savepoint reached', NULL, '', 0, 1415061019),
(617, 0, 'qbehaviour_informationitem', '2014051200', '2014051200', 'Plugin installed', NULL, '', 0, 1415061019),
(618, 0, 'qbehaviour_interactive', NULL, '2014051200', 'Starting plugin installation', NULL, '', 0, 1415061019),
(619, 0, 'qbehaviour_interactive', '2014051200', '2014051200', 'Upgrade savepoint reached', NULL, '', 0, 1415061019),
(620, 0, 'qbehaviour_interactive', '2014051200', '2014051200', 'Plugin installed', NULL, '', 0, 1415061019),
(621, 0, 'qbehaviour_interactivecountback', NULL, '2014051200', 'Starting plugin installation', NULL, '', 0, 1415061019),
(622, 0, 'qbehaviour_interactivecountback', '2014051200', '2014051200', 'Upgrade savepoint reached', NULL, '', 0, 1415061019),
(623, 0, 'qbehaviour_interactivecountback', '2014051200', '2014051200', 'Plugin installed', NULL, '', 0, 1415061019),
(624, 0, 'qbehaviour_manualgraded', NULL, '2014051200', 'Starting plugin installation', NULL, '', 0, 1415061019),
(625, 0, 'qbehaviour_manualgraded', '2014051200', '2014051200', 'Upgrade savepoint reached', NULL, '', 0, 1415061019),
(626, 0, 'qbehaviour_manualgraded', '2014051200', '2014051200', 'Plugin installed', NULL, '', 0, 1415061019),
(627, 0, 'qbehaviour_missing', NULL, '2014051200', 'Starting plugin installation', NULL, '', 0, 1415061019),
(628, 0, 'qbehaviour_missing', '2014051200', '2014051200', 'Upgrade savepoint reached', NULL, '', 0, 1415061019),
(629, 0, 'qbehaviour_missing', '2014051200', '2014051200', 'Plugin installed', NULL, '', 0, 1415061019),
(630, 0, 'qformat_aiken', NULL, '2014051200', 'Starting plugin installation', NULL, '', 0, 1415061019),
(631, 0, 'qformat_aiken', '2014051200', '2014051200', 'Upgrade savepoint reached', NULL, '', 0, 1415061019),
(632, 0, 'qformat_aiken', '2014051200', '2014051200', 'Plugin installed', NULL, '', 0, 1415061019),
(633, 0, 'qformat_blackboard_six', NULL, '2014051200', 'Starting plugin installation', NULL, '', 0, 1415061019),
(634, 0, 'qformat_blackboard_six', '2014051200', '2014051200', 'Upgrade savepoint reached', NULL, '', 0, 1415061019),
(635, 0, 'qformat_blackboard_six', '2014051200', '2014051200', 'Plugin installed', NULL, '', 0, 1415061019),
(636, 0, 'qformat_examview', NULL, '2014051200', 'Starting plugin installation', NULL, '', 0, 1415061019),
(637, 0, 'qformat_examview', '2014051200', '2014051200', 'Upgrade savepoint reached', NULL, '', 0, 1415061019),
(638, 0, 'qformat_examview', '2014051200', '2014051200', 'Plugin installed', NULL, '', 0, 1415061019),
(639, 0, 'qformat_gift', NULL, '2014051200', 'Starting plugin installation', NULL, '', 0, 1415061019),
(640, 0, 'qformat_gift', '2014051200', '2014051200', 'Upgrade savepoint reached', NULL, '', 0, 1415061019),
(641, 0, 'qformat_gift', '2014051200', '2014051200', 'Plugin installed', NULL, '', 0, 1415061019),
(642, 0, 'qformat_learnwise', NULL, '2014051200', 'Starting plugin installation', NULL, '', 0, 1415061019),
(643, 0, 'qformat_learnwise', '2014051200', '2014051200', 'Upgrade savepoint reached', NULL, '', 0, 1415061019),
(644, 0, 'qformat_learnwise', '2014051200', '2014051200', 'Plugin installed', NULL, '', 0, 1415061019),
(645, 0, 'qformat_missingword', NULL, '2014051200', 'Starting plugin installation', NULL, '', 0, 1415061019),
(646, 0, 'qformat_missingword', '2014051200', '2014051200', 'Upgrade savepoint reached', NULL, '', 0, 1415061019),
(647, 0, 'qformat_missingword', '2014051200', '2014051200', 'Plugin installed', NULL, '', 0, 1415061019),
(648, 0, 'qformat_multianswer', NULL, '2014051200', 'Starting plugin installation', NULL, '', 0, 1415061019),
(649, 0, 'qformat_multianswer', '2014051200', '2014051200', 'Upgrade savepoint reached', NULL, '', 0, 1415061019),
(650, 0, 'qformat_multianswer', '2014051200', '2014051200', 'Plugin installed', NULL, '', 0, 1415061019),
(651, 0, 'qformat_webct', NULL, '2014051200', 'Starting plugin installation', NULL, '', 0, 1415061019),
(652, 0, 'qformat_webct', '2014051200', '2014051200', 'Upgrade savepoint reached', NULL, '', 0, 1415061019),
(653, 0, 'qformat_webct', '2014051200', '2014051200', 'Plugin installed', NULL, '', 0, 1415061019),
(654, 0, 'qformat_xhtml', NULL, '2014051200', 'Starting plugin installation', NULL, '', 0, 1415061019),
(655, 0, 'qformat_xhtml', '2014051200', '2014051200', 'Upgrade savepoint reached', NULL, '', 0, 1415061019),
(656, 0, 'qformat_xhtml', '2014051200', '2014051200', 'Plugin installed', NULL, '', 0, 1415061019),
(657, 0, 'qformat_xml', NULL, '2014051200', 'Starting plugin installation', NULL, '', 0, 1415061019),
(658, 0, 'qformat_xml', '2014051200', '2014051200', 'Upgrade savepoint reached', NULL, '', 0, 1415061019),
(659, 0, 'qformat_xml', '2014051200', '2014051200', 'Plugin installed', NULL, '', 0, 1415061019),
(660, 0, 'tool_assignmentupgrade', NULL, '2014051200', 'Starting plugin installation', NULL, '', 0, 1415061020),
(661, 0, 'tool_assignmentupgrade', '2014051200', '2014051200', 'Upgrade savepoint reached', NULL, '', 0, 1415061020),
(662, 0, 'tool_assignmentupgrade', '2014051200', '2014051200', 'Plugin installed', NULL, '', 0, 1415061020),
(663, 0, 'tool_availabilityconditions', NULL, '2014051200', 'Starting plugin installation', NULL, '', 0, 1415061020),
(664, 0, 'tool_availabilityconditions', '2014051200', '2014051200', 'Upgrade savepoint reached', NULL, '', 0, 1415061020),
(665, 0, 'tool_availabilityconditions', '2014051200', '2014051200', 'Plugin installed', NULL, '', 0, 1415061020),
(666, 0, 'tool_behat', NULL, '2014051200', 'Starting plugin installation', NULL, '', 0, 1415061020),
(667, 0, 'tool_behat', '2014051200', '2014051200', 'Upgrade savepoint reached', NULL, '', 0, 1415061020),
(668, 0, 'tool_behat', '2014051200', '2014051200', 'Plugin installed', NULL, '', 0, 1415061020),
(669, 0, 'tool_capability', NULL, '2014051200', 'Starting plugin installation', NULL, '', 0, 1415061020),
(670, 0, 'tool_capability', '2014051200', '2014051200', 'Upgrade savepoint reached', NULL, '', 0, 1415061020),
(671, 0, 'tool_capability', '2014051200', '2014051200', 'Plugin installed', NULL, '', 0, 1415061020),
(672, 0, 'tool_customlang', NULL, '2014051200', 'Starting plugin installation', NULL, '', 0, 1415061020),
(673, 0, 'tool_customlang', '2014051200', '2014051200', 'Upgrade savepoint reached', NULL, '', 0, 1415061021),
(674, 0, 'tool_customlang', '2014051200', '2014051200', 'Plugin installed', NULL, '', 0, 1415061021),
(675, 0, 'tool_dbtransfer', NULL, '2014051200', 'Starting plugin installation', NULL, '', 0, 1415061021),
(676, 0, 'tool_dbtransfer', '2014051200', '2014051200', 'Upgrade savepoint reached', NULL, '', 0, 1415061021),
(677, 0, 'tool_dbtransfer', '2014051200', '2014051200', 'Plugin installed', NULL, '', 0, 1415061021),
(678, 0, 'tool_generator', NULL, '2014051200', 'Starting plugin installation', NULL, '', 0, 1415061021),
(679, 0, 'tool_generator', '2014051200', '2014051200', 'Upgrade savepoint reached', NULL, '', 0, 1415061021),
(680, 0, 'tool_generator', '2014051200', '2014051200', 'Plugin installed', NULL, '', 0, 1415061021),
(681, 0, 'tool_health', NULL, '2014051200', 'Starting plugin installation', NULL, '', 0, 1415061021),
(682, 0, 'tool_health', '2014051200', '2014051200', 'Upgrade savepoint reached', NULL, '', 0, 1415061021),
(683, 0, 'tool_health', '2014051200', '2014051200', 'Plugin installed', NULL, '', 0, 1415061021),
(684, 0, 'tool_innodb', NULL, '2014051200', 'Starting plugin installation', NULL, '', 0, 1415061021),
(685, 0, 'tool_innodb', '2014051200', '2014051200', 'Upgrade savepoint reached', NULL, '', 0, 1415061021),
(686, 0, 'tool_innodb', '2014051200', '2014051200', 'Plugin installed', NULL, '', 0, 1415061021),
(687, 0, 'tool_installaddon', NULL, '2014051200', 'Starting plugin installation', NULL, '', 0, 1415061021),
(688, 0, 'tool_installaddon', '2014051200', '2014051200', 'Upgrade savepoint reached', NULL, '', 0, 1415061021),
(689, 0, 'tool_installaddon', '2014051200', '2014051200', 'Plugin installed', NULL, '', 0, 1415061021),
(690, 0, 'tool_langimport', NULL, '2014051200', 'Starting plugin installation', NULL, '', 0, 1415061021),
(691, 0, 'tool_langimport', '2014051200', '2014051200', 'Upgrade savepoint reached', NULL, '', 0, 1415061021),
(692, 0, 'tool_langimport', '2014051200', '2014051200', 'Plugin installed', NULL, '', 0, 1415061021),
(693, 0, 'tool_log', NULL, '2014051200', 'Starting plugin installation', NULL, '', 0, 1415061021),
(694, 0, 'tool_log', '2014051200', '2014051200', 'Upgrade savepoint reached', NULL, '', 0, 1415061021),
(695, 0, 'tool_log', '2014051200', '2014051200', 'Plugin installed', NULL, '', 0, 1415061021),
(696, 0, 'tool_multilangupgrade', NULL, '2014051200', 'Starting plugin installation', NULL, '', 0, 1415061021),
(697, 0, 'tool_multilangupgrade', '2014051200', '2014051200', 'Upgrade savepoint reached', NULL, '', 0, 1415061021),
(698, 0, 'tool_multilangupgrade', '2014051200', '2014051200', 'Plugin installed', NULL, '', 0, 1415061021),
(699, 0, 'tool_phpunit', NULL, '2014051200', 'Starting plugin installation', NULL, '', 0, 1415061021),
(700, 0, 'tool_phpunit', '2014051200', '2014051200', 'Upgrade savepoint reached', NULL, '', 0, 1415061021),
(701, 0, 'tool_phpunit', '2014051200', '2014051200', 'Plugin installed', NULL, '', 0, 1415061021),
(702, 0, 'tool_profiling', NULL, '2014051200', 'Starting plugin installation', NULL, '', 0, 1415061021),
(703, 0, 'tool_profiling', '2014051200', '2014051200', 'Upgrade savepoint reached', NULL, '', 0, 1415061021),
(704, 0, 'tool_profiling', '2014051200', '2014051200', 'Plugin installed', NULL, '', 0, 1415061021),
(705, 0, 'tool_replace', NULL, '2014051200', 'Starting plugin installation', NULL, '', 0, 1415061021),
(706, 0, 'tool_replace', '2014051200', '2014051200', 'Upgrade savepoint reached', NULL, '', 0, 1415061021),
(707, 0, 'tool_replace', '2014051200', '2014051200', 'Plugin installed', NULL, '', 0, 1415061021),
(708, 0, 'tool_spamcleaner', NULL, '2014051200', 'Starting plugin installation', NULL, '', 0, 1415061021),
(709, 0, 'tool_spamcleaner', '2014051200', '2014051200', 'Upgrade savepoint reached', NULL, '', 0, 1415061021),
(710, 0, 'tool_spamcleaner', '2014051200', '2014051200', 'Plugin installed', NULL, '', 0, 1415061021),
(711, 0, 'tool_task', NULL, '2014051200', 'Starting plugin installation', NULL, '', 0, 1415061021),
(712, 0, 'tool_task', '2014051200', '2014051200', 'Upgrade savepoint reached', NULL, '', 0, 1415061021),
(713, 0, 'tool_task', '2014051200', '2014051200', 'Plugin installed', NULL, '', 0, 1415061021),
(714, 0, 'tool_timezoneimport', NULL, '2014051200', 'Starting plugin installation', NULL, '', 0, 1415061021),
(715, 0, 'tool_timezoneimport', '2014051200', '2014051200', 'Upgrade savepoint reached', NULL, '', 0, 1415061021),
(716, 0, 'tool_timezoneimport', '2014051200', '2014051200', 'Plugin installed', NULL, '', 0, 1415061021),
(717, 0, 'tool_unsuproles', NULL, '2014051200', 'Starting plugin installation', NULL, '', 0, 1415061021),
(718, 0, 'tool_unsuproles', '2014051200', '2014051200', 'Upgrade savepoint reached', NULL, '', 0, 1415061021),
(719, 0, 'tool_unsuproles', '2014051200', '2014051200', 'Plugin installed', NULL, '', 0, 1415061021),
(720, 0, 'tool_uploadcourse', NULL, '2014051200', 'Starting plugin installation', NULL, '', 0, 1415061021),
(721, 0, 'tool_uploadcourse', '2014051200', '2014051200', 'Upgrade savepoint reached', NULL, '', 0, 1415061021),
(722, 0, 'tool_uploadcourse', '2014051200', '2014051200', 'Plugin installed', NULL, '', 0, 1415061021),
(723, 0, 'tool_uploaduser', NULL, '2014051200', 'Starting plugin installation', NULL, '', 0, 1415061022),
(724, 0, 'tool_uploaduser', '2014051200', '2014051200', 'Upgrade savepoint reached', NULL, '', 0, 1415061022),
(725, 0, 'tool_uploaduser', '2014051200', '2014051200', 'Plugin installed', NULL, '', 0, 1415061022),
(726, 0, 'tool_xmldb', NULL, '2014051200', 'Starting plugin installation', NULL, '', 0, 1415061022),
(727, 0, 'tool_xmldb', '2014051200', '2014051200', 'Upgrade savepoint reached', NULL, '', 0, 1415061022),
(728, 0, 'tool_xmldb', '2014051200', '2014051200', 'Plugin installed', NULL, '', 0, 1415061022),
(729, 0, 'cachestore_file', NULL, '2014051200', 'Starting plugin installation', NULL, '', 0, 1415061022),
(730, 0, 'cachestore_file', '2014051200', '2014051200', 'Upgrade savepoint reached', NULL, '', 0, 1415061022),
(731, 0, 'cachestore_file', '2014051200', '2014051200', 'Plugin installed', NULL, '', 0, 1415061022),
(732, 0, 'cachestore_memcache', NULL, '2014051200', 'Starting plugin installation', NULL, '', 0, 1415061022),
(733, 0, 'cachestore_memcache', '2014051200', '2014051200', 'Upgrade savepoint reached', NULL, '', 0, 1415061022),
(734, 0, 'cachestore_memcache', '2014051200', '2014051200', 'Plugin installed', NULL, '', 0, 1415061022),
(735, 0, 'cachestore_memcached', NULL, '2014051200', 'Starting plugin installation', NULL, '', 0, 1415061022),
(736, 0, 'cachestore_memcached', '2014051200', '2014051200', 'Upgrade savepoint reached', NULL, '', 0, 1415061022),
(737, 0, 'cachestore_memcached', '2014051200', '2014051200', 'Plugin installed', NULL, '', 0, 1415061022),
(738, 0, 'cachestore_mongodb', NULL, '2014051200', 'Starting plugin installation', NULL, '', 0, 1415061022),
(739, 0, 'cachestore_mongodb', '2014051200', '2014051200', 'Upgrade savepoint reached', NULL, '', 0, 1415061022),
(740, 0, 'cachestore_mongodb', '2014051200', '2014051200', 'Plugin installed', NULL, '', 0, 1415061022),
(741, 0, 'cachestore_session', NULL, '2014051200', 'Starting plugin installation', NULL, '', 0, 1415061022),
(742, 0, 'cachestore_session', '2014051200', '2014051200', 'Upgrade savepoint reached', NULL, '', 0, 1415061022),
(743, 0, 'cachestore_session', '2014051200', '2014051200', 'Plugin installed', NULL, '', 0, 1415061022),
(744, 0, 'cachestore_static', NULL, '2014051200', 'Starting plugin installation', NULL, '', 0, 1415061022),
(745, 0, 'cachestore_static', '2014051200', '2014051200', 'Upgrade savepoint reached', NULL, '', 0, 1415061022),
(746, 0, 'cachestore_static', '2014051200', '2014051200', 'Plugin installed', NULL, '', 0, 1415061022),
(747, 0, 'cachelock_file', NULL, '2014051200', 'Starting plugin installation', NULL, '', 0, 1415061022),
(748, 0, 'cachelock_file', '2014051200', '2014051200', 'Upgrade savepoint reached', NULL, '', 0, 1415061022),
(749, 0, 'cachelock_file', '2014051200', '2014051200', 'Plugin installed', NULL, '', 0, 1415061022),
(750, 0, 'theme_base', NULL, '2014051200', 'Starting plugin installation', NULL, '', 0, 1415061022),
(751, 0, 'theme_base', '2014051200', '2014051200', 'Upgrade savepoint reached', NULL, '', 0, 1415061022),
(752, 0, 'theme_base', '2014051200', '2014051200', 'Plugin installed', NULL, '', 0, 1415061022),
(753, 0, 'theme_bootstrapbase', NULL, '2014051200', 'Starting plugin installation', NULL, '', 0, 1415061022),
(754, 0, 'theme_bootstrapbase', '2014051200', '2014051200', 'Upgrade savepoint reached', NULL, '', 0, 1415061022),
(755, 0, 'theme_bootstrapbase', '2014051200', '2014051200', 'Plugin installed', NULL, '', 0, 1415061022),
(756, 0, 'theme_canvas', NULL, '2014051200', 'Starting plugin installation', NULL, '', 0, 1415061022),
(757, 0, 'theme_canvas', '2014051200', '2014051200', 'Upgrade savepoint reached', NULL, '', 0, 1415061022),
(758, 0, 'theme_canvas', '2014051200', '2014051200', 'Plugin installed', NULL, '', 0, 1415061022),
(759, 0, 'theme_clean', NULL, '2014051200', 'Starting plugin installation', NULL, '', 0, 1415061022),
(760, 0, 'theme_clean', '2014051200', '2014051200', 'Upgrade savepoint reached', NULL, '', 0, 1415061022),
(761, 0, 'theme_clean', '2014051200', '2014051200', 'Plugin installed', NULL, '', 0, 1415061022),
(762, 0, 'theme_more', NULL, '2014051200', 'Starting plugin installation', NULL, '', 0, 1415061022),
(763, 0, 'theme_more', '2014051200', '2014051200', 'Upgrade savepoint reached', NULL, '', 0, 1415061022),
(764, 0, 'theme_more', '2014051200', '2014051200', 'Plugin installed', NULL, '', 0, 1415061022),
(765, 0, 'assignsubmission_comments', NULL, '2014051200', 'Starting plugin installation', NULL, '', 0, 1415061022),
(766, 0, 'assignsubmission_comments', '2014051200', '2014051200', 'Upgrade savepoint reached', NULL, '', 0, 1415061022),
(767, 0, 'assignsubmission_comments', '2014051200', '2014051200', 'Plugin installed', NULL, '', 0, 1415061023),
(768, 0, 'assignsubmission_file', NULL, '2014051200', 'Starting plugin installation', NULL, '', 0, 1415061023),
(769, 0, 'assignsubmission_file', '2014051200', '2014051200', 'Upgrade savepoint reached', NULL, '', 0, 1415061023),
(770, 0, 'assignsubmission_file', '2014051200', '2014051200', 'Plugin installed', NULL, '', 0, 1415061023),
(771, 0, 'assignsubmission_onlinetext', NULL, '2014051200', 'Starting plugin installation', NULL, '', 0, 1415061023),
(772, 0, 'assignsubmission_onlinetext', '2014051200', '2014051200', 'Upgrade savepoint reached', NULL, '', 0, 1415061023),
(773, 0, 'assignsubmission_onlinetext', '2014051200', '2014051200', 'Plugin installed', NULL, '', 0, 1415061023),
(774, 0, 'assignfeedback_comments', NULL, '2014051200', 'Starting plugin installation', NULL, '', 0, 1415061023),
(775, 0, 'assignfeedback_comments', '2014051200', '2014051200', 'Upgrade savepoint reached', NULL, '', 0, 1415061024),
(776, 0, 'assignfeedback_comments', '2014051200', '2014051200', 'Plugin installed', NULL, '', 0, 1415061024),
(777, 0, 'assignfeedback_editpdf', NULL, '2014051200', 'Starting plugin installation', NULL, '', 0, 1415061024),
(778, 0, 'assignfeedback_editpdf', '2014051200', '2014051200', 'Upgrade savepoint reached', NULL, '', 0, 1415061024),
(779, 0, 'assignfeedback_editpdf', '2014051200', '2014051200', 'Plugin installed', NULL, '', 0, 1415061024),
(780, 0, 'assignfeedback_file', NULL, '2014051200', 'Starting plugin installation', NULL, '', 0, 1415061024),
(781, 0, 'assignfeedback_file', '2014051200', '2014051200', 'Upgrade savepoint reached', NULL, '', 0, 1415061025),
(782, 0, 'assignfeedback_file', '2014051200', '2014051200', 'Plugin installed', NULL, '', 0, 1415061025),
(783, 0, 'assignfeedback_offline', NULL, '2014051200', 'Starting plugin installation', NULL, '', 0, 1415061025),
(784, 0, 'assignfeedback_offline', '2014051200', '2014051200', 'Upgrade savepoint reached', NULL, '', 0, 1415061025),
(785, 0, 'assignfeedback_offline', '2014051200', '2014051200', 'Plugin installed', NULL, '', 0, 1415061025),
(786, 0, 'assignment_offline', NULL, '2014051200', 'Starting plugin installation', NULL, '', 0, 1415061025),
(787, 0, 'assignment_offline', '2014051200', '2014051200', 'Upgrade savepoint reached', NULL, '', 0, 1415061025),
(788, 0, 'assignment_offline', '2014051200', '2014051200', 'Plugin installed', NULL, '', 0, 1415061025),
(789, 0, 'assignment_online', NULL, '2014051200', 'Starting plugin installation', NULL, '', 0, 1415061025),
(790, 0, 'assignment_online', '2014051200', '2014051200', 'Upgrade savepoint reached', NULL, '', 0, 1415061025),
(791, 0, 'assignment_online', '2014051200', '2014051200', 'Plugin installed', NULL, '', 0, 1415061025),
(792, 0, 'assignment_upload', NULL, '2014051200', 'Starting plugin installation', NULL, '', 0, 1415061025),
(793, 0, 'assignment_upload', '2014051200', '2014051200', 'Upgrade savepoint reached', NULL, '', 0, 1415061025),
(794, 0, 'assignment_upload', '2014051200', '2014051200', 'Plugin installed', NULL, '', 0, 1415061025),
(795, 0, 'assignment_uploadsingle', NULL, '2014051200', 'Starting plugin installation', NULL, '', 0, 1415061025),
(796, 0, 'assignment_uploadsingle', '2014051200', '2014051200', 'Upgrade savepoint reached', NULL, '', 0, 1415061025),
(797, 0, 'assignment_uploadsingle', '2014051200', '2014051200', 'Plugin installed', NULL, '', 0, 1415061025),
(798, 0, 'booktool_exportimscp', NULL, '2014051200', 'Starting plugin installation', NULL, '', 0, 1415061025),
(799, 0, 'booktool_exportimscp', '2014051200', '2014051200', 'Upgrade savepoint reached', NULL, '', 0, 1415061025),
(800, 0, 'booktool_exportimscp', '2014051200', '2014051200', 'Plugin installed', NULL, '', 0, 1415061025),
(801, 0, 'booktool_importhtml', NULL, '2014051200', 'Starting plugin installation', NULL, '', 0, 1415061025),
(802, 0, 'booktool_importhtml', '2014051200', '2014051200', 'Upgrade savepoint reached', NULL, '', 0, 1415061025),
(803, 0, 'booktool_importhtml', '2014051200', '2014051200', 'Plugin installed', NULL, '', 0, 1415061025),
(804, 0, 'booktool_print', NULL, '2014051200', 'Starting plugin installation', NULL, '', 0, 1415061025),
(805, 0, 'booktool_print', '2014051200', '2014051200', 'Upgrade savepoint reached', NULL, '', 0, 1415061025),
(806, 0, 'booktool_print', '2014051200', '2014051200', 'Plugin installed', NULL, '', 0, 1415061025),
(807, 0, 'datafield_checkbox', NULL, '2014051200', 'Starting plugin installation', NULL, '', 0, 1415061025),
(808, 0, 'datafield_checkbox', '2014051200', '2014051200', 'Upgrade savepoint reached', NULL, '', 0, 1415061025),
(809, 0, 'datafield_checkbox', '2014051200', '2014051200', 'Plugin installed', NULL, '', 0, 1415061025),
(810, 0, 'datafield_date', NULL, '2014051200', 'Starting plugin installation', NULL, '', 0, 1415061025),
(811, 0, 'datafield_date', '2014051200', '2014051200', 'Upgrade savepoint reached', NULL, '', 0, 1415061025),
(812, 0, 'datafield_date', '2014051200', '2014051200', 'Plugin installed', NULL, '', 0, 1415061025),
(813, 0, 'datafield_file', NULL, '2014051200', 'Starting plugin installation', NULL, '', 0, 1415061025),
(814, 0, 'datafield_file', '2014051200', '2014051200', 'Upgrade savepoint reached', NULL, '', 0, 1415061025),
(815, 0, 'datafield_file', '2014051200', '2014051200', 'Plugin installed', NULL, '', 0, 1415061025),
(816, 0, 'datafield_latlong', NULL, '2014051200', 'Starting plugin installation', NULL, '', 0, 1415061025),
(817, 0, 'datafield_latlong', '2014051200', '2014051200', 'Upgrade savepoint reached', NULL, '', 0, 1415061025),
(818, 0, 'datafield_latlong', '2014051200', '2014051200', 'Plugin installed', NULL, '', 0, 1415061025),
(819, 0, 'datafield_menu', NULL, '2014051200', 'Starting plugin installation', NULL, '', 0, 1415061025),
(820, 0, 'datafield_menu', '2014051200', '2014051200', 'Upgrade savepoint reached', NULL, '', 0, 1415061025),
(821, 0, 'datafield_menu', '2014051200', '2014051200', 'Plugin installed', NULL, '', 0, 1415061026),
(822, 0, 'datafield_multimenu', NULL, '2014051200', 'Starting plugin installation', NULL, '', 0, 1415061026),
(823, 0, 'datafield_multimenu', '2014051200', '2014051200', 'Upgrade savepoint reached', NULL, '', 0, 1415061026),
(824, 0, 'datafield_multimenu', '2014051200', '2014051200', 'Plugin installed', NULL, '', 0, 1415061026),
(825, 0, 'datafield_number', NULL, '2014051200', 'Starting plugin installation', NULL, '', 0, 1415061026),
(826, 0, 'datafield_number', '2014051200', '2014051200', 'Upgrade savepoint reached', NULL, '', 0, 1415061026),
(827, 0, 'datafield_number', '2014051200', '2014051200', 'Plugin installed', NULL, '', 0, 1415061026),
(828, 0, 'datafield_picture', NULL, '2014051200', 'Starting plugin installation', NULL, '', 0, 1415061026),
(829, 0, 'datafield_picture', '2014051200', '2014051200', 'Upgrade savepoint reached', NULL, '', 0, 1415061026),
(830, 0, 'datafield_picture', '2014051200', '2014051200', 'Plugin installed', NULL, '', 0, 1415061026),
(831, 0, 'datafield_radiobutton', NULL, '2014051200', 'Starting plugin installation', NULL, '', 0, 1415061026),
(832, 0, 'datafield_radiobutton', '2014051200', '2014051200', 'Upgrade savepoint reached', NULL, '', 0, 1415061026),
(833, 0, 'datafield_radiobutton', '2014051200', '2014051200', 'Plugin installed', NULL, '', 0, 1415061026),
(834, 0, 'datafield_text', NULL, '2014051200', 'Starting plugin installation', NULL, '', 0, 1415061026),
(835, 0, 'datafield_text', '2014051200', '2014051200', 'Upgrade savepoint reached', NULL, '', 0, 1415061026),
(836, 0, 'datafield_text', '2014051200', '2014051200', 'Plugin installed', NULL, '', 0, 1415061026),
(837, 0, 'datafield_textarea', NULL, '2014051200', 'Starting plugin installation', NULL, '', 0, 1415061026),
(838, 0, 'datafield_textarea', '2014051200', '2014051200', 'Upgrade savepoint reached', NULL, '', 0, 1415061026),
(839, 0, 'datafield_textarea', '2014051200', '2014051200', 'Plugin installed', NULL, '', 0, 1415061026),
(840, 0, 'datafield_url', NULL, '2014051200', 'Starting plugin installation', NULL, '', 0, 1415061026),
(841, 0, 'datafield_url', '2014051200', '2014051200', 'Upgrade savepoint reached', NULL, '', 0, 1415061026),
(842, 0, 'datafield_url', '2014051200', '2014051200', 'Plugin installed', NULL, '', 0, 1415061026),
(843, 0, 'datapreset_imagegallery', NULL, '2014051200', 'Starting plugin installation', NULL, '', 0, 1415061026),
(844, 0, 'datapreset_imagegallery', '2014051200', '2014051200', 'Upgrade savepoint reached', NULL, '', 0, 1415061026),
(845, 0, 'datapreset_imagegallery', '2014051200', '2014051200', 'Plugin installed', NULL, '', 0, 1415061026),
(846, 0, 'quiz_grading', NULL, '2014051200', 'Starting plugin installation', NULL, '', 0, 1415061026),
(847, 0, 'quiz_grading', '2014051200', '2014051200', 'Upgrade savepoint reached', NULL, '', 0, 1415061026),
(848, 0, 'quiz_grading', '2014051200', '2014051200', 'Plugin installed', NULL, '', 0, 1415061027),
(849, 0, 'quiz_overview', NULL, '2014051200', 'Starting plugin installation', NULL, '', 0, 1415061027),
(850, 0, 'quiz_overview', '2014051200', '2014051200', 'Upgrade savepoint reached', NULL, '', 0, 1415061027),
(851, 0, 'quiz_overview', '2014051200', '2014051200', 'Plugin installed', NULL, '', 0, 1415061027),
(852, 0, 'quiz_responses', NULL, '2014051200', 'Starting plugin installation', NULL, '', 0, 1415061027),
(853, 0, 'quiz_responses', '2014051200', '2014051200', 'Upgrade savepoint reached', NULL, '', 0, 1415061027),
(854, 0, 'quiz_responses', '2014051200', '2014051200', 'Plugin installed', NULL, '', 0, 1415061027),
(855, 0, 'quiz_statistics', NULL, '2014051200', 'Starting plugin installation', NULL, '', 0, 1415061027),
(856, 0, 'quiz_statistics', '2014051200', '2014051200', 'Upgrade savepoint reached', NULL, '', 0, 1415061027),
(857, 0, 'quiz_statistics', '2014051200', '2014051200', 'Plugin installed', NULL, '', 0, 1415061028),
(858, 0, 'quizaccess_delaybetweenattempts', NULL, '2014051200', 'Starting plugin installation', NULL, '', 0, 1415061028),
(859, 0, 'quizaccess_delaybetweenattempts', '2014051200', '2014051200', 'Upgrade savepoint reached', NULL, '', 0, 1415061028),
(860, 0, 'quizaccess_delaybetweenattempts', '2014051200', '2014051200', 'Plugin installed', NULL, '', 0, 1415061028),
(861, 0, 'quizaccess_ipaddress', NULL, '2014051200', 'Starting plugin installation', NULL, '', 0, 1415061028),
(862, 0, 'quizaccess_ipaddress', '2014051200', '2014051200', 'Upgrade savepoint reached', NULL, '', 0, 1415061028),
(863, 0, 'quizaccess_ipaddress', '2014051200', '2014051200', 'Plugin installed', NULL, '', 0, 1415061028),
(864, 0, 'quizaccess_numattempts', NULL, '2014051200', 'Starting plugin installation', NULL, '', 0, 1415061028),
(865, 0, 'quizaccess_numattempts', '2014051200', '2014051200', 'Upgrade savepoint reached', NULL, '', 0, 1415061028),
(866, 0, 'quizaccess_numattempts', '2014051200', '2014051200', 'Plugin installed', NULL, '', 0, 1415061028),
(867, 0, 'quizaccess_openclosedate', NULL, '2014051200', 'Starting plugin installation', NULL, '', 0, 1415061028),
(868, 0, 'quizaccess_openclosedate', '2014051200', '2014051200', 'Upgrade savepoint reached', NULL, '', 0, 1415061028),
(869, 0, 'quizaccess_openclosedate', '2014051200', '2014051200', 'Plugin installed', NULL, '', 0, 1415061028),
(870, 0, 'quizaccess_password', NULL, '2014051200', 'Starting plugin installation', NULL, '', 0, 1415061028),
(871, 0, 'quizaccess_password', '2014051200', '2014051200', 'Upgrade savepoint reached', NULL, '', 0, 1415061028),
(872, 0, 'quizaccess_password', '2014051200', '2014051200', 'Plugin installed', NULL, '', 0, 1415061028),
(873, 0, 'quizaccess_safebrowser', NULL, '2014051200', 'Starting plugin installation', NULL, '', 0, 1415061028),
(874, 0, 'quizaccess_safebrowser', '2014051200', '2014051200', 'Upgrade savepoint reached', NULL, '', 0, 1415061028),
(875, 0, 'quizaccess_safebrowser', '2014051200', '2014051200', 'Plugin installed', NULL, '', 0, 1415061028),
(876, 0, 'quizaccess_securewindow', NULL, '2014051200', 'Starting plugin installation', NULL, '', 0, 1415061028),
(877, 0, 'quizaccess_securewindow', '2014051200', '2014051200', 'Upgrade savepoint reached', NULL, '', 0, 1415061028),
(878, 0, 'quizaccess_securewindow', '2014051200', '2014051200', 'Plugin installed', NULL, '', 0, 1415061028),
(879, 0, 'quizaccess_timelimit', NULL, '2014051200', 'Starting plugin installation', NULL, '', 0, 1415061028),
(880, 0, 'quizaccess_timelimit', '2014051200', '2014051200', 'Upgrade savepoint reached', NULL, '', 0, 1415061028),
(881, 0, 'quizaccess_timelimit', '2014051200', '2014051200', 'Plugin installed', NULL, '', 0, 1415061028),
(882, 0, 'scormreport_basic', NULL, '2014051200', 'Starting plugin installation', NULL, '', 0, 1415061028),
(883, 0, 'scormreport_basic', '2014051200', '2014051200', 'Upgrade savepoint reached', NULL, '', 0, 1415061028),
(884, 0, 'scormreport_basic', '2014051200', '2014051200', 'Plugin installed', NULL, '', 0, 1415061028),
(885, 0, 'scormreport_graphs', NULL, '2014051200', 'Starting plugin installation', NULL, '', 0, 1415061028),
(886, 0, 'scormreport_graphs', '2014051200', '2014051200', 'Upgrade savepoint reached', NULL, '', 0, 1415061028),
(887, 0, 'scormreport_graphs', '2014051200', '2014051200', 'Plugin installed', NULL, '', 0, 1415061028),
(888, 0, 'scormreport_interactions', NULL, '2014051200', 'Starting plugin installation', NULL, '', 0, 1415061028),
(889, 0, 'scormreport_interactions', '2014051200', '2014051200', 'Upgrade savepoint reached', NULL, '', 0, 1415061028),
(890, 0, 'scormreport_interactions', '2014051200', '2014051200', 'Plugin installed', NULL, '', 0, 1415061028),
(891, 0, 'scormreport_objectives', NULL, '2014051200', 'Starting plugin installation', NULL, '', 0, 1415061028),
(892, 0, 'scormreport_objectives', '2014051200', '2014051200', 'Upgrade savepoint reached', NULL, '', 0, 1415061028),
(893, 0, 'scormreport_objectives', '2014051200', '2014051200', 'Plugin installed', NULL, '', 0, 1415061028),
(894, 0, 'workshopform_accumulative', NULL, '2014051200', 'Starting plugin installation', NULL, '', 0, 1415061028),
(895, 0, 'workshopform_accumulative', '2014051200', '2014051200', 'Upgrade savepoint reached', NULL, '', 0, 1415061029),
(896, 0, 'workshopform_accumulative', '2014051200', '2014051200', 'Plugin installed', NULL, '', 0, 1415061029),
(897, 0, 'workshopform_comments', NULL, '2014051200', 'Starting plugin installation', NULL, '', 0, 1415061029),
(898, 0, 'workshopform_comments', '2014051200', '2014051200', 'Upgrade savepoint reached', NULL, '', 0, 1415061029),
(899, 0, 'workshopform_comments', '2014051200', '2014051200', 'Plugin installed', NULL, '', 0, 1415061029),
(900, 0, 'workshopform_numerrors', NULL, '2014051200', 'Starting plugin installation', NULL, '', 0, 1415061029),
(901, 0, 'workshopform_numerrors', '2014051200', '2014051200', 'Upgrade savepoint reached', NULL, '', 0, 1415061029),
(902, 0, 'workshopform_numerrors', '2014051200', '2014051200', 'Plugin installed', NULL, '', 0, 1415061029),
(903, 0, 'workshopform_rubric', NULL, '2014051200', 'Starting plugin installation', NULL, '', 0, 1415061029),
(904, 0, 'workshopform_rubric', '2014051200', '2014051200', 'Upgrade savepoint reached', NULL, '', 0, 1415061030),
(905, 0, 'workshopform_rubric', '2014051200', '2014051200', 'Plugin installed', NULL, '', 0, 1415061030),
(906, 0, 'workshopallocation_manual', NULL, '2014051200', 'Starting plugin installation', NULL, '', 0, 1415061030),
(907, 0, 'workshopallocation_manual', '2014051200', '2014051200', 'Upgrade savepoint reached', NULL, '', 0, 1415061030),
(908, 0, 'workshopallocation_manual', '2014051200', '2014051200', 'Plugin installed', NULL, '', 0, 1415061030),
(909, 0, 'workshopallocation_random', NULL, '2014051200', 'Starting plugin installation', NULL, '', 0, 1415061030),
(910, 0, 'workshopallocation_random', '2014051200', '2014051200', 'Upgrade savepoint reached', NULL, '', 0, 1415061030),
(911, 0, 'workshopallocation_random', '2014051200', '2014051200', 'Plugin installed', NULL, '', 0, 1415061030),
(912, 0, 'workshopallocation_scheduled', NULL, '2014051200', 'Starting plugin installation', NULL, '', 0, 1415061030),
(913, 0, 'workshopallocation_scheduled', '2014051200', '2014051200', 'Upgrade savepoint reached', NULL, '', 0, 1415061030),
(914, 0, 'workshopallocation_scheduled', '2014051200', '2014051200', 'Plugin installed', NULL, '', 0, 1415061031),
(915, 0, 'workshopeval_best', NULL, '2014051200', 'Starting plugin installation', NULL, '', 0, 1415061031),
(916, 0, 'workshopeval_best', '2014051200', '2014051200', 'Upgrade savepoint reached', NULL, '', 0, 1415061031),
(917, 0, 'workshopeval_best', '2014051200', '2014051200', 'Plugin installed', NULL, '', 0, 1415061031),
(918, 0, 'atto_accessibilitychecker', NULL, '2014051200', 'Starting plugin installation', NULL, '', 0, 1415061031),
(919, 0, 'atto_accessibilitychecker', '2014051200', '2014051200', 'Upgrade savepoint reached', NULL, '', 0, 1415061031),
(920, 0, 'atto_accessibilitychecker', '2014051200', '2014051200', 'Plugin installed', NULL, '', 0, 1415061031),
(921, 0, 'atto_accessibilityhelper', NULL, '2014051200', 'Starting plugin installation', NULL, '', 0, 1415061031),
(922, 0, 'atto_accessibilityhelper', '2014051200', '2014051200', 'Upgrade savepoint reached', NULL, '', 0, 1415061031),
(923, 0, 'atto_accessibilityhelper', '2014051200', '2014051200', 'Plugin installed', NULL, '', 0, 1415061031),
(924, 0, 'atto_align', NULL, '2014051200', 'Starting plugin installation', NULL, '', 0, 1415061031),
(925, 0, 'atto_align', '2014051200', '2014051200', 'Upgrade savepoint reached', NULL, '', 0, 1415061031),
(926, 0, 'atto_align', '2014051200', '2014051200', 'Plugin installed', NULL, '', 0, 1415061031),
(927, 0, 'atto_backcolor', NULL, '2014051200', 'Starting plugin installation', NULL, '', 0, 1415061031),
(928, 0, 'atto_backcolor', '2014051200', '2014051200', 'Upgrade savepoint reached', NULL, '', 0, 1415061031),
(929, 0, 'atto_backcolor', '2014051200', '2014051200', 'Plugin installed', NULL, '', 0, 1415061031),
(930, 0, 'atto_bold', NULL, '2014051200', 'Starting plugin installation', NULL, '', 0, 1415061031),
(931, 0, 'atto_bold', '2014051200', '2014051200', 'Upgrade savepoint reached', NULL, '', 0, 1415061031),
(932, 0, 'atto_bold', '2014051200', '2014051200', 'Plugin installed', NULL, '', 0, 1415061031),
(933, 0, 'atto_charmap', NULL, '2014051200', 'Starting plugin installation', NULL, '', 0, 1415061031),
(934, 0, 'atto_charmap', '2014051200', '2014051200', 'Upgrade savepoint reached', NULL, '', 0, 1415061031),
(935, 0, 'atto_charmap', '2014051200', '2014051200', 'Plugin installed', NULL, '', 0, 1415061031),
(936, 0, 'atto_clear', NULL, '2014051200', 'Starting plugin installation', NULL, '', 0, 1415061031),
(937, 0, 'atto_clear', '2014051200', '2014051200', 'Upgrade savepoint reached', NULL, '', 0, 1415061031),
(938, 0, 'atto_clear', '2014051200', '2014051200', 'Plugin installed', NULL, '', 0, 1415061031),
(939, 0, 'atto_collapse', NULL, '2014051200', 'Starting plugin installation', NULL, '', 0, 1415061031),
(940, 0, 'atto_collapse', '2014051200', '2014051200', 'Upgrade savepoint reached', NULL, '', 0, 1415061031),
(941, 0, 'atto_collapse', '2014051200', '2014051200', 'Plugin installed', NULL, '', 0, 1415061031),
(942, 0, 'atto_emoticon', NULL, '2014051200', 'Starting plugin installation', NULL, '', 0, 1415061031),
(943, 0, 'atto_emoticon', '2014051200', '2014051200', 'Upgrade savepoint reached', NULL, '', 0, 1415061031),
(944, 0, 'atto_emoticon', '2014051200', '2014051200', 'Plugin installed', NULL, '', 0, 1415061031),
(945, 0, 'atto_equation', NULL, '2014051200', 'Starting plugin installation', NULL, '', 0, 1415061031);
INSERT INTO `mdl_upgrade_log` (`id`, `type`, `plugin`, `version`, `targetversion`, `info`, `details`, `backtrace`, `userid`, `timemodified`) VALUES
(946, 0, 'atto_equation', '2014051200', '2014051200', 'Upgrade savepoint reached', NULL, '', 0, 1415061031),
(947, 0, 'atto_equation', '2014051200', '2014051200', 'Plugin installed', NULL, '', 0, 1415061031),
(948, 0, 'atto_fontcolor', NULL, '2014051200', 'Starting plugin installation', NULL, '', 0, 1415061031),
(949, 0, 'atto_fontcolor', '2014051200', '2014051200', 'Upgrade savepoint reached', NULL, '', 0, 1415061031),
(950, 0, 'atto_fontcolor', '2014051200', '2014051200', 'Plugin installed', NULL, '', 0, 1415061031),
(951, 0, 'atto_html', NULL, '2014051200', 'Starting plugin installation', NULL, '', 0, 1415061031),
(952, 0, 'atto_html', '2014051200', '2014051200', 'Upgrade savepoint reached', NULL, '', 0, 1415061031),
(953, 0, 'atto_html', '2014051200', '2014051200', 'Plugin installed', NULL, '', 0, 1415061031),
(954, 0, 'atto_image', NULL, '2014051200', 'Starting plugin installation', NULL, '', 0, 1415061031),
(955, 0, 'atto_image', '2014051200', '2014051200', 'Upgrade savepoint reached', NULL, '', 0, 1415061031),
(956, 0, 'atto_image', '2014051200', '2014051200', 'Plugin installed', NULL, '', 0, 1415061031),
(957, 0, 'atto_indent', NULL, '2014051200', 'Starting plugin installation', NULL, '', 0, 1415061031),
(958, 0, 'atto_indent', '2014051200', '2014051200', 'Upgrade savepoint reached', NULL, '', 0, 1415061031),
(959, 0, 'atto_indent', '2014051200', '2014051200', 'Plugin installed', NULL, '', 0, 1415061031),
(960, 0, 'atto_italic', NULL, '2014051200', 'Starting plugin installation', NULL, '', 0, 1415061031),
(961, 0, 'atto_italic', '2014051200', '2014051200', 'Upgrade savepoint reached', NULL, '', 0, 1415061031),
(962, 0, 'atto_italic', '2014051200', '2014051200', 'Plugin installed', NULL, '', 0, 1415061031),
(963, 0, 'atto_link', NULL, '2014051200', 'Starting plugin installation', NULL, '', 0, 1415061031),
(964, 0, 'atto_link', '2014051200', '2014051200', 'Upgrade savepoint reached', NULL, '', 0, 1415061032),
(965, 0, 'atto_link', '2014051200', '2014051200', 'Plugin installed', NULL, '', 0, 1415061032),
(966, 0, 'atto_managefiles', NULL, '2014051200', 'Starting plugin installation', NULL, '', 0, 1415061032),
(967, 0, 'atto_managefiles', '2014051200', '2014051200', 'Upgrade savepoint reached', NULL, '', 0, 1415061032),
(968, 0, 'atto_managefiles', '2014051200', '2014051200', 'Plugin installed', NULL, '', 0, 1415061032),
(969, 0, 'atto_media', NULL, '2014051200', 'Starting plugin installation', NULL, '', 0, 1415061032),
(970, 0, 'atto_media', '2014051200', '2014051200', 'Upgrade savepoint reached', NULL, '', 0, 1415061032),
(971, 0, 'atto_media', '2014051200', '2014051200', 'Plugin installed', NULL, '', 0, 1415061032),
(972, 0, 'atto_noautolink', NULL, '2014051200', 'Starting plugin installation', NULL, '', 0, 1415061032),
(973, 0, 'atto_noautolink', '2014051200', '2014051200', 'Upgrade savepoint reached', NULL, '', 0, 1415061032),
(974, 0, 'atto_noautolink', '2014051200', '2014051200', 'Plugin installed', NULL, '', 0, 1415061032),
(975, 0, 'atto_orderedlist', NULL, '2014051200', 'Starting plugin installation', NULL, '', 0, 1415061032),
(976, 0, 'atto_orderedlist', '2014051200', '2014051200', 'Upgrade savepoint reached', NULL, '', 0, 1415061032),
(977, 0, 'atto_orderedlist', '2014051200', '2014051200', 'Plugin installed', NULL, '', 0, 1415061032),
(978, 0, 'atto_rtl', NULL, '2014051200', 'Starting plugin installation', NULL, '', 0, 1415061032),
(979, 0, 'atto_rtl', '2014051200', '2014051200', 'Upgrade savepoint reached', NULL, '', 0, 1415061032),
(980, 0, 'atto_rtl', '2014051200', '2014051200', 'Plugin installed', NULL, '', 0, 1415061032),
(981, 0, 'atto_strike', NULL, '2014051200', 'Starting plugin installation', NULL, '', 0, 1415061032),
(982, 0, 'atto_strike', '2014051200', '2014051200', 'Upgrade savepoint reached', NULL, '', 0, 1415061032),
(983, 0, 'atto_strike', '2014051200', '2014051200', 'Plugin installed', NULL, '', 0, 1415061032),
(984, 0, 'atto_subscript', NULL, '2014051200', 'Starting plugin installation', NULL, '', 0, 1415061032),
(985, 0, 'atto_subscript', '2014051200', '2014051200', 'Upgrade savepoint reached', NULL, '', 0, 1415061032),
(986, 0, 'atto_subscript', '2014051200', '2014051200', 'Plugin installed', NULL, '', 0, 1415061032),
(987, 0, 'atto_superscript', NULL, '2014051200', 'Starting plugin installation', NULL, '', 0, 1415061032),
(988, 0, 'atto_superscript', '2014051200', '2014051200', 'Upgrade savepoint reached', NULL, '', 0, 1415061032),
(989, 0, 'atto_superscript', '2014051200', '2014051200', 'Plugin installed', NULL, '', 0, 1415061032),
(990, 0, 'atto_table', NULL, '2014051200', 'Starting plugin installation', NULL, '', 0, 1415061032),
(991, 0, 'atto_table', '2014051200', '2014051200', 'Upgrade savepoint reached', NULL, '', 0, 1415061032),
(992, 0, 'atto_table', '2014051200', '2014051200', 'Plugin installed', NULL, '', 0, 1415061032),
(993, 0, 'atto_title', NULL, '2014051200', 'Starting plugin installation', NULL, '', 0, 1415061032),
(994, 0, 'atto_title', '2014051200', '2014051200', 'Upgrade savepoint reached', NULL, '', 0, 1415061032),
(995, 0, 'atto_title', '2014051200', '2014051200', 'Plugin installed', NULL, '', 0, 1415061032),
(996, 0, 'atto_underline', NULL, '2014051200', 'Starting plugin installation', NULL, '', 0, 1415061032),
(997, 0, 'atto_underline', '2014051200', '2014051200', 'Upgrade savepoint reached', NULL, '', 0, 1415061032),
(998, 0, 'atto_underline', '2014051200', '2014051200', 'Plugin installed', NULL, '', 0, 1415061032),
(999, 0, 'atto_undo', NULL, '2014051200', 'Starting plugin installation', NULL, '', 0, 1415061032),
(1000, 0, 'atto_undo', '2014051200', '2014051200', 'Upgrade savepoint reached', NULL, '', 0, 1415061032),
(1001, 0, 'atto_undo', '2014051200', '2014051200', 'Plugin installed', NULL, '', 0, 1415061032),
(1002, 0, 'atto_unorderedlist', NULL, '2014051200', 'Starting plugin installation', NULL, '', 0, 1415061032),
(1003, 0, 'atto_unorderedlist', '2014051200', '2014051200', 'Upgrade savepoint reached', NULL, '', 0, 1415061032),
(1004, 0, 'atto_unorderedlist', '2014051200', '2014051200', 'Plugin installed', NULL, '', 0, 1415061032),
(1005, 0, 'tinymce_ctrlhelp', NULL, '2014051200', 'Starting plugin installation', NULL, '', 0, 1415061032),
(1006, 0, 'tinymce_ctrlhelp', '2014051200', '2014051200', 'Upgrade savepoint reached', NULL, '', 0, 1415061032),
(1007, 0, 'tinymce_ctrlhelp', '2014051200', '2014051200', 'Plugin installed', NULL, '', 0, 1415061032),
(1008, 0, 'tinymce_dragmath', NULL, '2014051200', 'Starting plugin installation', NULL, '', 0, 1415061032),
(1009, 0, 'tinymce_dragmath', '2014051200', '2014051200', 'Upgrade savepoint reached', NULL, '', 0, 1415061032),
(1010, 0, 'tinymce_dragmath', '2014051200', '2014051200', 'Plugin installed', NULL, '', 0, 1415061032),
(1011, 0, 'tinymce_managefiles', NULL, '2014051200', 'Starting plugin installation', NULL, '', 0, 1415061032),
(1012, 0, 'tinymce_managefiles', '2014051200', '2014051200', 'Upgrade savepoint reached', NULL, '', 0, 1415061032),
(1013, 0, 'tinymce_managefiles', '2014051200', '2014051200', 'Plugin installed', NULL, '', 0, 1415061032),
(1014, 0, 'tinymce_moodleemoticon', NULL, '2014051200', 'Starting plugin installation', NULL, '', 0, 1415061032),
(1015, 0, 'tinymce_moodleemoticon', '2014051200', '2014051200', 'Upgrade savepoint reached', NULL, '', 0, 1415061032),
(1016, 0, 'tinymce_moodleemoticon', '2014051200', '2014051200', 'Plugin installed', NULL, '', 0, 1415061033),
(1017, 0, 'tinymce_moodleimage', NULL, '2014051200', 'Starting plugin installation', NULL, '', 0, 1415061033),
(1018, 0, 'tinymce_moodleimage', '2014051200', '2014051200', 'Upgrade savepoint reached', NULL, '', 0, 1415061033),
(1019, 0, 'tinymce_moodleimage', '2014051200', '2014051200', 'Plugin installed', NULL, '', 0, 1415061033),
(1020, 0, 'tinymce_moodlemedia', NULL, '2014051200', 'Starting plugin installation', NULL, '', 0, 1415061033),
(1021, 0, 'tinymce_moodlemedia', '2014051200', '2014051200', 'Upgrade savepoint reached', NULL, '', 0, 1415061033),
(1022, 0, 'tinymce_moodlemedia', '2014051200', '2014051200', 'Plugin installed', NULL, '', 0, 1415061033),
(1023, 0, 'tinymce_moodlenolink', NULL, '2014051200', 'Starting plugin installation', NULL, '', 0, 1415061033),
(1024, 0, 'tinymce_moodlenolink', '2014051200', '2014051200', 'Upgrade savepoint reached', NULL, '', 0, 1415061033),
(1025, 0, 'tinymce_moodlenolink', '2014051200', '2014051200', 'Plugin installed', NULL, '', 0, 1415061033),
(1026, 0, 'tinymce_pdw', NULL, '2014051200', 'Starting plugin installation', NULL, '', 0, 1415061033),
(1027, 0, 'tinymce_pdw', '2014051200', '2014051200', 'Upgrade savepoint reached', NULL, '', 0, 1415061033),
(1028, 0, 'tinymce_pdw', '2014051200', '2014051200', 'Plugin installed', NULL, '', 0, 1415061033),
(1029, 0, 'tinymce_spellchecker', NULL, '2014051200', 'Starting plugin installation', NULL, '', 0, 1415061033),
(1030, 0, 'tinymce_spellchecker', '2014051200', '2014051200', 'Upgrade savepoint reached', NULL, '', 0, 1415061033),
(1031, 0, 'tinymce_spellchecker', '2014051200', '2014051200', 'Plugin installed', NULL, '', 0, 1415061033),
(1032, 0, 'tinymce_wrap', NULL, '2014051200', 'Starting plugin installation', NULL, '', 0, 1415061033),
(1033, 0, 'tinymce_wrap', '2014051200', '2014051200', 'Upgrade savepoint reached', NULL, '', 0, 1415061033),
(1034, 0, 'tinymce_wrap', '2014051200', '2014051200', 'Plugin installed', NULL, '', 0, 1415061033),
(1035, 0, 'logstore_database', NULL, '2014051200', 'Starting plugin installation', NULL, '', 0, 1415061033),
(1036, 0, 'logstore_database', '2014051200', '2014051200', 'Upgrade savepoint reached', NULL, '', 0, 1415061033),
(1037, 0, 'logstore_database', '2014051200', '2014051200', 'Plugin installed', NULL, '', 0, 1415061033),
(1038, 0, 'logstore_legacy', NULL, '2014051200', 'Starting plugin installation', NULL, '', 0, 1415061033),
(1039, 0, 'logstore_legacy', '2014051200', '2014051200', 'Upgrade savepoint reached', NULL, '', 0, 1415061033),
(1040, 0, 'logstore_legacy', '2014051200', '2014051200', 'Plugin installed', NULL, '', 0, 1415061033),
(1041, 0, 'logstore_standard', NULL, '2014051200', 'Starting plugin installation', NULL, '', 0, 1415061033),
(1042, 0, 'logstore_standard', '2014051200', '2014051200', 'Upgrade savepoint reached', NULL, '', 0, 1415061033),
(1043, 0, 'logstore_standard', '2014051200', '2014051200', 'Plugin installed', NULL, '', 0, 1415061033),
(1044, 0, 'block_quickmail', NULL, '2014042914', 'Starting plugin installation', NULL, '', 2, 1417664308),
(1045, 0, 'block_quickmail', '2014042914', '2014042914', 'Upgrade savepoint reached', NULL, '', 2, 1417664309),
(1046, 0, 'block_quickmail', '2014042914', '2014042914', 'Plugin installed', NULL, '', 2, 1417664310);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_url`
--

CREATE TABLE IF NOT EXISTS `mdl_url` (
`id` bigint(10) NOT NULL,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `intro` longtext,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `externalurl` longtext NOT NULL,
  `display` smallint(4) NOT NULL DEFAULT '0',
  `displayoptions` longtext,
  `parameters` longtext,
  `timemodified` bigint(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='each record is one url resource';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_user`
--

CREATE TABLE IF NOT EXISTS `mdl_user` (
`id` bigint(10) NOT NULL,
  `auth` varchar(20) NOT NULL DEFAULT 'manual',
  `confirmed` tinyint(1) NOT NULL DEFAULT '0',
  `policyagreed` tinyint(1) NOT NULL DEFAULT '0',
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `suspended` tinyint(1) NOT NULL DEFAULT '0',
  `mnethostid` bigint(10) NOT NULL DEFAULT '0',
  `username` varchar(100) NOT NULL DEFAULT '',
  `password` varchar(255) NOT NULL DEFAULT '',
  `idnumber` varchar(255) NOT NULL DEFAULT '',
  `firstname` varchar(100) NOT NULL DEFAULT '',
  `lastname` varchar(100) NOT NULL DEFAULT '',
  `email` varchar(100) NOT NULL DEFAULT '',
  `emailstop` tinyint(1) NOT NULL DEFAULT '0',
  `icq` varchar(15) NOT NULL DEFAULT '',
  `skype` varchar(50) NOT NULL DEFAULT '',
  `yahoo` varchar(50) NOT NULL DEFAULT '',
  `aim` varchar(50) NOT NULL DEFAULT '',
  `msn` varchar(50) NOT NULL DEFAULT '',
  `phone1` varchar(20) NOT NULL DEFAULT '',
  `phone2` varchar(20) NOT NULL DEFAULT '',
  `institution` varchar(255) NOT NULL DEFAULT '',
  `department` varchar(255) NOT NULL DEFAULT '',
  `address` varchar(255) NOT NULL DEFAULT '',
  `city` varchar(120) NOT NULL DEFAULT '',
  `country` varchar(2) NOT NULL DEFAULT '',
  `lang` varchar(30) NOT NULL DEFAULT 'en',
  `calendartype` varchar(30) NOT NULL DEFAULT 'gregorian',
  `theme` varchar(50) NOT NULL DEFAULT '',
  `timezone` varchar(100) NOT NULL DEFAULT '99',
  `firstaccess` bigint(10) NOT NULL DEFAULT '0',
  `lastaccess` bigint(10) NOT NULL DEFAULT '0',
  `lastlogin` bigint(10) NOT NULL DEFAULT '0',
  `currentlogin` bigint(10) NOT NULL DEFAULT '0',
  `lastip` varchar(45) NOT NULL DEFAULT '',
  `secret` varchar(15) NOT NULL DEFAULT '',
  `picture` bigint(10) NOT NULL DEFAULT '0',
  `url` varchar(255) NOT NULL DEFAULT '',
  `description` longtext,
  `descriptionformat` tinyint(2) NOT NULL DEFAULT '1',
  `mailformat` tinyint(1) NOT NULL DEFAULT '1',
  `maildigest` tinyint(1) NOT NULL DEFAULT '0',
  `maildisplay` tinyint(2) NOT NULL DEFAULT '2',
  `autosubscribe` tinyint(1) NOT NULL DEFAULT '1',
  `trackforums` tinyint(1) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `trustbitmask` bigint(10) NOT NULL DEFAULT '0',
  `imagealt` varchar(255) DEFAULT NULL,
  `lastnamephonetic` varchar(255) DEFAULT NULL,
  `firstnamephonetic` varchar(255) DEFAULT NULL,
  `middlename` varchar(255) DEFAULT NULL,
  `alternatename` varchar(255) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='One record for each person';

--
-- Dumping data for table `mdl_user`
--

INSERT INTO `mdl_user` (`id`, `auth`, `confirmed`, `policyagreed`, `deleted`, `suspended`, `mnethostid`, `username`, `password`, `idnumber`, `firstname`, `lastname`, `email`, `emailstop`, `icq`, `skype`, `yahoo`, `aim`, `msn`, `phone1`, `phone2`, `institution`, `department`, `address`, `city`, `country`, `lang`, `calendartype`, `theme`, `timezone`, `firstaccess`, `lastaccess`, `lastlogin`, `currentlogin`, `lastip`, `secret`, `picture`, `url`, `description`, `descriptionformat`, `mailformat`, `maildigest`, `maildisplay`, `autosubscribe`, `trackforums`, `timecreated`, `timemodified`, `trustbitmask`, `imagealt`, `lastnamephonetic`, `firstnamephonetic`, `middlename`, `alternatename`) VALUES
(1, 'manual', 1, 0, 0, 0, 1, 'guest', '$2y$10$NwuGIdM37w.Fnq0ofwqabudQXWfjZjVrxkeUmpt051Qh5wCTUfJT2', '', 'Guest user', ' ', 'root@localhost', 0, '', '', '', '', '', '', '', '', '', '', '', '', 'en', 'gregorian', '', '99', 0, 0, 0, 0, '', '', 0, '', 'This user is a special user that allows read-only access to some courses.', 1, 1, 0, 2, 1, 0, 0, 1415060944, 0, NULL, NULL, NULL, NULL, NULL),
(2, 'manual', 1, 0, 0, 0, 1, 'admin', '$2y$10$9xDwLUPlOC7KC8qXu/lmL.3cyvMxNrWCDtq7XnRNE8enziqAPG9VW', '', 'Admin', 'User', 'dom_2789@yahoo.com', 0, '', '', '', '', '', '', '', '', '', '', '', 'CR', 'en', 'gregorian', '', '99', 1415061037, 1420730790, 1419698194, 1420730790, '201.195.209.206', '', 0, '', '', 1, 1, 0, 0, 1, 0, 0, 1415061118, 0, NULL, '', '', '', ''),
(3, 'manual', 1, 0, 0, 0, 1, 'profe', '$2y$10$0UvzJs2KbDHP0qC7y6VXsO2zWWAunTJLQecnLl4Zy7E.5cVw85Mcq', '', 'profe', 'prueba', 'dom_2789@hotmail.com', 0, '', '', '', '', '', '', '', '', '', '', '', 'CR', 'es', 'gregorian', '', '99', 1416172525, 1418231448, 1418138313, 1418231448, '163.178.208.16', '', 0, '', '', 1, 1, 0, 2, 1, 0, 1415916144, 1415916144, 0, '', '', '', '', ''),
(4, 'manual', 1, 0, 0, 0, 1, 'estudiante', '$2y$10$Vh.NdX/7Oa/btMpVsgxf9.CbsheOlZM3FFJSBuFzGM6hLachTzEXq', '', 'estudiante', 'prueba', 'daniel.asistencia@gmail.com', 0, '', '', '', '', '', '', '', '', '', '', '', 'CR', 'es', 'gregorian', '', '99', 1416172564, 1418232961, 1418232815, 1418232961, '163.178.208.16', '', 0, '', '', 1, 1, 0, 2, 1, 0, 1415916307, 1415916360, 0, '', '', '', '', ''),
(5, 'manual', 1, 0, 0, 0, 1, 'adrian', '$2y$10$2GjWteBB1fSinzL7/oSE6uRUcWwEMPIYeceupjph5huVti3rLzD1a', '', 'Adrián', 'Fernández', 'f.adrian59@yahoo.com', 0, '', '', '', '', '', '', '', '', '', '', '', '', 'es', 'gregorian', '', '99', 0, 0, 0, 0, '', '', 0, '', '', 1, 1, 0, 2, 1, 0, 1417667255, 1417667255, 0, '', '', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `mdl_user_devices`
--

CREATE TABLE IF NOT EXISTS `mdl_user_devices` (
`id` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `appid` varchar(128) NOT NULL DEFAULT '',
  `name` varchar(32) NOT NULL DEFAULT '',
  `model` varchar(32) NOT NULL DEFAULT '',
  `platform` varchar(32) NOT NULL DEFAULT '',
  `version` varchar(32) NOT NULL DEFAULT '',
  `pushid` varchar(255) NOT NULL DEFAULT '',
  `uuid` varchar(255) NOT NULL DEFAULT '',
  `timecreated` bigint(10) NOT NULL,
  `timemodified` bigint(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='This table stores user''s mobile devices information in order';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_user_enrolments`
--

CREATE TABLE IF NOT EXISTS `mdl_user_enrolments` (
`id` bigint(10) NOT NULL,
  `status` bigint(10) NOT NULL DEFAULT '0',
  `enrolid` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `timestart` bigint(10) NOT NULL DEFAULT '0',
  `timeend` bigint(10) NOT NULL DEFAULT '2147483647',
  `modifierid` bigint(10) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='Users participating in courses (aka enrolled users) - everyb';

--
-- Dumping data for table `mdl_user_enrolments`
--

INSERT INTO `mdl_user_enrolments` (`id`, `status`, `enrolid`, `userid`, `timestart`, `timeend`, `modifierid`, `timecreated`, `timemodified`) VALUES
(1, 0, 1, 3, 1415862000, 0, 2, 1415917218, 1415917218),
(2, 0, 1, 4, 1415862000, 0, 2, 1415917221, 1415917221);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_user_info_category`
--

CREATE TABLE IF NOT EXISTS `mdl_user_info_category` (
`id` bigint(10) NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `sortorder` bigint(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Customisable fields categories';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_user_info_data`
--

CREATE TABLE IF NOT EXISTS `mdl_user_info_data` (
`id` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `fieldid` bigint(10) NOT NULL DEFAULT '0',
  `data` longtext NOT NULL,
  `dataformat` tinyint(2) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Data for the customisable user fields';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_user_info_field`
--

CREATE TABLE IF NOT EXISTS `mdl_user_info_field` (
`id` bigint(10) NOT NULL,
  `shortname` varchar(255) NOT NULL DEFAULT 'shortname',
  `name` longtext NOT NULL,
  `datatype` varchar(255) NOT NULL DEFAULT '',
  `description` longtext,
  `descriptionformat` tinyint(2) NOT NULL DEFAULT '0',
  `categoryid` bigint(10) NOT NULL DEFAULT '0',
  `sortorder` bigint(10) NOT NULL DEFAULT '0',
  `required` tinyint(2) NOT NULL DEFAULT '0',
  `locked` tinyint(2) NOT NULL DEFAULT '0',
  `visible` smallint(4) NOT NULL DEFAULT '0',
  `forceunique` tinyint(2) NOT NULL DEFAULT '0',
  `signup` tinyint(2) NOT NULL DEFAULT '0',
  `defaultdata` longtext,
  `defaultdataformat` tinyint(2) NOT NULL DEFAULT '0',
  `param1` longtext,
  `param2` longtext,
  `param3` longtext,
  `param4` longtext,
  `param5` longtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Customisable user profile fields';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_user_lastaccess`
--

CREATE TABLE IF NOT EXISTS `mdl_user_lastaccess` (
`id` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `courseid` bigint(10) NOT NULL DEFAULT '0',
  `timeaccess` bigint(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='To keep track of course page access times, used in online pa';

--
-- Dumping data for table `mdl_user_lastaccess`
--

INSERT INTO `mdl_user_lastaccess` (`id`, `userid`, `courseid`, `timeaccess`) VALUES
(1, 2, 2, 1419704602),
(2, 4, 2, 1418138954);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_user_password_resets`
--

CREATE TABLE IF NOT EXISTS `mdl_user_password_resets` (
`id` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `timerequested` bigint(10) NOT NULL,
  `timererequested` bigint(10) NOT NULL DEFAULT '0',
  `token` varchar(32) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='table tracking password reset confirmation tokens';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_user_preferences`
--

CREATE TABLE IF NOT EXISTS `mdl_user_preferences` (
`id` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `value` varchar(1333) NOT NULL DEFAULT ''
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8 COMMENT='Allows modules to store arbitrary user preferences';

--
-- Dumping data for table `mdl_user_preferences`
--

INSERT INTO `mdl_user_preferences` (`id`, `userid`, `name`, `value`) VALUES
(1, 2, 'auth_manual_passwordupdatetime', '1415061118'),
(2, 2, 'htmleditor', ''),
(3, 2, 'email_bounce_count', '1'),
(4, 2, 'email_send_count', '1'),
(5, 2, 'login_failed_count_since_success', '5'),
(6, 2, 'definerole_showadvanced', '1'),
(7, 3, 'auth_forcepasswordchange', '0'),
(8, 3, 'htmleditor', ''),
(9, 3, 'email_bounce_count', '1'),
(10, 3, 'email_send_count', '1'),
(11, 4, 'auth_forcepasswordchange', '0'),
(12, 4, 'htmleditor', ''),
(13, 4, 'email_bounce_count', '1'),
(14, 4, 'email_send_count', '1'),
(15, 2, 'filepicker_recentrepository', '4'),
(16, 2, 'filepicker_recentlicense', 'allrightsreserved'),
(17, 5, 'auth_forcepasswordchange', '1'),
(18, 5, 'htmleditor', ''),
(19, 5, 'email_bounce_count', '1'),
(20, 5, 'email_send_count', '2'),
(21, 2, 'question_bank_recurse', '1'),
(22, 2, 'question_bank_showhidden', '0'),
(23, 2, 'question_bank_qbshowtext', '0'),
(24, 2, 'question_bank_advanced_search', '0'),
(25, 2, 'quiz_qbanktool_open', '1'),
(26, 2, 'quiz_reordertab', '0');

-- --------------------------------------------------------

--
-- Table structure for table `mdl_user_private_key`
--

CREATE TABLE IF NOT EXISTS `mdl_user_private_key` (
`id` bigint(10) NOT NULL,
  `script` varchar(128) NOT NULL DEFAULT '',
  `value` varchar(128) NOT NULL DEFAULT '',
  `userid` bigint(10) NOT NULL,
  `instance` bigint(10) DEFAULT NULL,
  `iprestriction` varchar(255) DEFAULT NULL,
  `validuntil` bigint(10) DEFAULT NULL,
  `timecreated` bigint(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='access keys used in cookieless scripts - rss, etc.';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_webdav_locks`
--

CREATE TABLE IF NOT EXISTS `mdl_webdav_locks` (
`id` bigint(10) NOT NULL,
  `token` varchar(255) NOT NULL DEFAULT '',
  `path` varchar(255) NOT NULL DEFAULT '',
  `expiry` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `recursive` tinyint(1) NOT NULL DEFAULT '0',
  `exclusivelock` tinyint(1) NOT NULL DEFAULT '0',
  `created` bigint(10) NOT NULL DEFAULT '0',
  `modified` bigint(10) NOT NULL DEFAULT '0',
  `owner` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Resource locks for WebDAV users';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_wiki`
--

CREATE TABLE IF NOT EXISTS `mdl_wiki` (
`id` bigint(10) NOT NULL,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT 'Wiki',
  `intro` longtext,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `firstpagetitle` varchar(255) NOT NULL DEFAULT 'First Page',
  `wikimode` varchar(20) NOT NULL DEFAULT 'collaborative',
  `defaultformat` varchar(20) NOT NULL DEFAULT 'creole',
  `forceformat` tinyint(1) NOT NULL DEFAULT '1',
  `editbegin` bigint(10) NOT NULL DEFAULT '0',
  `editend` bigint(10) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores Wiki activity configuration';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_wiki_links`
--

CREATE TABLE IF NOT EXISTS `mdl_wiki_links` (
`id` bigint(10) NOT NULL,
  `subwikiid` bigint(10) NOT NULL DEFAULT '0',
  `frompageid` bigint(10) NOT NULL DEFAULT '0',
  `topageid` bigint(10) NOT NULL DEFAULT '0',
  `tomissingpage` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Page wiki links';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_wiki_locks`
--

CREATE TABLE IF NOT EXISTS `mdl_wiki_locks` (
`id` bigint(10) NOT NULL,
  `pageid` bigint(10) NOT NULL DEFAULT '0',
  `sectionname` varchar(255) DEFAULT NULL,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `lockedat` bigint(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Manages page locks';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_wiki_pages`
--

CREATE TABLE IF NOT EXISTS `mdl_wiki_pages` (
`id` bigint(10) NOT NULL,
  `subwikiid` bigint(10) NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL DEFAULT 'title',
  `cachedcontent` longtext NOT NULL,
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `timerendered` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `pageviews` bigint(10) NOT NULL DEFAULT '0',
  `readonly` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores wiki pages';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_wiki_subwikis`
--

CREATE TABLE IF NOT EXISTS `mdl_wiki_subwikis` (
`id` bigint(10) NOT NULL,
  `wikiid` bigint(10) NOT NULL DEFAULT '0',
  `groupid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores subwiki instances';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_wiki_synonyms`
--

CREATE TABLE IF NOT EXISTS `mdl_wiki_synonyms` (
`id` bigint(10) NOT NULL,
  `subwikiid` bigint(10) NOT NULL DEFAULT '0',
  `pageid` bigint(10) NOT NULL DEFAULT '0',
  `pagesynonym` varchar(255) NOT NULL DEFAULT 'Pagesynonym'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores wiki pages synonyms';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_wiki_versions`
--

CREATE TABLE IF NOT EXISTS `mdl_wiki_versions` (
`id` bigint(10) NOT NULL,
  `pageid` bigint(10) NOT NULL DEFAULT '0',
  `content` longtext NOT NULL,
  `contentformat` varchar(20) NOT NULL DEFAULT 'creole',
  `version` mediumint(5) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores wiki page history';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_workshop`
--

CREATE TABLE IF NOT EXISTS `mdl_workshop` (
`id` bigint(10) NOT NULL,
  `course` bigint(10) NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `intro` longtext,
  `introformat` smallint(3) NOT NULL DEFAULT '0',
  `instructauthors` longtext,
  `instructauthorsformat` smallint(3) NOT NULL DEFAULT '0',
  `instructreviewers` longtext,
  `instructreviewersformat` smallint(3) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL,
  `phase` smallint(3) DEFAULT '0',
  `useexamples` tinyint(2) DEFAULT '0',
  `usepeerassessment` tinyint(2) DEFAULT '0',
  `useselfassessment` tinyint(2) DEFAULT '0',
  `grade` decimal(10,5) DEFAULT '80.00000',
  `gradinggrade` decimal(10,5) DEFAULT '20.00000',
  `strategy` varchar(30) NOT NULL DEFAULT '',
  `evaluation` varchar(30) NOT NULL DEFAULT '',
  `gradedecimals` smallint(3) DEFAULT '0',
  `nattachments` smallint(3) DEFAULT '0',
  `latesubmissions` tinyint(2) DEFAULT '0',
  `maxbytes` bigint(10) DEFAULT '100000',
  `examplesmode` smallint(3) DEFAULT '0',
  `submissionstart` bigint(10) DEFAULT '0',
  `submissionend` bigint(10) DEFAULT '0',
  `assessmentstart` bigint(10) DEFAULT '0',
  `assessmentend` bigint(10) DEFAULT '0',
  `phaseswitchassessment` tinyint(2) NOT NULL DEFAULT '0',
  `conclusion` longtext,
  `conclusionformat` smallint(3) NOT NULL DEFAULT '1',
  `overallfeedbackmode` smallint(3) DEFAULT '1',
  `overallfeedbackfiles` smallint(3) DEFAULT '0',
  `overallfeedbackmaxbytes` bigint(10) DEFAULT '100000'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='This table keeps information about the module instances and ';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_workshopallocation_scheduled`
--

CREATE TABLE IF NOT EXISTS `mdl_workshopallocation_scheduled` (
`id` bigint(10) NOT NULL,
  `workshopid` bigint(10) NOT NULL,
  `enabled` tinyint(2) NOT NULL DEFAULT '0',
  `submissionend` bigint(10) NOT NULL,
  `timeallocated` bigint(10) DEFAULT NULL,
  `settings` longtext,
  `resultstatus` bigint(10) DEFAULT NULL,
  `resultmessage` varchar(1333) DEFAULT NULL,
  `resultlog` longtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores the allocation settings for the scheduled allocator';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_workshopeval_best_settings`
--

CREATE TABLE IF NOT EXISTS `mdl_workshopeval_best_settings` (
`id` bigint(10) NOT NULL,
  `workshopid` bigint(10) NOT NULL,
  `comparison` smallint(3) DEFAULT '5'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Settings for the grading evaluation subplugin Comparison wit';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_workshopform_accumulative`
--

CREATE TABLE IF NOT EXISTS `mdl_workshopform_accumulative` (
`id` bigint(10) NOT NULL,
  `workshopid` bigint(10) NOT NULL,
  `sort` bigint(10) DEFAULT '0',
  `description` longtext,
  `descriptionformat` smallint(3) DEFAULT '0',
  `grade` bigint(10) NOT NULL,
  `weight` mediumint(5) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='The assessment dimensions definitions of Accumulative gradin';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_workshopform_comments`
--

CREATE TABLE IF NOT EXISTS `mdl_workshopform_comments` (
`id` bigint(10) NOT NULL,
  `workshopid` bigint(10) NOT NULL,
  `sort` bigint(10) DEFAULT '0',
  `description` longtext,
  `descriptionformat` smallint(3) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='The assessment dimensions definitions of Comments strategy f';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_workshopform_numerrors`
--

CREATE TABLE IF NOT EXISTS `mdl_workshopform_numerrors` (
`id` bigint(10) NOT NULL,
  `workshopid` bigint(10) NOT NULL,
  `sort` bigint(10) DEFAULT '0',
  `description` longtext,
  `descriptionformat` smallint(3) DEFAULT '0',
  `descriptiontrust` bigint(10) DEFAULT NULL,
  `grade0` varchar(50) DEFAULT NULL,
  `grade1` varchar(50) DEFAULT NULL,
  `weight` mediumint(5) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='The assessment dimensions definitions of Number of errors gr';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_workshopform_numerrors_map`
--

CREATE TABLE IF NOT EXISTS `mdl_workshopform_numerrors_map` (
`id` bigint(10) NOT NULL,
  `workshopid` bigint(10) NOT NULL,
  `nonegative` bigint(10) NOT NULL,
  `grade` decimal(10,5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='This maps the number of errors to a percentual grade for sub';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_workshopform_rubric`
--

CREATE TABLE IF NOT EXISTS `mdl_workshopform_rubric` (
`id` bigint(10) NOT NULL,
  `workshopid` bigint(10) NOT NULL,
  `sort` bigint(10) DEFAULT '0',
  `description` longtext,
  `descriptionformat` smallint(3) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='The assessment dimensions definitions of Rubric grading stra';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_workshopform_rubric_config`
--

CREATE TABLE IF NOT EXISTS `mdl_workshopform_rubric_config` (
`id` bigint(10) NOT NULL,
  `workshopid` bigint(10) NOT NULL,
  `layout` varchar(30) DEFAULT 'list'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Configuration table for the Rubric grading strategy';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_workshopform_rubric_levels`
--

CREATE TABLE IF NOT EXISTS `mdl_workshopform_rubric_levels` (
`id` bigint(10) NOT NULL,
  `dimensionid` bigint(10) NOT NULL,
  `grade` decimal(10,5) NOT NULL,
  `definition` longtext,
  `definitionformat` smallint(3) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='The definition of rubric rating scales';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_workshop_aggregations`
--

CREATE TABLE IF NOT EXISTS `mdl_workshop_aggregations` (
`id` bigint(10) NOT NULL,
  `workshopid` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `gradinggrade` decimal(10,5) DEFAULT NULL,
  `timegraded` bigint(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Aggregated grades for assessment are stored here. The aggreg';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_workshop_assessments`
--

CREATE TABLE IF NOT EXISTS `mdl_workshop_assessments` (
`id` bigint(10) NOT NULL,
  `submissionid` bigint(10) NOT NULL,
  `reviewerid` bigint(10) NOT NULL,
  `weight` bigint(10) NOT NULL DEFAULT '1',
  `timecreated` bigint(10) DEFAULT '0',
  `timemodified` bigint(10) DEFAULT '0',
  `grade` decimal(10,5) DEFAULT NULL,
  `gradinggrade` decimal(10,5) DEFAULT NULL,
  `gradinggradeover` decimal(10,5) DEFAULT NULL,
  `gradinggradeoverby` bigint(10) DEFAULT NULL,
  `feedbackauthor` longtext,
  `feedbackauthorformat` smallint(3) DEFAULT '0',
  `feedbackauthorattachment` smallint(3) DEFAULT '0',
  `feedbackreviewer` longtext,
  `feedbackreviewerformat` smallint(3) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Info about the made assessment and automatically calculated ';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_workshop_assessments_old`
--

CREATE TABLE IF NOT EXISTS `mdl_workshop_assessments_old` (
`id` bigint(10) NOT NULL,
  `workshopid` bigint(10) NOT NULL DEFAULT '0',
  `submissionid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timegraded` bigint(10) NOT NULL DEFAULT '0',
  `timeagreed` bigint(10) NOT NULL DEFAULT '0',
  `grade` double NOT NULL DEFAULT '0',
  `gradinggrade` smallint(3) NOT NULL DEFAULT '0',
  `teachergraded` smallint(3) NOT NULL DEFAULT '0',
  `mailed` smallint(3) NOT NULL DEFAULT '0',
  `resubmission` smallint(3) NOT NULL DEFAULT '0',
  `donotuse` smallint(3) NOT NULL DEFAULT '0',
  `generalcomment` longtext,
  `teachercomment` longtext,
  `newplugin` varchar(28) DEFAULT NULL,
  `newid` bigint(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Legacy workshop_assessments table to be dropped later in Moo';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_workshop_comments_old`
--

CREATE TABLE IF NOT EXISTS `mdl_workshop_comments_old` (
`id` bigint(10) NOT NULL,
  `workshopid` bigint(10) NOT NULL DEFAULT '0',
  `assessmentid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `mailed` tinyint(2) NOT NULL DEFAULT '0',
  `comments` longtext NOT NULL,
  `newplugin` varchar(28) DEFAULT NULL,
  `newid` bigint(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Legacy workshop_comments table to be dropped later in Moodle';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_workshop_elements_old`
--

CREATE TABLE IF NOT EXISTS `mdl_workshop_elements_old` (
`id` bigint(10) NOT NULL,
  `workshopid` bigint(10) NOT NULL DEFAULT '0',
  `elementno` smallint(3) NOT NULL DEFAULT '0',
  `description` longtext NOT NULL,
  `scale` smallint(3) NOT NULL DEFAULT '0',
  `maxscore` smallint(3) NOT NULL DEFAULT '1',
  `weight` smallint(3) NOT NULL DEFAULT '11',
  `stddev` double NOT NULL DEFAULT '0',
  `totalassessments` bigint(10) NOT NULL DEFAULT '0',
  `newplugin` varchar(28) DEFAULT NULL,
  `newid` bigint(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Legacy workshop_elements table to be dropped later in Moodle';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_workshop_grades`
--

CREATE TABLE IF NOT EXISTS `mdl_workshop_grades` (
`id` bigint(10) NOT NULL,
  `assessmentid` bigint(10) NOT NULL,
  `strategy` varchar(30) NOT NULL DEFAULT '',
  `dimensionid` bigint(10) NOT NULL,
  `grade` decimal(10,5) NOT NULL,
  `peercomment` longtext,
  `peercommentformat` smallint(3) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='How the reviewers filled-up the grading forms, given grades ';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_workshop_grades_old`
--

CREATE TABLE IF NOT EXISTS `mdl_workshop_grades_old` (
`id` bigint(10) NOT NULL,
  `workshopid` bigint(10) NOT NULL DEFAULT '0',
  `assessmentid` bigint(10) NOT NULL DEFAULT '0',
  `elementno` bigint(10) NOT NULL DEFAULT '0',
  `feedback` longtext NOT NULL,
  `grade` smallint(3) NOT NULL DEFAULT '0',
  `newplugin` varchar(28) DEFAULT NULL,
  `newid` bigint(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Legacy workshop_grades table to be dropped later in Moodle 2';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_workshop_old`
--

CREATE TABLE IF NOT EXISTS `mdl_workshop_old` (
`id` bigint(10) NOT NULL,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `description` longtext NOT NULL,
  `wtype` smallint(3) NOT NULL DEFAULT '0',
  `nelements` smallint(3) NOT NULL DEFAULT '1',
  `nattachments` smallint(3) NOT NULL DEFAULT '0',
  `phase` tinyint(2) NOT NULL DEFAULT '0',
  `format` tinyint(2) NOT NULL DEFAULT '0',
  `gradingstrategy` tinyint(2) NOT NULL DEFAULT '1',
  `resubmit` tinyint(2) NOT NULL DEFAULT '0',
  `agreeassessments` tinyint(2) NOT NULL DEFAULT '0',
  `hidegrades` tinyint(2) NOT NULL DEFAULT '0',
  `anonymous` tinyint(2) NOT NULL DEFAULT '0',
  `includeself` tinyint(2) NOT NULL DEFAULT '0',
  `maxbytes` bigint(10) NOT NULL DEFAULT '100000',
  `submissionstart` bigint(10) NOT NULL DEFAULT '0',
  `assessmentstart` bigint(10) NOT NULL DEFAULT '0',
  `submissionend` bigint(10) NOT NULL DEFAULT '0',
  `assessmentend` bigint(10) NOT NULL DEFAULT '0',
  `releasegrades` bigint(10) NOT NULL DEFAULT '0',
  `grade` smallint(3) NOT NULL DEFAULT '0',
  `gradinggrade` smallint(3) NOT NULL DEFAULT '0',
  `ntassessments` smallint(3) NOT NULL DEFAULT '0',
  `assessmentcomps` smallint(3) NOT NULL DEFAULT '2',
  `nsassessments` smallint(3) NOT NULL DEFAULT '0',
  `overallocation` smallint(3) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `teacherweight` smallint(3) NOT NULL DEFAULT '1',
  `showleaguetable` smallint(3) NOT NULL DEFAULT '0',
  `usepassword` smallint(3) NOT NULL DEFAULT '0',
  `password` varchar(32) NOT NULL DEFAULT '',
  `newplugin` varchar(28) DEFAULT NULL,
  `newid` bigint(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Legacy workshop table to be dropped later in Moodle 2.x';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_workshop_rubrics_old`
--

CREATE TABLE IF NOT EXISTS `mdl_workshop_rubrics_old` (
`id` bigint(10) NOT NULL,
  `workshopid` bigint(10) NOT NULL DEFAULT '0',
  `elementno` bigint(10) NOT NULL DEFAULT '0',
  `rubricno` smallint(3) NOT NULL DEFAULT '0',
  `description` longtext NOT NULL,
  `newplugin` varchar(28) DEFAULT NULL,
  `newid` bigint(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Legacy workshop_rubrics table to be dropped later in Moodle ';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_workshop_stockcomments_old`
--

CREATE TABLE IF NOT EXISTS `mdl_workshop_stockcomments_old` (
`id` bigint(10) NOT NULL,
  `workshopid` bigint(10) NOT NULL DEFAULT '0',
  `elementno` bigint(10) NOT NULL DEFAULT '0',
  `comments` longtext NOT NULL,
  `newplugin` varchar(28) DEFAULT NULL,
  `newid` bigint(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Legacy workshop_stockcomments table to be dropped later in M';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_workshop_submissions`
--

CREATE TABLE IF NOT EXISTS `mdl_workshop_submissions` (
`id` bigint(10) NOT NULL,
  `workshopid` bigint(10) NOT NULL,
  `example` tinyint(2) DEFAULT '0',
  `authorid` bigint(10) NOT NULL,
  `timecreated` bigint(10) NOT NULL,
  `timemodified` bigint(10) NOT NULL,
  `title` varchar(255) NOT NULL DEFAULT '',
  `content` longtext,
  `contentformat` smallint(3) NOT NULL DEFAULT '0',
  `contenttrust` smallint(3) NOT NULL DEFAULT '0',
  `attachment` tinyint(2) DEFAULT '0',
  `grade` decimal(10,5) DEFAULT NULL,
  `gradeover` decimal(10,5) DEFAULT NULL,
  `gradeoverby` bigint(10) DEFAULT NULL,
  `feedbackauthor` longtext,
  `feedbackauthorformat` smallint(3) DEFAULT '0',
  `timegraded` bigint(10) DEFAULT NULL,
  `published` tinyint(2) DEFAULT '0',
  `late` tinyint(2) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Info about the submission and the aggregation of the grade f';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_workshop_submissions_old`
--

CREATE TABLE IF NOT EXISTS `mdl_workshop_submissions_old` (
`id` bigint(10) NOT NULL,
  `workshopid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `title` varchar(100) NOT NULL DEFAULT '',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `mailed` tinyint(2) NOT NULL DEFAULT '0',
  `description` longtext NOT NULL,
  `gradinggrade` smallint(3) NOT NULL DEFAULT '0',
  `finalgrade` smallint(3) NOT NULL DEFAULT '0',
  `late` smallint(3) NOT NULL DEFAULT '0',
  `nassessments` bigint(10) NOT NULL DEFAULT '0',
  `newplugin` varchar(28) DEFAULT NULL,
  `newid` bigint(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Legacy workshop_submissions table to be dropped later in Moo';

--
-- Indexes for dumped tables
--

--
-- Indexes for table `mdl_assign`
--
ALTER TABLE `mdl_assign`
 ADD PRIMARY KEY (`id`), ADD KEY `mdl_assi_cou_ix` (`course`), ADD KEY `mdl_assi_tea_ix` (`teamsubmissiongroupingid`);

--
-- Indexes for table `mdl_assignfeedback_comments`
--
ALTER TABLE `mdl_assignfeedback_comments`
 ADD PRIMARY KEY (`id`), ADD KEY `mdl_assicomm_ass_ix` (`assignment`), ADD KEY `mdl_assicomm_gra_ix` (`grade`);

--
-- Indexes for table `mdl_assignfeedback_editpdf_annot`
--
ALTER TABLE `mdl_assignfeedback_editpdf_annot`
 ADD PRIMARY KEY (`id`), ADD KEY `mdl_assieditanno_grapag_ix` (`gradeid`,`pageno`), ADD KEY `mdl_assieditanno_gra_ix` (`gradeid`);

--
-- Indexes for table `mdl_assignfeedback_editpdf_cmnt`
--
ALTER TABLE `mdl_assignfeedback_editpdf_cmnt`
 ADD PRIMARY KEY (`id`), ADD KEY `mdl_assieditcmnt_grapag_ix` (`gradeid`,`pageno`), ADD KEY `mdl_assieditcmnt_gra_ix` (`gradeid`);

--
-- Indexes for table `mdl_assignfeedback_editpdf_quick`
--
ALTER TABLE `mdl_assignfeedback_editpdf_quick`
 ADD PRIMARY KEY (`id`), ADD KEY `mdl_assieditquic_use_ix` (`userid`);

--
-- Indexes for table `mdl_assignfeedback_file`
--
ALTER TABLE `mdl_assignfeedback_file`
 ADD PRIMARY KEY (`id`), ADD KEY `mdl_assifile_ass2_ix` (`assignment`), ADD KEY `mdl_assifile_gra_ix` (`grade`);

--
-- Indexes for table `mdl_assignment`
--
ALTER TABLE `mdl_assignment`
 ADD PRIMARY KEY (`id`), ADD KEY `mdl_assi_cou2_ix` (`course`);

--
-- Indexes for table `mdl_assignment_submissions`
--
ALTER TABLE `mdl_assignment_submissions`
 ADD PRIMARY KEY (`id`), ADD KEY `mdl_assisubm_use2_ix` (`userid`), ADD KEY `mdl_assisubm_mai_ix` (`mailed`), ADD KEY `mdl_assisubm_tim_ix` (`timemarked`), ADD KEY `mdl_assisubm_ass2_ix` (`assignment`);

--
-- Indexes for table `mdl_assignment_upgrade`
--
ALTER TABLE `mdl_assignment_upgrade`
 ADD PRIMARY KEY (`id`), ADD KEY `mdl_assiupgr_old_ix` (`oldcmid`), ADD KEY `mdl_assiupgr_old2_ix` (`oldinstance`);

--
-- Indexes for table `mdl_assignsubmission_file`
--
ALTER TABLE `mdl_assignsubmission_file`
 ADD PRIMARY KEY (`id`), ADD KEY `mdl_assifile_ass_ix` (`assignment`), ADD KEY `mdl_assifile_sub_ix` (`submission`);

--
-- Indexes for table `mdl_assignsubmission_onlinetext`
--
ALTER TABLE `mdl_assignsubmission_onlinetext`
 ADD PRIMARY KEY (`id`), ADD KEY `mdl_assionli_ass_ix` (`assignment`), ADD KEY `mdl_assionli_sub_ix` (`submission`);

--
-- Indexes for table `mdl_assign_grades`
--
ALTER TABLE `mdl_assign_grades`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `mdl_assigrad_assuseatt_uix` (`assignment`,`userid`,`attemptnumber`), ADD KEY `mdl_assigrad_use_ix` (`userid`), ADD KEY `mdl_assigrad_att_ix` (`attemptnumber`), ADD KEY `mdl_assigrad_ass_ix` (`assignment`);

--
-- Indexes for table `mdl_assign_plugin_config`
--
ALTER TABLE `mdl_assign_plugin_config`
 ADD PRIMARY KEY (`id`), ADD KEY `mdl_assiplugconf_plu_ix` (`plugin`), ADD KEY `mdl_assiplugconf_sub_ix` (`subtype`), ADD KEY `mdl_assiplugconf_nam_ix` (`name`), ADD KEY `mdl_assiplugconf_ass_ix` (`assignment`);

--
-- Indexes for table `mdl_assign_submission`
--
ALTER TABLE `mdl_assign_submission`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `mdl_assisubm_assusegroatt_uix` (`assignment`,`userid`,`groupid`,`attemptnumber`), ADD KEY `mdl_assisubm_use_ix` (`userid`), ADD KEY `mdl_assisubm_att_ix` (`attemptnumber`), ADD KEY `mdl_assisubm_ass_ix` (`assignment`);

--
-- Indexes for table `mdl_assign_user_flags`
--
ALTER TABLE `mdl_assign_user_flags`
 ADD PRIMARY KEY (`id`), ADD KEY `mdl_assiuserflag_mai_ix` (`mailed`), ADD KEY `mdl_assiuserflag_use_ix` (`userid`), ADD KEY `mdl_assiuserflag_ass_ix` (`assignment`);

--
-- Indexes for table `mdl_assign_user_mapping`
--
ALTER TABLE `mdl_assign_user_mapping`
 ADD PRIMARY KEY (`id`), ADD KEY `mdl_assiusermapp_ass_ix` (`assignment`), ADD KEY `mdl_assiusermapp_use_ix` (`userid`);

--
-- Indexes for table `mdl_backup_controllers`
--
ALTER TABLE `mdl_backup_controllers`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `mdl_backcont_bac_uix` (`backupid`), ADD KEY `mdl_backcont_typite_ix` (`type`,`itemid`), ADD KEY `mdl_backcont_use_ix` (`userid`);

--
-- Indexes for table `mdl_backup_courses`
--
ALTER TABLE `mdl_backup_courses`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `mdl_backcour_cou_uix` (`courseid`);

--
-- Indexes for table `mdl_backup_logs`
--
ALTER TABLE `mdl_backup_logs`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `mdl_backlogs_bacid_uix` (`backupid`,`id`), ADD KEY `mdl_backlogs_bac_ix` (`backupid`);

--
-- Indexes for table `mdl_badge`
--
ALTER TABLE `mdl_badge`
 ADD PRIMARY KEY (`id`), ADD KEY `mdl_badg_typ_ix` (`type`), ADD KEY `mdl_badg_cou_ix` (`courseid`), ADD KEY `mdl_badg_use_ix` (`usermodified`), ADD KEY `mdl_badg_use2_ix` (`usercreated`);

--
-- Indexes for table `mdl_badge_backpack`
--
ALTER TABLE `mdl_badge_backpack`
 ADD PRIMARY KEY (`id`), ADD KEY `mdl_badgback_use_ix` (`userid`);

--
-- Indexes for table `mdl_badge_criteria`
--
ALTER TABLE `mdl_badge_criteria`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `mdl_badgcrit_badcri_uix` (`badgeid`,`criteriatype`), ADD KEY `mdl_badgcrit_cri_ix` (`criteriatype`), ADD KEY `mdl_badgcrit_bad_ix` (`badgeid`);

--
-- Indexes for table `mdl_badge_criteria_met`
--
ALTER TABLE `mdl_badge_criteria_met`
 ADD PRIMARY KEY (`id`), ADD KEY `mdl_badgcritmet_cri_ix` (`critid`), ADD KEY `mdl_badgcritmet_use_ix` (`userid`), ADD KEY `mdl_badgcritmet_iss_ix` (`issuedid`);

--
-- Indexes for table `mdl_badge_criteria_param`
--
ALTER TABLE `mdl_badge_criteria_param`
 ADD PRIMARY KEY (`id`), ADD KEY `mdl_badgcritpara_cri_ix` (`critid`);

--
-- Indexes for table `mdl_badge_external`
--
ALTER TABLE `mdl_badge_external`
 ADD PRIMARY KEY (`id`), ADD KEY `mdl_badgexte_bac_ix` (`backpackid`);

--
-- Indexes for table `mdl_badge_issued`
--
ALTER TABLE `mdl_badge_issued`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `mdl_badgissu_baduse_uix` (`badgeid`,`userid`), ADD KEY `mdl_badgissu_bad_ix` (`badgeid`), ADD KEY `mdl_badgissu_use_ix` (`userid`);

--
-- Indexes for table `mdl_badge_manual_award`
--
ALTER TABLE `mdl_badge_manual_award`
 ADD PRIMARY KEY (`id`), ADD KEY `mdl_badgmanuawar_bad_ix` (`badgeid`), ADD KEY `mdl_badgmanuawar_rec_ix` (`recipientid`), ADD KEY `mdl_badgmanuawar_iss_ix` (`issuerid`), ADD KEY `mdl_badgmanuawar_iss2_ix` (`issuerrole`);

--
-- Indexes for table `mdl_block`
--
ALTER TABLE `mdl_block`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `mdl_bloc_nam_uix` (`name`);

--
-- Indexes for table `mdl_block_community`
--
ALTER TABLE `mdl_block_community`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mdl_block_instances`
--
ALTER TABLE `mdl_block_instances`
 ADD PRIMARY KEY (`id`), ADD KEY `mdl_blocinst_parshopagsub_ix` (`parentcontextid`,`showinsubcontexts`,`pagetypepattern`,`subpagepattern`), ADD KEY `mdl_blocinst_par_ix` (`parentcontextid`);

--
-- Indexes for table `mdl_block_positions`
--
ALTER TABLE `mdl_block_positions`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `mdl_blocposi_bloconpagsub_uix` (`blockinstanceid`,`contextid`,`pagetype`,`subpage`), ADD KEY `mdl_blocposi_blo_ix` (`blockinstanceid`), ADD KEY `mdl_blocposi_con_ix` (`contextid`);

--
-- Indexes for table `mdl_block_quickmail_alternate`
--
ALTER TABLE `mdl_block_quickmail_alternate`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mdl_block_quickmail_config`
--
ALTER TABLE `mdl_block_quickmail_config`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mdl_block_quickmail_drafts`
--
ALTER TABLE `mdl_block_quickmail_drafts`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mdl_block_quickmail_log`
--
ALTER TABLE `mdl_block_quickmail_log`
 ADD PRIMARY KEY (`id`), ADD KEY `mdl_blocquiclog_cou_ix` (`courseid`), ADD KEY `mdl_blocquiclog_use_ix` (`userid`);

--
-- Indexes for table `mdl_block_quickmail_signatures`
--
ALTER TABLE `mdl_block_quickmail_signatures`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mdl_block_recent_activity`
--
ALTER TABLE `mdl_block_recent_activity`
 ADD PRIMARY KEY (`id`), ADD KEY `mdl_blocreceacti_coutim_ix` (`courseid`,`timecreated`);

--
-- Indexes for table `mdl_block_rss_client`
--
ALTER TABLE `mdl_block_rss_client`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mdl_blog_association`
--
ALTER TABLE `mdl_blog_association`
 ADD PRIMARY KEY (`id`), ADD KEY `mdl_blogasso_con_ix` (`contextid`), ADD KEY `mdl_blogasso_blo_ix` (`blogid`);

--
-- Indexes for table `mdl_blog_external`
--
ALTER TABLE `mdl_blog_external`
 ADD PRIMARY KEY (`id`), ADD KEY `mdl_blogexte_use_ix` (`userid`);

--
-- Indexes for table `mdl_book`
--
ALTER TABLE `mdl_book`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mdl_book_chapters`
--
ALTER TABLE `mdl_book_chapters`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mdl_cache_filters`
--
ALTER TABLE `mdl_cache_filters`
 ADD PRIMARY KEY (`id`), ADD KEY `mdl_cachfilt_filmd5_ix` (`filter`,`md5key`);

--
-- Indexes for table `mdl_cache_flags`
--
ALTER TABLE `mdl_cache_flags`
 ADD PRIMARY KEY (`id`), ADD KEY `mdl_cachflag_fla_ix` (`flagtype`), ADD KEY `mdl_cachflag_nam_ix` (`name`);

--
-- Indexes for table `mdl_capabilities`
--
ALTER TABLE `mdl_capabilities`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `mdl_capa_nam_uix` (`name`);

--
-- Indexes for table `mdl_chat`
--
ALTER TABLE `mdl_chat`
 ADD PRIMARY KEY (`id`), ADD KEY `mdl_chat_cou_ix` (`course`);

--
-- Indexes for table `mdl_chat_messages`
--
ALTER TABLE `mdl_chat_messages`
 ADD PRIMARY KEY (`id`), ADD KEY `mdl_chatmess_use_ix` (`userid`), ADD KEY `mdl_chatmess_gro_ix` (`groupid`), ADD KEY `mdl_chatmess_timcha_ix` (`timestamp`,`chatid`), ADD KEY `mdl_chatmess_cha_ix` (`chatid`);

--
-- Indexes for table `mdl_chat_messages_current`
--
ALTER TABLE `mdl_chat_messages_current`
 ADD PRIMARY KEY (`id`), ADD KEY `mdl_chatmesscurr_use_ix` (`userid`), ADD KEY `mdl_chatmesscurr_gro_ix` (`groupid`), ADD KEY `mdl_chatmesscurr_timcha_ix` (`timestamp`,`chatid`), ADD KEY `mdl_chatmesscurr_cha_ix` (`chatid`);

--
-- Indexes for table `mdl_chat_users`
--
ALTER TABLE `mdl_chat_users`
 ADD PRIMARY KEY (`id`), ADD KEY `mdl_chatuser_use_ix` (`userid`), ADD KEY `mdl_chatuser_las_ix` (`lastping`), ADD KEY `mdl_chatuser_gro_ix` (`groupid`), ADD KEY `mdl_chatuser_cha_ix` (`chatid`);

--
-- Indexes for table `mdl_choice`
--
ALTER TABLE `mdl_choice`
 ADD PRIMARY KEY (`id`), ADD KEY `mdl_choi_cou_ix` (`course`);

--
-- Indexes for table `mdl_choice_answers`
--
ALTER TABLE `mdl_choice_answers`
 ADD PRIMARY KEY (`id`), ADD KEY `mdl_choiansw_use_ix` (`userid`), ADD KEY `mdl_choiansw_cho_ix` (`choiceid`), ADD KEY `mdl_choiansw_opt_ix` (`optionid`);

--
-- Indexes for table `mdl_choice_options`
--
ALTER TABLE `mdl_choice_options`
 ADD PRIMARY KEY (`id`), ADD KEY `mdl_choiopti_cho_ix` (`choiceid`);

--
-- Indexes for table `mdl_cohort`
--
ALTER TABLE `mdl_cohort`
 ADD PRIMARY KEY (`id`), ADD KEY `mdl_coho_con_ix` (`contextid`);

--
-- Indexes for table `mdl_cohort_members`
--
ALTER TABLE `mdl_cohort_members`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `mdl_cohomemb_cohuse_uix` (`cohortid`,`userid`), ADD KEY `mdl_cohomemb_coh_ix` (`cohortid`), ADD KEY `mdl_cohomemb_use_ix` (`userid`);

--
-- Indexes for table `mdl_comments`
--
ALTER TABLE `mdl_comments`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mdl_config`
--
ALTER TABLE `mdl_config`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `mdl_conf_nam_uix` (`name`);

--
-- Indexes for table `mdl_config_log`
--
ALTER TABLE `mdl_config_log`
 ADD PRIMARY KEY (`id`), ADD KEY `mdl_conflog_tim_ix` (`timemodified`), ADD KEY `mdl_conflog_use_ix` (`userid`);

--
-- Indexes for table `mdl_config_plugins`
--
ALTER TABLE `mdl_config_plugins`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `mdl_confplug_plunam_uix` (`plugin`,`name`);

--
-- Indexes for table `mdl_context`
--
ALTER TABLE `mdl_context`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `mdl_cont_conins_uix` (`contextlevel`,`instanceid`), ADD KEY `mdl_cont_ins_ix` (`instanceid`), ADD KEY `mdl_cont_pat_ix` (`path`);

--
-- Indexes for table `mdl_context_temp`
--
ALTER TABLE `mdl_context_temp`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mdl_course`
--
ALTER TABLE `mdl_course`
 ADD PRIMARY KEY (`id`), ADD KEY `mdl_cour_cat_ix` (`category`), ADD KEY `mdl_cour_idn_ix` (`idnumber`), ADD KEY `mdl_cour_sho_ix` (`shortname`), ADD KEY `mdl_cour_sor_ix` (`sortorder`);

--
-- Indexes for table `mdl_course_categories`
--
ALTER TABLE `mdl_course_categories`
 ADD PRIMARY KEY (`id`), ADD KEY `mdl_courcate_par_ix` (`parent`);

--
-- Indexes for table `mdl_course_completions`
--
ALTER TABLE `mdl_course_completions`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `mdl_courcomp_usecou_uix` (`userid`,`course`), ADD KEY `mdl_courcomp_use_ix` (`userid`), ADD KEY `mdl_courcomp_cou_ix` (`course`), ADD KEY `mdl_courcomp_tim_ix` (`timecompleted`);

--
-- Indexes for table `mdl_course_completion_aggr_methd`
--
ALTER TABLE `mdl_course_completion_aggr_methd`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `mdl_courcompaggrmeth_coucr_uix` (`course`,`criteriatype`), ADD KEY `mdl_courcompaggrmeth_cou_ix` (`course`), ADD KEY `mdl_courcompaggrmeth_cri_ix` (`criteriatype`);

--
-- Indexes for table `mdl_course_completion_criteria`
--
ALTER TABLE `mdl_course_completion_criteria`
 ADD PRIMARY KEY (`id`), ADD KEY `mdl_courcompcrit_cou_ix` (`course`);

--
-- Indexes for table `mdl_course_completion_crit_compl`
--
ALTER TABLE `mdl_course_completion_crit_compl`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `mdl_courcompcritcomp_useco_uix` (`userid`,`course`,`criteriaid`), ADD KEY `mdl_courcompcritcomp_use_ix` (`userid`), ADD KEY `mdl_courcompcritcomp_cou_ix` (`course`), ADD KEY `mdl_courcompcritcomp_cri_ix` (`criteriaid`), ADD KEY `mdl_courcompcritcomp_tim_ix` (`timecompleted`);

--
-- Indexes for table `mdl_course_format_options`
--
ALTER TABLE `mdl_course_format_options`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `mdl_courformopti_couforsec_uix` (`courseid`,`format`,`sectionid`,`name`), ADD KEY `mdl_courformopti_cou_ix` (`courseid`);

--
-- Indexes for table `mdl_course_modules`
--
ALTER TABLE `mdl_course_modules`
 ADD PRIMARY KEY (`id`), ADD KEY `mdl_courmodu_vis_ix` (`visible`), ADD KEY `mdl_courmodu_cou_ix` (`course`), ADD KEY `mdl_courmodu_mod_ix` (`module`), ADD KEY `mdl_courmodu_ins_ix` (`instance`), ADD KEY `mdl_courmodu_idncou_ix` (`idnumber`,`course`), ADD KEY `mdl_courmodu_gro_ix` (`groupingid`);

--
-- Indexes for table `mdl_course_modules_completion`
--
ALTER TABLE `mdl_course_modules_completion`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `mdl_courmoducomp_usecou_uix` (`userid`,`coursemoduleid`), ADD KEY `mdl_courmoducomp_cou_ix` (`coursemoduleid`);

--
-- Indexes for table `mdl_course_published`
--
ALTER TABLE `mdl_course_published`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mdl_course_request`
--
ALTER TABLE `mdl_course_request`
 ADD PRIMARY KEY (`id`), ADD KEY `mdl_courrequ_sho_ix` (`shortname`);

--
-- Indexes for table `mdl_course_sections`
--
ALTER TABLE `mdl_course_sections`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `mdl_coursect_cousec_uix` (`course`,`section`);

--
-- Indexes for table `mdl_data`
--
ALTER TABLE `mdl_data`
 ADD PRIMARY KEY (`id`), ADD KEY `mdl_data_cou_ix` (`course`);

--
-- Indexes for table `mdl_data_content`
--
ALTER TABLE `mdl_data_content`
 ADD PRIMARY KEY (`id`), ADD KEY `mdl_datacont_rec_ix` (`recordid`), ADD KEY `mdl_datacont_fie_ix` (`fieldid`);

--
-- Indexes for table `mdl_data_fields`
--
ALTER TABLE `mdl_data_fields`
 ADD PRIMARY KEY (`id`), ADD KEY `mdl_datafiel_typdat_ix` (`type`,`dataid`), ADD KEY `mdl_datafiel_dat_ix` (`dataid`);

--
-- Indexes for table `mdl_data_records`
--
ALTER TABLE `mdl_data_records`
 ADD PRIMARY KEY (`id`), ADD KEY `mdl_datareco_dat_ix` (`dataid`);

--
-- Indexes for table `mdl_enrol`
--
ALTER TABLE `mdl_enrol`
 ADD PRIMARY KEY (`id`), ADD KEY `mdl_enro_enr_ix` (`enrol`), ADD KEY `mdl_enro_cou_ix` (`courseid`);

--
-- Indexes for table `mdl_enrol_flatfile`
--
ALTER TABLE `mdl_enrol_flatfile`
 ADD PRIMARY KEY (`id`), ADD KEY `mdl_enroflat_cou_ix` (`courseid`), ADD KEY `mdl_enroflat_use_ix` (`userid`), ADD KEY `mdl_enroflat_rol_ix` (`roleid`);

--
-- Indexes for table `mdl_enrol_paypal`
--
ALTER TABLE `mdl_enrol_paypal`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mdl_event`
--
ALTER TABLE `mdl_event`
 ADD PRIMARY KEY (`id`), ADD KEY `mdl_even_cou_ix` (`courseid`), ADD KEY `mdl_even_use_ix` (`userid`), ADD KEY `mdl_even_tim_ix` (`timestart`), ADD KEY `mdl_even_tim2_ix` (`timeduration`), ADD KEY `mdl_even_grocouvisuse_ix` (`groupid`,`courseid`,`visible`,`userid`);

--
-- Indexes for table `mdl_events_handlers`
--
ALTER TABLE `mdl_events_handlers`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `mdl_evenhand_evecom_uix` (`eventname`,`component`);

--
-- Indexes for table `mdl_events_queue`
--
ALTER TABLE `mdl_events_queue`
 ADD PRIMARY KEY (`id`), ADD KEY `mdl_evenqueu_use_ix` (`userid`);

--
-- Indexes for table `mdl_events_queue_handlers`
--
ALTER TABLE `mdl_events_queue_handlers`
 ADD PRIMARY KEY (`id`), ADD KEY `mdl_evenqueuhand_que_ix` (`queuedeventid`), ADD KEY `mdl_evenqueuhand_han_ix` (`handlerid`);

--
-- Indexes for table `mdl_event_subscriptions`
--
ALTER TABLE `mdl_event_subscriptions`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mdl_external_functions`
--
ALTER TABLE `mdl_external_functions`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `mdl_extefunc_nam_uix` (`name`);

--
-- Indexes for table `mdl_external_services`
--
ALTER TABLE `mdl_external_services`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `mdl_exteserv_nam_uix` (`name`);

--
-- Indexes for table `mdl_external_services_functions`
--
ALTER TABLE `mdl_external_services_functions`
 ADD PRIMARY KEY (`id`), ADD KEY `mdl_exteservfunc_ext_ix` (`externalserviceid`);

--
-- Indexes for table `mdl_external_services_users`
--
ALTER TABLE `mdl_external_services_users`
 ADD PRIMARY KEY (`id`), ADD KEY `mdl_exteservuser_ext_ix` (`externalserviceid`), ADD KEY `mdl_exteservuser_use_ix` (`userid`);

--
-- Indexes for table `mdl_external_tokens`
--
ALTER TABLE `mdl_external_tokens`
 ADD PRIMARY KEY (`id`), ADD KEY `mdl_extetoke_use_ix` (`userid`), ADD KEY `mdl_extetoke_ext_ix` (`externalserviceid`), ADD KEY `mdl_extetoke_con_ix` (`contextid`), ADD KEY `mdl_extetoke_cre_ix` (`creatorid`);

--
-- Indexes for table `mdl_feedback`
--
ALTER TABLE `mdl_feedback`
 ADD PRIMARY KEY (`id`), ADD KEY `mdl_feed_cou_ix` (`course`);

--
-- Indexes for table `mdl_feedback_completed`
--
ALTER TABLE `mdl_feedback_completed`
 ADD PRIMARY KEY (`id`), ADD KEY `mdl_feedcomp_use_ix` (`userid`), ADD KEY `mdl_feedcomp_fee_ix` (`feedback`);

--
-- Indexes for table `mdl_feedback_completedtmp`
--
ALTER TABLE `mdl_feedback_completedtmp`
 ADD PRIMARY KEY (`id`), ADD KEY `mdl_feedcomp_use2_ix` (`userid`), ADD KEY `mdl_feedcomp_fee2_ix` (`feedback`);

--
-- Indexes for table `mdl_feedback_item`
--
ALTER TABLE `mdl_feedback_item`
 ADD PRIMARY KEY (`id`), ADD KEY `mdl_feeditem_fee_ix` (`feedback`), ADD KEY `mdl_feeditem_tem_ix` (`template`);

--
-- Indexes for table `mdl_feedback_sitecourse_map`
--
ALTER TABLE `mdl_feedback_sitecourse_map`
 ADD PRIMARY KEY (`id`), ADD KEY `mdl_feedsitemap_cou_ix` (`courseid`), ADD KEY `mdl_feedsitemap_fee_ix` (`feedbackid`);

--
-- Indexes for table `mdl_feedback_template`
--
ALTER TABLE `mdl_feedback_template`
 ADD PRIMARY KEY (`id`), ADD KEY `mdl_feedtemp_cou_ix` (`course`);

--
-- Indexes for table `mdl_feedback_tracking`
--
ALTER TABLE `mdl_feedback_tracking`
 ADD PRIMARY KEY (`id`), ADD KEY `mdl_feedtrac_use_ix` (`userid`), ADD KEY `mdl_feedtrac_fee_ix` (`feedback`), ADD KEY `mdl_feedtrac_com_ix` (`completed`);

--
-- Indexes for table `mdl_feedback_value`
--
ALTER TABLE `mdl_feedback_value`
 ADD PRIMARY KEY (`id`), ADD KEY `mdl_feedvalu_cou_ix` (`course_id`), ADD KEY `mdl_feedvalu_ite_ix` (`item`);

--
-- Indexes for table `mdl_feedback_valuetmp`
--
ALTER TABLE `mdl_feedback_valuetmp`
 ADD PRIMARY KEY (`id`), ADD KEY `mdl_feedvalu_cou2_ix` (`course_id`), ADD KEY `mdl_feedvalu_ite2_ix` (`item`);

--
-- Indexes for table `mdl_files`
--
ALTER TABLE `mdl_files`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `mdl_file_pat_uix` (`pathnamehash`), ADD KEY `mdl_file_comfilconite_ix` (`component`,`filearea`,`contextid`,`itemid`), ADD KEY `mdl_file_con_ix` (`contenthash`), ADD KEY `mdl_file_con2_ix` (`contextid`), ADD KEY `mdl_file_use_ix` (`userid`), ADD KEY `mdl_file_ref_ix` (`referencefileid`);

--
-- Indexes for table `mdl_files_reference`
--
ALTER TABLE `mdl_files_reference`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `mdl_filerefe_repref_uix` (`repositoryid`,`referencehash`), ADD KEY `mdl_filerefe_rep_ix` (`repositoryid`);

--
-- Indexes for table `mdl_filter_active`
--
ALTER TABLE `mdl_filter_active`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `mdl_filtacti_confil_uix` (`contextid`,`filter`), ADD KEY `mdl_filtacti_con_ix` (`contextid`);

--
-- Indexes for table `mdl_filter_config`
--
ALTER TABLE `mdl_filter_config`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `mdl_filtconf_confilnam_uix` (`contextid`,`filter`,`name`), ADD KEY `mdl_filtconf_con_ix` (`contextid`);

--
-- Indexes for table `mdl_folder`
--
ALTER TABLE `mdl_folder`
 ADD PRIMARY KEY (`id`), ADD KEY `mdl_fold_cou_ix` (`course`);

--
-- Indexes for table `mdl_forum`
--
ALTER TABLE `mdl_forum`
 ADD PRIMARY KEY (`id`), ADD KEY `mdl_foru_cou_ix` (`course`);

--
-- Indexes for table `mdl_forum_digests`
--
ALTER TABLE `mdl_forum_digests`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `mdl_forudige_forusemai_uix` (`forum`,`userid`,`maildigest`), ADD KEY `mdl_forudige_use_ix` (`userid`), ADD KEY `mdl_forudige_for_ix` (`forum`);

--
-- Indexes for table `mdl_forum_discussions`
--
ALTER TABLE `mdl_forum_discussions`
 ADD PRIMARY KEY (`id`), ADD KEY `mdl_forudisc_use_ix` (`userid`), ADD KEY `mdl_forudisc_for_ix` (`forum`);

--
-- Indexes for table `mdl_forum_posts`
--
ALTER TABLE `mdl_forum_posts`
 ADD PRIMARY KEY (`id`), ADD KEY `mdl_forupost_use_ix` (`userid`), ADD KEY `mdl_forupost_cre_ix` (`created`), ADD KEY `mdl_forupost_mai_ix` (`mailed`), ADD KEY `mdl_forupost_dis_ix` (`discussion`), ADD KEY `mdl_forupost_par_ix` (`parent`);

--
-- Indexes for table `mdl_forum_queue`
--
ALTER TABLE `mdl_forum_queue`
 ADD PRIMARY KEY (`id`), ADD KEY `mdl_foruqueu_use_ix` (`userid`), ADD KEY `mdl_foruqueu_dis_ix` (`discussionid`), ADD KEY `mdl_foruqueu_pos_ix` (`postid`);

--
-- Indexes for table `mdl_forum_read`
--
ALTER TABLE `mdl_forum_read`
 ADD PRIMARY KEY (`id`), ADD KEY `mdl_foruread_usefor_ix` (`userid`,`forumid`), ADD KEY `mdl_foruread_usedis_ix` (`userid`,`discussionid`), ADD KEY `mdl_foruread_posuse_ix` (`postid`,`userid`);

--
-- Indexes for table `mdl_forum_subscriptions`
--
ALTER TABLE `mdl_forum_subscriptions`
 ADD PRIMARY KEY (`id`), ADD KEY `mdl_forusubs_use_ix` (`userid`), ADD KEY `mdl_forusubs_for_ix` (`forum`);

--
-- Indexes for table `mdl_forum_track_prefs`
--
ALTER TABLE `mdl_forum_track_prefs`
 ADD PRIMARY KEY (`id`), ADD KEY `mdl_forutracpref_usefor_ix` (`userid`,`forumid`);

--
-- Indexes for table `mdl_glossary`
--
ALTER TABLE `mdl_glossary`
 ADD PRIMARY KEY (`id`), ADD KEY `mdl_glos_cou_ix` (`course`);

--
-- Indexes for table `mdl_glossary_alias`
--
ALTER TABLE `mdl_glossary_alias`
 ADD PRIMARY KEY (`id`), ADD KEY `mdl_glosalia_ent_ix` (`entryid`);

--
-- Indexes for table `mdl_glossary_categories`
--
ALTER TABLE `mdl_glossary_categories`
 ADD PRIMARY KEY (`id`), ADD KEY `mdl_gloscate_glo_ix` (`glossaryid`);

--
-- Indexes for table `mdl_glossary_entries`
--
ALTER TABLE `mdl_glossary_entries`
 ADD PRIMARY KEY (`id`), ADD KEY `mdl_glosentr_use_ix` (`userid`), ADD KEY `mdl_glosentr_con_ix` (`concept`), ADD KEY `mdl_glosentr_glo_ix` (`glossaryid`);

--
-- Indexes for table `mdl_glossary_entries_categories`
--
ALTER TABLE `mdl_glossary_entries_categories`
 ADD PRIMARY KEY (`id`), ADD KEY `mdl_glosentrcate_cat_ix` (`categoryid`), ADD KEY `mdl_glosentrcate_ent_ix` (`entryid`);

--
-- Indexes for table `mdl_glossary_formats`
--
ALTER TABLE `mdl_glossary_formats`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mdl_grade_categories`
--
ALTER TABLE `mdl_grade_categories`
 ADD PRIMARY KEY (`id`), ADD KEY `mdl_gradcate_cou_ix` (`courseid`), ADD KEY `mdl_gradcate_par_ix` (`parent`);

--
-- Indexes for table `mdl_grade_categories_history`
--
ALTER TABLE `mdl_grade_categories_history`
 ADD PRIMARY KEY (`id`), ADD KEY `mdl_gradcatehist_act_ix` (`action`), ADD KEY `mdl_gradcatehist_old_ix` (`oldid`), ADD KEY `mdl_gradcatehist_cou_ix` (`courseid`), ADD KEY `mdl_gradcatehist_par_ix` (`parent`), ADD KEY `mdl_gradcatehist_log_ix` (`loggeduser`);

--
-- Indexes for table `mdl_grade_grades`
--
ALTER TABLE `mdl_grade_grades`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `mdl_gradgrad_useite_uix` (`userid`,`itemid`), ADD KEY `mdl_gradgrad_locloc_ix` (`locked`,`locktime`), ADD KEY `mdl_gradgrad_ite_ix` (`itemid`), ADD KEY `mdl_gradgrad_use_ix` (`userid`), ADD KEY `mdl_gradgrad_raw_ix` (`rawscaleid`), ADD KEY `mdl_gradgrad_use2_ix` (`usermodified`);

--
-- Indexes for table `mdl_grade_grades_history`
--
ALTER TABLE `mdl_grade_grades_history`
 ADD PRIMARY KEY (`id`), ADD KEY `mdl_gradgradhist_act_ix` (`action`), ADD KEY `mdl_gradgradhist_tim_ix` (`timemodified`), ADD KEY `mdl_gradgradhist_old_ix` (`oldid`), ADD KEY `mdl_gradgradhist_ite_ix` (`itemid`), ADD KEY `mdl_gradgradhist_use_ix` (`userid`), ADD KEY `mdl_gradgradhist_raw_ix` (`rawscaleid`), ADD KEY `mdl_gradgradhist_use2_ix` (`usermodified`), ADD KEY `mdl_gradgradhist_log_ix` (`loggeduser`);

--
-- Indexes for table `mdl_grade_import_newitem`
--
ALTER TABLE `mdl_grade_import_newitem`
 ADD PRIMARY KEY (`id`), ADD KEY `mdl_gradimponewi_imp_ix` (`importer`);

--
-- Indexes for table `mdl_grade_import_values`
--
ALTER TABLE `mdl_grade_import_values`
 ADD PRIMARY KEY (`id`), ADD KEY `mdl_gradimpovalu_ite_ix` (`itemid`), ADD KEY `mdl_gradimpovalu_new_ix` (`newgradeitem`), ADD KEY `mdl_gradimpovalu_imp_ix` (`importer`);

--
-- Indexes for table `mdl_grade_items`
--
ALTER TABLE `mdl_grade_items`
 ADD PRIMARY KEY (`id`), ADD KEY `mdl_graditem_locloc_ix` (`locked`,`locktime`), ADD KEY `mdl_graditem_itenee_ix` (`itemtype`,`needsupdate`), ADD KEY `mdl_graditem_gra_ix` (`gradetype`), ADD KEY `mdl_graditem_idncou_ix` (`idnumber`,`courseid`), ADD KEY `mdl_graditem_cou_ix` (`courseid`), ADD KEY `mdl_graditem_cat_ix` (`categoryid`), ADD KEY `mdl_graditem_sca_ix` (`scaleid`), ADD KEY `mdl_graditem_out_ix` (`outcomeid`);

--
-- Indexes for table `mdl_grade_items_history`
--
ALTER TABLE `mdl_grade_items_history`
 ADD PRIMARY KEY (`id`), ADD KEY `mdl_graditemhist_act_ix` (`action`), ADD KEY `mdl_graditemhist_old_ix` (`oldid`), ADD KEY `mdl_graditemhist_cou_ix` (`courseid`), ADD KEY `mdl_graditemhist_cat_ix` (`categoryid`), ADD KEY `mdl_graditemhist_sca_ix` (`scaleid`), ADD KEY `mdl_graditemhist_out_ix` (`outcomeid`), ADD KEY `mdl_graditemhist_log_ix` (`loggeduser`);

--
-- Indexes for table `mdl_grade_letters`
--
ALTER TABLE `mdl_grade_letters`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `mdl_gradlett_conlowlet_uix` (`contextid`,`lowerboundary`,`letter`);

--
-- Indexes for table `mdl_grade_outcomes`
--
ALTER TABLE `mdl_grade_outcomes`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `mdl_gradoutc_cousho_uix` (`courseid`,`shortname`), ADD KEY `mdl_gradoutc_cou_ix` (`courseid`), ADD KEY `mdl_gradoutc_sca_ix` (`scaleid`), ADD KEY `mdl_gradoutc_use_ix` (`usermodified`);

--
-- Indexes for table `mdl_grade_outcomes_courses`
--
ALTER TABLE `mdl_grade_outcomes_courses`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `mdl_gradoutccour_couout_uix` (`courseid`,`outcomeid`), ADD KEY `mdl_gradoutccour_cou_ix` (`courseid`), ADD KEY `mdl_gradoutccour_out_ix` (`outcomeid`);

--
-- Indexes for table `mdl_grade_outcomes_history`
--
ALTER TABLE `mdl_grade_outcomes_history`
 ADD PRIMARY KEY (`id`), ADD KEY `mdl_gradoutchist_act_ix` (`action`), ADD KEY `mdl_gradoutchist_old_ix` (`oldid`), ADD KEY `mdl_gradoutchist_cou_ix` (`courseid`), ADD KEY `mdl_gradoutchist_sca_ix` (`scaleid`), ADD KEY `mdl_gradoutchist_log_ix` (`loggeduser`);

--
-- Indexes for table `mdl_grade_settings`
--
ALTER TABLE `mdl_grade_settings`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `mdl_gradsett_counam_uix` (`courseid`,`name`), ADD KEY `mdl_gradsett_cou_ix` (`courseid`);

--
-- Indexes for table `mdl_gradingform_guide_comments`
--
ALTER TABLE `mdl_gradingform_guide_comments`
 ADD PRIMARY KEY (`id`), ADD KEY `mdl_gradguidcomm_def_ix` (`definitionid`);

--
-- Indexes for table `mdl_gradingform_guide_criteria`
--
ALTER TABLE `mdl_gradingform_guide_criteria`
 ADD PRIMARY KEY (`id`), ADD KEY `mdl_gradguidcrit_def_ix` (`definitionid`);

--
-- Indexes for table `mdl_gradingform_guide_fillings`
--
ALTER TABLE `mdl_gradingform_guide_fillings`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `mdl_gradguidfill_inscri_uix` (`instanceid`,`criterionid`), ADD KEY `mdl_gradguidfill_ins_ix` (`instanceid`), ADD KEY `mdl_gradguidfill_cri_ix` (`criterionid`);

--
-- Indexes for table `mdl_gradingform_rubric_criteria`
--
ALTER TABLE `mdl_gradingform_rubric_criteria`
 ADD PRIMARY KEY (`id`), ADD KEY `mdl_gradrubrcrit_def_ix` (`definitionid`);

--
-- Indexes for table `mdl_gradingform_rubric_fillings`
--
ALTER TABLE `mdl_gradingform_rubric_fillings`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `mdl_gradrubrfill_inscri_uix` (`instanceid`,`criterionid`), ADD KEY `mdl_gradrubrfill_lev_ix` (`levelid`), ADD KEY `mdl_gradrubrfill_ins_ix` (`instanceid`), ADD KEY `mdl_gradrubrfill_cri_ix` (`criterionid`);

--
-- Indexes for table `mdl_gradingform_rubric_levels`
--
ALTER TABLE `mdl_gradingform_rubric_levels`
 ADD PRIMARY KEY (`id`), ADD KEY `mdl_gradrubrleve_cri_ix` (`criterionid`);

--
-- Indexes for table `mdl_grading_areas`
--
ALTER TABLE `mdl_grading_areas`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `mdl_gradarea_concomare_uix` (`contextid`,`component`,`areaname`), ADD KEY `mdl_gradarea_con_ix` (`contextid`);

--
-- Indexes for table `mdl_grading_definitions`
--
ALTER TABLE `mdl_grading_definitions`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `mdl_graddefi_aremet_uix` (`areaid`,`method`), ADD KEY `mdl_graddefi_are_ix` (`areaid`), ADD KEY `mdl_graddefi_use_ix` (`usermodified`), ADD KEY `mdl_graddefi_use2_ix` (`usercreated`);

--
-- Indexes for table `mdl_grading_instances`
--
ALTER TABLE `mdl_grading_instances`
 ADD PRIMARY KEY (`id`), ADD KEY `mdl_gradinst_def_ix` (`definitionid`), ADD KEY `mdl_gradinst_rat_ix` (`raterid`);

--
-- Indexes for table `mdl_groupings`
--
ALTER TABLE `mdl_groupings`
 ADD PRIMARY KEY (`id`), ADD KEY `mdl_grou_idn2_ix` (`idnumber`), ADD KEY `mdl_grou_cou2_ix` (`courseid`);

--
-- Indexes for table `mdl_groupings_groups`
--
ALTER TABLE `mdl_groupings_groups`
 ADD PRIMARY KEY (`id`), ADD KEY `mdl_grougrou_gro_ix` (`groupingid`), ADD KEY `mdl_grougrou_gro2_ix` (`groupid`);

--
-- Indexes for table `mdl_groups`
--
ALTER TABLE `mdl_groups`
 ADD PRIMARY KEY (`id`), ADD KEY `mdl_grou_idn_ix` (`idnumber`), ADD KEY `mdl_grou_cou_ix` (`courseid`);

--
-- Indexes for table `mdl_groups_members`
--
ALTER TABLE `mdl_groups_members`
 ADD PRIMARY KEY (`id`), ADD KEY `mdl_groumemb_gro_ix` (`groupid`), ADD KEY `mdl_groumemb_use_ix` (`userid`);

--
-- Indexes for table `mdl_imscp`
--
ALTER TABLE `mdl_imscp`
 ADD PRIMARY KEY (`id`), ADD KEY `mdl_imsc_cou_ix` (`course`);

--
-- Indexes for table `mdl_label`
--
ALTER TABLE `mdl_label`
 ADD PRIMARY KEY (`id`), ADD KEY `mdl_labe_cou_ix` (`course`);

--
-- Indexes for table `mdl_lesson`
--
ALTER TABLE `mdl_lesson`
 ADD PRIMARY KEY (`id`), ADD KEY `mdl_less_cou_ix` (`course`);

--
-- Indexes for table `mdl_lesson_answers`
--
ALTER TABLE `mdl_lesson_answers`
 ADD PRIMARY KEY (`id`), ADD KEY `mdl_lessansw_les_ix` (`lessonid`), ADD KEY `mdl_lessansw_pag_ix` (`pageid`);

--
-- Indexes for table `mdl_lesson_attempts`
--
ALTER TABLE `mdl_lesson_attempts`
 ADD PRIMARY KEY (`id`), ADD KEY `mdl_lessatte_use_ix` (`userid`), ADD KEY `mdl_lessatte_les_ix` (`lessonid`), ADD KEY `mdl_lessatte_pag_ix` (`pageid`), ADD KEY `mdl_lessatte_ans_ix` (`answerid`);

--
-- Indexes for table `mdl_lesson_branch`
--
ALTER TABLE `mdl_lesson_branch`
 ADD PRIMARY KEY (`id`), ADD KEY `mdl_lessbran_use_ix` (`userid`), ADD KEY `mdl_lessbran_les_ix` (`lessonid`), ADD KEY `mdl_lessbran_pag_ix` (`pageid`);

--
-- Indexes for table `mdl_lesson_grades`
--
ALTER TABLE `mdl_lesson_grades`
 ADD PRIMARY KEY (`id`), ADD KEY `mdl_lessgrad_use_ix` (`userid`), ADD KEY `mdl_lessgrad_les_ix` (`lessonid`);

--
-- Indexes for table `mdl_lesson_high_scores`
--
ALTER TABLE `mdl_lesson_high_scores`
 ADD PRIMARY KEY (`id`), ADD KEY `mdl_lesshighscor_use_ix` (`userid`), ADD KEY `mdl_lesshighscor_les_ix` (`lessonid`);

--
-- Indexes for table `mdl_lesson_pages`
--
ALTER TABLE `mdl_lesson_pages`
 ADD PRIMARY KEY (`id`), ADD KEY `mdl_lesspage_les_ix` (`lessonid`);

--
-- Indexes for table `mdl_lesson_timer`
--
ALTER TABLE `mdl_lesson_timer`
 ADD PRIMARY KEY (`id`), ADD KEY `mdl_lesstime_use_ix` (`userid`), ADD KEY `mdl_lesstime_les_ix` (`lessonid`);

--
-- Indexes for table `mdl_license`
--
ALTER TABLE `mdl_license`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mdl_lock_db`
--
ALTER TABLE `mdl_lock_db`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `mdl_lockdb_res_uix` (`resourcekey`), ADD KEY `mdl_lockdb_exp_ix` (`expires`), ADD KEY `mdl_lockdb_own_ix` (`owner`);

--
-- Indexes for table `mdl_log`
--
ALTER TABLE `mdl_log`
 ADD PRIMARY KEY (`id`), ADD KEY `mdl_log_coumodact_ix` (`course`,`module`,`action`), ADD KEY `mdl_log_tim_ix` (`time`), ADD KEY `mdl_log_act_ix` (`action`), ADD KEY `mdl_log_usecou_ix` (`userid`,`course`), ADD KEY `mdl_log_cmi_ix` (`cmid`);

--
-- Indexes for table `mdl_logstore_standard_log`
--
ALTER TABLE `mdl_logstore_standard_log`
 ADD PRIMARY KEY (`id`), ADD KEY `mdl_logsstanlog_tim_ix` (`timecreated`), ADD KEY `mdl_logsstanlog_couanotim_ix` (`courseid`,`anonymous`,`timecreated`), ADD KEY `mdl_logsstanlog_useconconcr_ix` (`userid`,`contextlevel`,`contextinstanceid`,`crud`,`edulevel`,`timecreated`);

--
-- Indexes for table `mdl_log_display`
--
ALTER TABLE `mdl_log_display`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `mdl_logdisp_modact_uix` (`module`,`action`);

--
-- Indexes for table `mdl_log_queries`
--
ALTER TABLE `mdl_log_queries`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mdl_lti`
--
ALTER TABLE `mdl_lti`
 ADD PRIMARY KEY (`id`), ADD KEY `mdl_lti_cou_ix` (`course`);

--
-- Indexes for table `mdl_lti_submission`
--
ALTER TABLE `mdl_lti_submission`
 ADD PRIMARY KEY (`id`), ADD KEY `mdl_ltisubm_lti_ix` (`ltiid`);

--
-- Indexes for table `mdl_lti_types`
--
ALTER TABLE `mdl_lti_types`
 ADD PRIMARY KEY (`id`), ADD KEY `mdl_ltitype_cou_ix` (`course`), ADD KEY `mdl_ltitype_too_ix` (`tooldomain`);

--
-- Indexes for table `mdl_lti_types_config`
--
ALTER TABLE `mdl_lti_types_config`
 ADD PRIMARY KEY (`id`), ADD KEY `mdl_ltitypeconf_typ_ix` (`typeid`);

--
-- Indexes for table `mdl_message`
--
ALTER TABLE `mdl_message`
 ADD PRIMARY KEY (`id`), ADD KEY `mdl_mess_use_ix` (`useridfrom`), ADD KEY `mdl_mess_use2_ix` (`useridto`);

--
-- Indexes for table `mdl_message_airnotifier_devices`
--
ALTER TABLE `mdl_message_airnotifier_devices`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `mdl_messairndevi_use_uix` (`userdeviceid`);

--
-- Indexes for table `mdl_message_contacts`
--
ALTER TABLE `mdl_message_contacts`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `mdl_messcont_usecon_uix` (`userid`,`contactid`);

--
-- Indexes for table `mdl_message_processors`
--
ALTER TABLE `mdl_message_processors`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mdl_message_providers`
--
ALTER TABLE `mdl_message_providers`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `mdl_messprov_comnam_uix` (`component`,`name`);

--
-- Indexes for table `mdl_message_read`
--
ALTER TABLE `mdl_message_read`
 ADD PRIMARY KEY (`id`), ADD KEY `mdl_messread_use_ix` (`useridfrom`), ADD KEY `mdl_messread_use2_ix` (`useridto`);

--
-- Indexes for table `mdl_message_working`
--
ALTER TABLE `mdl_message_working`
 ADD PRIMARY KEY (`id`), ADD KEY `mdl_messwork_unr_ix` (`unreadmessageid`);

--
-- Indexes for table `mdl_mnetservice_enrol_courses`
--
ALTER TABLE `mdl_mnetservice_enrol_courses`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `mdl_mnetenrocour_hosrem_uix` (`hostid`,`remoteid`);

--
-- Indexes for table `mdl_mnetservice_enrol_enrolments`
--
ALTER TABLE `mdl_mnetservice_enrol_enrolments`
 ADD PRIMARY KEY (`id`), ADD KEY `mdl_mnetenroenro_use_ix` (`userid`), ADD KEY `mdl_mnetenroenro_hos_ix` (`hostid`);

--
-- Indexes for table `mdl_mnet_application`
--
ALTER TABLE `mdl_mnet_application`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mdl_mnet_host`
--
ALTER TABLE `mdl_mnet_host`
 ADD PRIMARY KEY (`id`), ADD KEY `mdl_mnethost_app_ix` (`applicationid`);

--
-- Indexes for table `mdl_mnet_host2service`
--
ALTER TABLE `mdl_mnet_host2service`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `mdl_mnethost_hosser_uix` (`hostid`,`serviceid`);

--
-- Indexes for table `mdl_mnet_log`
--
ALTER TABLE `mdl_mnet_log`
 ADD PRIMARY KEY (`id`), ADD KEY `mdl_mnetlog_hosusecou_ix` (`hostid`,`userid`,`course`);

--
-- Indexes for table `mdl_mnet_remote_rpc`
--
ALTER TABLE `mdl_mnet_remote_rpc`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mdl_mnet_remote_service2rpc`
--
ALTER TABLE `mdl_mnet_remote_service2rpc`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `mdl_mnetremoserv_rpcser_uix` (`rpcid`,`serviceid`);

--
-- Indexes for table `mdl_mnet_rpc`
--
ALTER TABLE `mdl_mnet_rpc`
 ADD PRIMARY KEY (`id`), ADD KEY `mdl_mnetrpc_enaxml_ix` (`enabled`,`xmlrpcpath`);

--
-- Indexes for table `mdl_mnet_service`
--
ALTER TABLE `mdl_mnet_service`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mdl_mnet_service2rpc`
--
ALTER TABLE `mdl_mnet_service2rpc`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `mdl_mnetserv_rpcser_uix` (`rpcid`,`serviceid`);

--
-- Indexes for table `mdl_mnet_session`
--
ALTER TABLE `mdl_mnet_session`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `mdl_mnetsess_tok_uix` (`token`);

--
-- Indexes for table `mdl_mnet_sso_access_control`
--
ALTER TABLE `mdl_mnet_sso_access_control`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `mdl_mnetssoaccecont_mneuse_uix` (`mnet_host_id`,`username`);

--
-- Indexes for table `mdl_modules`
--
ALTER TABLE `mdl_modules`
 ADD PRIMARY KEY (`id`), ADD KEY `mdl_modu_nam_ix` (`name`);

--
-- Indexes for table `mdl_my_pages`
--
ALTER TABLE `mdl_my_pages`
 ADD PRIMARY KEY (`id`), ADD KEY `mdl_mypage_usepri_ix` (`userid`,`private`);

--
-- Indexes for table `mdl_page`
--
ALTER TABLE `mdl_page`
 ADD PRIMARY KEY (`id`), ADD KEY `mdl_page_cou_ix` (`course`);

--
-- Indexes for table `mdl_portfolio_instance`
--
ALTER TABLE `mdl_portfolio_instance`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mdl_portfolio_instance_config`
--
ALTER TABLE `mdl_portfolio_instance_config`
 ADD PRIMARY KEY (`id`), ADD KEY `mdl_portinstconf_nam_ix` (`name`), ADD KEY `mdl_portinstconf_ins_ix` (`instance`);

--
-- Indexes for table `mdl_portfolio_instance_user`
--
ALTER TABLE `mdl_portfolio_instance_user`
 ADD PRIMARY KEY (`id`), ADD KEY `mdl_portinstuser_ins_ix` (`instance`), ADD KEY `mdl_portinstuser_use_ix` (`userid`);

--
-- Indexes for table `mdl_portfolio_log`
--
ALTER TABLE `mdl_portfolio_log`
 ADD PRIMARY KEY (`id`), ADD KEY `mdl_portlog_use_ix` (`userid`), ADD KEY `mdl_portlog_por_ix` (`portfolio`);

--
-- Indexes for table `mdl_portfolio_mahara_queue`
--
ALTER TABLE `mdl_portfolio_mahara_queue`
 ADD PRIMARY KEY (`id`), ADD KEY `mdl_portmahaqueu_tok_ix` (`token`), ADD KEY `mdl_portmahaqueu_tra_ix` (`transferid`);

--
-- Indexes for table `mdl_portfolio_tempdata`
--
ALTER TABLE `mdl_portfolio_tempdata`
 ADD PRIMARY KEY (`id`), ADD KEY `mdl_porttemp_use_ix` (`userid`), ADD KEY `mdl_porttemp_ins_ix` (`instance`);

--
-- Indexes for table `mdl_post`
--
ALTER TABLE `mdl_post`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `mdl_post_iduse_uix` (`id`,`userid`), ADD KEY `mdl_post_las_ix` (`lastmodified`), ADD KEY `mdl_post_mod_ix` (`module`), ADD KEY `mdl_post_sub_ix` (`subject`), ADD KEY `mdl_post_use_ix` (`usermodified`);

--
-- Indexes for table `mdl_profiling`
--
ALTER TABLE `mdl_profiling`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `mdl_prof_run_uix` (`runid`), ADD KEY `mdl_prof_urlrun_ix` (`url`,`runreference`), ADD KEY `mdl_prof_timrun_ix` (`timecreated`,`runreference`);

--
-- Indexes for table `mdl_qtype_essay_options`
--
ALTER TABLE `mdl_qtype_essay_options`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `mdl_qtypessaopti_que_uix` (`questionid`);

--
-- Indexes for table `mdl_qtype_match_options`
--
ALTER TABLE `mdl_qtype_match_options`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `mdl_qtypmatcopti_que_uix` (`questionid`);

--
-- Indexes for table `mdl_qtype_match_subquestions`
--
ALTER TABLE `mdl_qtype_match_subquestions`
 ADD PRIMARY KEY (`id`), ADD KEY `mdl_qtypmatcsubq_que_ix` (`questionid`);

--
-- Indexes for table `mdl_qtype_multichoice_options`
--
ALTER TABLE `mdl_qtype_multichoice_options`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `mdl_qtypmultopti_que_uix` (`questionid`);

--
-- Indexes for table `mdl_qtype_randomsamatch_options`
--
ALTER TABLE `mdl_qtype_randomsamatch_options`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `mdl_qtyprandopti_que_uix` (`questionid`);

--
-- Indexes for table `mdl_qtype_shortanswer_options`
--
ALTER TABLE `mdl_qtype_shortanswer_options`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `mdl_qtypshoropti_que_uix` (`questionid`);

--
-- Indexes for table `mdl_question`
--
ALTER TABLE `mdl_question`
 ADD PRIMARY KEY (`id`), ADD KEY `mdl_ques_cat_ix` (`category`), ADD KEY `mdl_ques_par_ix` (`parent`), ADD KEY `mdl_ques_cre_ix` (`createdby`), ADD KEY `mdl_ques_mod_ix` (`modifiedby`);

--
-- Indexes for table `mdl_question_answers`
--
ALTER TABLE `mdl_question_answers`
 ADD PRIMARY KEY (`id`), ADD KEY `mdl_quesansw_que_ix` (`question`);

--
-- Indexes for table `mdl_question_attempts`
--
ALTER TABLE `mdl_question_attempts`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `mdl_quesatte_queslo_uix` (`questionusageid`,`slot`), ADD KEY `mdl_quesatte_beh_ix` (`behaviour`), ADD KEY `mdl_quesatte_que_ix` (`questionid`), ADD KEY `mdl_quesatte_que2_ix` (`questionusageid`);

--
-- Indexes for table `mdl_question_attempt_steps`
--
ALTER TABLE `mdl_question_attempt_steps`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `mdl_quesattestep_queseq_uix` (`questionattemptid`,`sequencenumber`), ADD KEY `mdl_quesattestep_que_ix` (`questionattemptid`), ADD KEY `mdl_quesattestep_use_ix` (`userid`);

--
-- Indexes for table `mdl_question_attempt_step_data`
--
ALTER TABLE `mdl_question_attempt_step_data`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `mdl_quesattestepdata_attna_uix` (`attemptstepid`,`name`), ADD KEY `mdl_quesattestepdata_att_ix` (`attemptstepid`);

--
-- Indexes for table `mdl_question_calculated`
--
ALTER TABLE `mdl_question_calculated`
 ADD PRIMARY KEY (`id`), ADD KEY `mdl_quescalc_ans_ix` (`answer`), ADD KEY `mdl_quescalc_que_ix` (`question`);

--
-- Indexes for table `mdl_question_calculated_options`
--
ALTER TABLE `mdl_question_calculated_options`
 ADD PRIMARY KEY (`id`), ADD KEY `mdl_quescalcopti_que_ix` (`question`);

--
-- Indexes for table `mdl_question_categories`
--
ALTER TABLE `mdl_question_categories`
 ADD PRIMARY KEY (`id`), ADD KEY `mdl_quescate_con_ix` (`contextid`), ADD KEY `mdl_quescate_par_ix` (`parent`);

--
-- Indexes for table `mdl_question_datasets`
--
ALTER TABLE `mdl_question_datasets`
 ADD PRIMARY KEY (`id`), ADD KEY `mdl_quesdata_quedat_ix` (`question`,`datasetdefinition`), ADD KEY `mdl_quesdata_que_ix` (`question`), ADD KEY `mdl_quesdata_dat_ix` (`datasetdefinition`);

--
-- Indexes for table `mdl_question_dataset_definitions`
--
ALTER TABLE `mdl_question_dataset_definitions`
 ADD PRIMARY KEY (`id`), ADD KEY `mdl_quesdatadefi_cat_ix` (`category`);

--
-- Indexes for table `mdl_question_dataset_items`
--
ALTER TABLE `mdl_question_dataset_items`
 ADD PRIMARY KEY (`id`), ADD KEY `mdl_quesdataitem_def_ix` (`definition`);

--
-- Indexes for table `mdl_question_hints`
--
ALTER TABLE `mdl_question_hints`
 ADD PRIMARY KEY (`id`), ADD KEY `mdl_queshint_que_ix` (`questionid`);

--
-- Indexes for table `mdl_question_multianswer`
--
ALTER TABLE `mdl_question_multianswer`
 ADD PRIMARY KEY (`id`), ADD KEY `mdl_quesmult_que_ix` (`question`);

--
-- Indexes for table `mdl_question_numerical`
--
ALTER TABLE `mdl_question_numerical`
 ADD PRIMARY KEY (`id`), ADD KEY `mdl_quesnume_ans_ix` (`answer`), ADD KEY `mdl_quesnume_que_ix` (`question`);

--
-- Indexes for table `mdl_question_numerical_options`
--
ALTER TABLE `mdl_question_numerical_options`
 ADD PRIMARY KEY (`id`), ADD KEY `mdl_quesnumeopti_que_ix` (`question`);

--
-- Indexes for table `mdl_question_numerical_units`
--
ALTER TABLE `mdl_question_numerical_units`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `mdl_quesnumeunit_queuni_uix` (`question`,`unit`), ADD KEY `mdl_quesnumeunit_que_ix` (`question`);

--
-- Indexes for table `mdl_question_response_analysis`
--
ALTER TABLE `mdl_question_response_analysis`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mdl_question_response_count`
--
ALTER TABLE `mdl_question_response_count`
 ADD PRIMARY KEY (`id`), ADD KEY `mdl_quesrespcoun_ana_ix` (`analysisid`);

--
-- Indexes for table `mdl_question_statistics`
--
ALTER TABLE `mdl_question_statistics`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mdl_question_truefalse`
--
ALTER TABLE `mdl_question_truefalse`
 ADD PRIMARY KEY (`id`), ADD KEY `mdl_questrue_que_ix` (`question`);

--
-- Indexes for table `mdl_question_usages`
--
ALTER TABLE `mdl_question_usages`
 ADD PRIMARY KEY (`id`), ADD KEY `mdl_quesusag_con_ix` (`contextid`);

--
-- Indexes for table `mdl_quiz`
--
ALTER TABLE `mdl_quiz`
 ADD PRIMARY KEY (`id`), ADD KEY `mdl_quiz_cou_ix` (`course`);

--
-- Indexes for table `mdl_quiz_attempts`
--
ALTER TABLE `mdl_quiz_attempts`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `mdl_quizatte_quiuseatt_uix` (`quiz`,`userid`,`attempt`), ADD UNIQUE KEY `mdl_quizatte_uni_uix` (`uniqueid`), ADD KEY `mdl_quizatte_statim_ix` (`state`,`timecheckstate`), ADD KEY `mdl_quizatte_qui_ix` (`quiz`), ADD KEY `mdl_quizatte_use_ix` (`userid`);

--
-- Indexes for table `mdl_quiz_feedback`
--
ALTER TABLE `mdl_quiz_feedback`
 ADD PRIMARY KEY (`id`), ADD KEY `mdl_quizfeed_qui_ix` (`quizid`);

--
-- Indexes for table `mdl_quiz_grades`
--
ALTER TABLE `mdl_quiz_grades`
 ADD PRIMARY KEY (`id`), ADD KEY `mdl_quizgrad_use_ix` (`userid`), ADD KEY `mdl_quizgrad_qui_ix` (`quiz`);

--
-- Indexes for table `mdl_quiz_overrides`
--
ALTER TABLE `mdl_quiz_overrides`
 ADD PRIMARY KEY (`id`), ADD KEY `mdl_quizover_qui_ix` (`quiz`), ADD KEY `mdl_quizover_gro_ix` (`groupid`), ADD KEY `mdl_quizover_use_ix` (`userid`);

--
-- Indexes for table `mdl_quiz_overview_regrades`
--
ALTER TABLE `mdl_quiz_overview_regrades`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mdl_quiz_reports`
--
ALTER TABLE `mdl_quiz_reports`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `mdl_quizrepo_nam_uix` (`name`);

--
-- Indexes for table `mdl_quiz_slots`
--
ALTER TABLE `mdl_quiz_slots`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `mdl_quizslot_quislo_uix` (`quizid`,`slot`), ADD KEY `mdl_quizslot_qui_ix` (`quizid`), ADD KEY `mdl_quizslot_que_ix` (`questionid`);

--
-- Indexes for table `mdl_quiz_statistics`
--
ALTER TABLE `mdl_quiz_statistics`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mdl_rating`
--
ALTER TABLE `mdl_rating`
 ADD PRIMARY KEY (`id`), ADD KEY `mdl_rati_comratconite_ix` (`component`,`ratingarea`,`contextid`,`itemid`), ADD KEY `mdl_rati_con_ix` (`contextid`), ADD KEY `mdl_rati_use_ix` (`userid`);

--
-- Indexes for table `mdl_registration_hubs`
--
ALTER TABLE `mdl_registration_hubs`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mdl_repository`
--
ALTER TABLE `mdl_repository`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mdl_repository_instances`
--
ALTER TABLE `mdl_repository_instances`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mdl_repository_instance_config`
--
ALTER TABLE `mdl_repository_instance_config`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mdl_resource`
--
ALTER TABLE `mdl_resource`
 ADD PRIMARY KEY (`id`), ADD KEY `mdl_reso_cou_ix` (`course`);

--
-- Indexes for table `mdl_resource_old`
--
ALTER TABLE `mdl_resource_old`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `mdl_resoold_old_uix` (`oldid`), ADD KEY `mdl_resoold_cmi_ix` (`cmid`);

--
-- Indexes for table `mdl_role`
--
ALTER TABLE `mdl_role`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `mdl_role_sor_uix` (`sortorder`), ADD UNIQUE KEY `mdl_role_sho_uix` (`shortname`);

--
-- Indexes for table `mdl_role_allow_assign`
--
ALTER TABLE `mdl_role_allow_assign`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `mdl_rolealloassi_rolall_uix` (`roleid`,`allowassign`), ADD KEY `mdl_rolealloassi_rol_ix` (`roleid`), ADD KEY `mdl_rolealloassi_all_ix` (`allowassign`);

--
-- Indexes for table `mdl_role_allow_override`
--
ALTER TABLE `mdl_role_allow_override`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `mdl_rolealloover_rolall_uix` (`roleid`,`allowoverride`), ADD KEY `mdl_rolealloover_rol_ix` (`roleid`), ADD KEY `mdl_rolealloover_all_ix` (`allowoverride`);

--
-- Indexes for table `mdl_role_allow_switch`
--
ALTER TABLE `mdl_role_allow_switch`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `mdl_rolealloswit_rolall_uix` (`roleid`,`allowswitch`), ADD KEY `mdl_rolealloswit_rol_ix` (`roleid`), ADD KEY `mdl_rolealloswit_all_ix` (`allowswitch`);

--
-- Indexes for table `mdl_role_assignments`
--
ALTER TABLE `mdl_role_assignments`
 ADD PRIMARY KEY (`id`), ADD KEY `mdl_roleassi_sor_ix` (`sortorder`), ADD KEY `mdl_roleassi_rolcon_ix` (`roleid`,`contextid`), ADD KEY `mdl_roleassi_useconrol_ix` (`userid`,`contextid`,`roleid`), ADD KEY `mdl_roleassi_comiteuse_ix` (`component`,`itemid`,`userid`), ADD KEY `mdl_roleassi_rol_ix` (`roleid`), ADD KEY `mdl_roleassi_con_ix` (`contextid`), ADD KEY `mdl_roleassi_use_ix` (`userid`);

--
-- Indexes for table `mdl_role_capabilities`
--
ALTER TABLE `mdl_role_capabilities`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `mdl_rolecapa_rolconcap_uix` (`roleid`,`contextid`,`capability`), ADD KEY `mdl_rolecapa_rol_ix` (`roleid`), ADD KEY `mdl_rolecapa_con_ix` (`contextid`), ADD KEY `mdl_rolecapa_mod_ix` (`modifierid`), ADD KEY `mdl_rolecapa_cap_ix` (`capability`);

--
-- Indexes for table `mdl_role_context_levels`
--
ALTER TABLE `mdl_role_context_levels`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `mdl_rolecontleve_conrol_uix` (`contextlevel`,`roleid`), ADD KEY `mdl_rolecontleve_rol_ix` (`roleid`);

--
-- Indexes for table `mdl_role_names`
--
ALTER TABLE `mdl_role_names`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `mdl_rolename_rolcon_uix` (`roleid`,`contextid`), ADD KEY `mdl_rolename_rol_ix` (`roleid`), ADD KEY `mdl_rolename_con_ix` (`contextid`);

--
-- Indexes for table `mdl_role_sortorder`
--
ALTER TABLE `mdl_role_sortorder`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `mdl_rolesort_userolcon_uix` (`userid`,`roleid`,`contextid`), ADD KEY `mdl_rolesort_use_ix` (`userid`), ADD KEY `mdl_rolesort_rol_ix` (`roleid`), ADD KEY `mdl_rolesort_con_ix` (`contextid`);

--
-- Indexes for table `mdl_scale`
--
ALTER TABLE `mdl_scale`
 ADD PRIMARY KEY (`id`), ADD KEY `mdl_scal_cou_ix` (`courseid`);

--
-- Indexes for table `mdl_scale_history`
--
ALTER TABLE `mdl_scale_history`
 ADD PRIMARY KEY (`id`), ADD KEY `mdl_scalhist_act_ix` (`action`), ADD KEY `mdl_scalhist_old_ix` (`oldid`), ADD KEY `mdl_scalhist_cou_ix` (`courseid`), ADD KEY `mdl_scalhist_log_ix` (`loggeduser`);

--
-- Indexes for table `mdl_scorm`
--
ALTER TABLE `mdl_scorm`
 ADD PRIMARY KEY (`id`), ADD KEY `mdl_scor_cou_ix` (`course`);

--
-- Indexes for table `mdl_scorm_aicc_session`
--
ALTER TABLE `mdl_scorm_aicc_session`
 ADD PRIMARY KEY (`id`), ADD KEY `mdl_scoraiccsess_sco_ix` (`scormid`), ADD KEY `mdl_scoraiccsess_use_ix` (`userid`);

--
-- Indexes for table `mdl_scorm_scoes`
--
ALTER TABLE `mdl_scorm_scoes`
 ADD PRIMARY KEY (`id`), ADD KEY `mdl_scorscoe_sco_ix` (`scorm`);

--
-- Indexes for table `mdl_scorm_scoes_data`
--
ALTER TABLE `mdl_scorm_scoes_data`
 ADD PRIMARY KEY (`id`), ADD KEY `mdl_scorscoedata_sco_ix` (`scoid`);

--
-- Indexes for table `mdl_scorm_scoes_track`
--
ALTER TABLE `mdl_scorm_scoes_track`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `mdl_scorscoetrac_usescosco_uix` (`userid`,`scormid`,`scoid`,`attempt`,`element`), ADD KEY `mdl_scorscoetrac_use_ix` (`userid`), ADD KEY `mdl_scorscoetrac_ele_ix` (`element`), ADD KEY `mdl_scorscoetrac_sco_ix` (`scormid`), ADD KEY `mdl_scorscoetrac_sco2_ix` (`scoid`);

--
-- Indexes for table `mdl_scorm_seq_mapinfo`
--
ALTER TABLE `mdl_scorm_seq_mapinfo`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `mdl_scorseqmapi_scoidobj_uix` (`scoid`,`id`,`objectiveid`), ADD KEY `mdl_scorseqmapi_sco_ix` (`scoid`), ADD KEY `mdl_scorseqmapi_obj_ix` (`objectiveid`);

--
-- Indexes for table `mdl_scorm_seq_objective`
--
ALTER TABLE `mdl_scorm_seq_objective`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `mdl_scorseqobje_scoid_uix` (`scoid`,`id`), ADD KEY `mdl_scorseqobje_sco_ix` (`scoid`);

--
-- Indexes for table `mdl_scorm_seq_rolluprule`
--
ALTER TABLE `mdl_scorm_seq_rolluprule`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `mdl_scorseqroll_scoid_uix` (`scoid`,`id`), ADD KEY `mdl_scorseqroll_sco_ix` (`scoid`);

--
-- Indexes for table `mdl_scorm_seq_rolluprulecond`
--
ALTER TABLE `mdl_scorm_seq_rolluprulecond`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `mdl_scorseqroll_scorolid_uix` (`scoid`,`rollupruleid`,`id`), ADD KEY `mdl_scorseqroll_sco2_ix` (`scoid`), ADD KEY `mdl_scorseqroll_rol_ix` (`rollupruleid`);

--
-- Indexes for table `mdl_scorm_seq_rulecond`
--
ALTER TABLE `mdl_scorm_seq_rulecond`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `mdl_scorseqrule_idscorul_uix` (`id`,`scoid`,`ruleconditionsid`), ADD KEY `mdl_scorseqrule_sco2_ix` (`scoid`), ADD KEY `mdl_scorseqrule_rul_ix` (`ruleconditionsid`);

--
-- Indexes for table `mdl_scorm_seq_ruleconds`
--
ALTER TABLE `mdl_scorm_seq_ruleconds`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `mdl_scorseqrule_scoid_uix` (`scoid`,`id`), ADD KEY `mdl_scorseqrule_sco_ix` (`scoid`);

--
-- Indexes for table `mdl_sessions`
--
ALTER TABLE `mdl_sessions`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `mdl_sess_sid_uix` (`sid`), ADD KEY `mdl_sess_sta_ix` (`state`), ADD KEY `mdl_sess_tim_ix` (`timecreated`), ADD KEY `mdl_sess_tim2_ix` (`timemodified`), ADD KEY `mdl_sess_use_ix` (`userid`);

--
-- Indexes for table `mdl_stats_daily`
--
ALTER TABLE `mdl_stats_daily`
 ADD PRIMARY KEY (`id`), ADD KEY `mdl_statdail_cou_ix` (`courseid`), ADD KEY `mdl_statdail_tim_ix` (`timeend`), ADD KEY `mdl_statdail_rol_ix` (`roleid`);

--
-- Indexes for table `mdl_stats_monthly`
--
ALTER TABLE `mdl_stats_monthly`
 ADD PRIMARY KEY (`id`), ADD KEY `mdl_statmont_cou_ix` (`courseid`), ADD KEY `mdl_statmont_tim_ix` (`timeend`), ADD KEY `mdl_statmont_rol_ix` (`roleid`);

--
-- Indexes for table `mdl_stats_user_daily`
--
ALTER TABLE `mdl_stats_user_daily`
 ADD PRIMARY KEY (`id`), ADD KEY `mdl_statuserdail_cou_ix` (`courseid`), ADD KEY `mdl_statuserdail_use_ix` (`userid`), ADD KEY `mdl_statuserdail_rol_ix` (`roleid`), ADD KEY `mdl_statuserdail_tim_ix` (`timeend`);

--
-- Indexes for table `mdl_stats_user_monthly`
--
ALTER TABLE `mdl_stats_user_monthly`
 ADD PRIMARY KEY (`id`), ADD KEY `mdl_statusermont_cou_ix` (`courseid`), ADD KEY `mdl_statusermont_use_ix` (`userid`), ADD KEY `mdl_statusermont_rol_ix` (`roleid`), ADD KEY `mdl_statusermont_tim_ix` (`timeend`);

--
-- Indexes for table `mdl_stats_user_weekly`
--
ALTER TABLE `mdl_stats_user_weekly`
 ADD PRIMARY KEY (`id`), ADD KEY `mdl_statuserweek_cou_ix` (`courseid`), ADD KEY `mdl_statuserweek_use_ix` (`userid`), ADD KEY `mdl_statuserweek_rol_ix` (`roleid`), ADD KEY `mdl_statuserweek_tim_ix` (`timeend`);

--
-- Indexes for table `mdl_stats_weekly`
--
ALTER TABLE `mdl_stats_weekly`
 ADD PRIMARY KEY (`id`), ADD KEY `mdl_statweek_cou_ix` (`courseid`), ADD KEY `mdl_statweek_tim_ix` (`timeend`), ADD KEY `mdl_statweek_rol_ix` (`roleid`);

--
-- Indexes for table `mdl_survey`
--
ALTER TABLE `mdl_survey`
 ADD PRIMARY KEY (`id`), ADD KEY `mdl_surv_cou_ix` (`course`);

--
-- Indexes for table `mdl_survey_analysis`
--
ALTER TABLE `mdl_survey_analysis`
 ADD PRIMARY KEY (`id`), ADD KEY `mdl_survanal_use_ix` (`userid`), ADD KEY `mdl_survanal_sur_ix` (`survey`);

--
-- Indexes for table `mdl_survey_answers`
--
ALTER TABLE `mdl_survey_answers`
 ADD PRIMARY KEY (`id`), ADD KEY `mdl_survansw_use_ix` (`userid`), ADD KEY `mdl_survansw_sur_ix` (`survey`), ADD KEY `mdl_survansw_que_ix` (`question`);

--
-- Indexes for table `mdl_survey_questions`
--
ALTER TABLE `mdl_survey_questions`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mdl_tag`
--
ALTER TABLE `mdl_tag`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `mdl_tag_nam_uix` (`name`), ADD UNIQUE KEY `mdl_tag_idnam_uix` (`id`,`name`), ADD KEY `mdl_tag_use_ix` (`userid`);

--
-- Indexes for table `mdl_tag_correlation`
--
ALTER TABLE `mdl_tag_correlation`
 ADD PRIMARY KEY (`id`), ADD KEY `mdl_tagcorr_tag_ix` (`tagid`);

--
-- Indexes for table `mdl_tag_instance`
--
ALTER TABLE `mdl_tag_instance`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `mdl_taginst_iteitetagtiu_uix` (`itemtype`,`itemid`,`tagid`,`tiuserid`), ADD KEY `mdl_taginst_tag_ix` (`tagid`), ADD KEY `mdl_taginst_con_ix` (`contextid`);

--
-- Indexes for table `mdl_task_adhoc`
--
ALTER TABLE `mdl_task_adhoc`
 ADD PRIMARY KEY (`id`), ADD KEY `mdl_taskadho_nex_ix` (`nextruntime`);

--
-- Indexes for table `mdl_task_scheduled`
--
ALTER TABLE `mdl_task_scheduled`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `mdl_tasksche_cla_uix` (`classname`);

--
-- Indexes for table `mdl_timezone`
--
ALTER TABLE `mdl_timezone`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mdl_tool_customlang`
--
ALTER TABLE `mdl_tool_customlang`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `mdl_toolcust_lancomstr_uix` (`lang`,`componentid`,`stringid`), ADD KEY `mdl_toolcust_com_ix` (`componentid`);

--
-- Indexes for table `mdl_tool_customlang_components`
--
ALTER TABLE `mdl_tool_customlang_components`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mdl_upgrade_log`
--
ALTER TABLE `mdl_upgrade_log`
 ADD PRIMARY KEY (`id`), ADD KEY `mdl_upgrlog_tim_ix` (`timemodified`), ADD KEY `mdl_upgrlog_typtim_ix` (`type`,`timemodified`), ADD KEY `mdl_upgrlog_use_ix` (`userid`);

--
-- Indexes for table `mdl_url`
--
ALTER TABLE `mdl_url`
 ADD PRIMARY KEY (`id`), ADD KEY `mdl_url_cou_ix` (`course`);

--
-- Indexes for table `mdl_user`
--
ALTER TABLE `mdl_user`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `mdl_user_mneuse_uix` (`mnethostid`,`username`), ADD KEY `mdl_user_del_ix` (`deleted`), ADD KEY `mdl_user_con_ix` (`confirmed`), ADD KEY `mdl_user_fir_ix` (`firstname`), ADD KEY `mdl_user_las_ix` (`lastname`), ADD KEY `mdl_user_cit_ix` (`city`), ADD KEY `mdl_user_cou_ix` (`country`), ADD KEY `mdl_user_las2_ix` (`lastaccess`), ADD KEY `mdl_user_ema_ix` (`email`), ADD KEY `mdl_user_aut_ix` (`auth`), ADD KEY `mdl_user_idn_ix` (`idnumber`), ADD KEY `mdl_user_fir2_ix` (`firstnamephonetic`), ADD KEY `mdl_user_las3_ix` (`lastnamephonetic`), ADD KEY `mdl_user_mid_ix` (`middlename`), ADD KEY `mdl_user_alt_ix` (`alternatename`);

--
-- Indexes for table `mdl_user_devices`
--
ALTER TABLE `mdl_user_devices`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `mdl_userdevi_pususe_uix` (`pushid`,`userid`), ADD KEY `mdl_userdevi_use_ix` (`userid`);

--
-- Indexes for table `mdl_user_enrolments`
--
ALTER TABLE `mdl_user_enrolments`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `mdl_userenro_enruse_uix` (`enrolid`,`userid`), ADD KEY `mdl_userenro_enr_ix` (`enrolid`), ADD KEY `mdl_userenro_use_ix` (`userid`), ADD KEY `mdl_userenro_mod_ix` (`modifierid`);

--
-- Indexes for table `mdl_user_info_category`
--
ALTER TABLE `mdl_user_info_category`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mdl_user_info_data`
--
ALTER TABLE `mdl_user_info_data`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `mdl_userinfodata_usefie_uix` (`userid`,`fieldid`);

--
-- Indexes for table `mdl_user_info_field`
--
ALTER TABLE `mdl_user_info_field`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mdl_user_lastaccess`
--
ALTER TABLE `mdl_user_lastaccess`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `mdl_userlast_usecou_uix` (`userid`,`courseid`), ADD KEY `mdl_userlast_use_ix` (`userid`), ADD KEY `mdl_userlast_cou_ix` (`courseid`);

--
-- Indexes for table `mdl_user_password_resets`
--
ALTER TABLE `mdl_user_password_resets`
 ADD PRIMARY KEY (`id`), ADD KEY `mdl_userpassrese_use_ix` (`userid`);

--
-- Indexes for table `mdl_user_preferences`
--
ALTER TABLE `mdl_user_preferences`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `mdl_userpref_usenam_uix` (`userid`,`name`);

--
-- Indexes for table `mdl_user_private_key`
--
ALTER TABLE `mdl_user_private_key`
 ADD PRIMARY KEY (`id`), ADD KEY `mdl_userprivkey_scrval_ix` (`script`,`value`), ADD KEY `mdl_userprivkey_use_ix` (`userid`);

--
-- Indexes for table `mdl_webdav_locks`
--
ALTER TABLE `mdl_webdav_locks`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `mdl_webdlock_tok_uix` (`token`), ADD KEY `mdl_webdlock_pat_ix` (`path`), ADD KEY `mdl_webdlock_exp_ix` (`expiry`);

--
-- Indexes for table `mdl_wiki`
--
ALTER TABLE `mdl_wiki`
 ADD PRIMARY KEY (`id`), ADD KEY `mdl_wiki_cou_ix` (`course`);

--
-- Indexes for table `mdl_wiki_links`
--
ALTER TABLE `mdl_wiki_links`
 ADD PRIMARY KEY (`id`), ADD KEY `mdl_wikilink_fro_ix` (`frompageid`), ADD KEY `mdl_wikilink_sub_ix` (`subwikiid`);

--
-- Indexes for table `mdl_wiki_locks`
--
ALTER TABLE `mdl_wiki_locks`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mdl_wiki_pages`
--
ALTER TABLE `mdl_wiki_pages`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `mdl_wikipage_subtituse_uix` (`subwikiid`,`title`,`userid`), ADD KEY `mdl_wikipage_sub_ix` (`subwikiid`);

--
-- Indexes for table `mdl_wiki_subwikis`
--
ALTER TABLE `mdl_wiki_subwikis`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `mdl_wikisubw_wikgrouse_uix` (`wikiid`,`groupid`,`userid`), ADD KEY `mdl_wikisubw_wik_ix` (`wikiid`);

--
-- Indexes for table `mdl_wiki_synonyms`
--
ALTER TABLE `mdl_wiki_synonyms`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `mdl_wikisyno_pagpag_uix` (`pageid`,`pagesynonym`);

--
-- Indexes for table `mdl_wiki_versions`
--
ALTER TABLE `mdl_wiki_versions`
 ADD PRIMARY KEY (`id`), ADD KEY `mdl_wikivers_pag_ix` (`pageid`);

--
-- Indexes for table `mdl_workshop`
--
ALTER TABLE `mdl_workshop`
 ADD PRIMARY KEY (`id`), ADD KEY `mdl_work_cou_ix` (`course`);

--
-- Indexes for table `mdl_workshopallocation_scheduled`
--
ALTER TABLE `mdl_workshopallocation_scheduled`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `mdl_worksche_wor_uix` (`workshopid`);

--
-- Indexes for table `mdl_workshopeval_best_settings`
--
ALTER TABLE `mdl_workshopeval_best_settings`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `mdl_workbestsett_wor_uix` (`workshopid`);

--
-- Indexes for table `mdl_workshopform_accumulative`
--
ALTER TABLE `mdl_workshopform_accumulative`
 ADD PRIMARY KEY (`id`), ADD KEY `mdl_workaccu_wor_ix` (`workshopid`);

--
-- Indexes for table `mdl_workshopform_comments`
--
ALTER TABLE `mdl_workshopform_comments`
 ADD PRIMARY KEY (`id`), ADD KEY `mdl_workcomm_wor_ix` (`workshopid`);

--
-- Indexes for table `mdl_workshopform_numerrors`
--
ALTER TABLE `mdl_workshopform_numerrors`
 ADD PRIMARY KEY (`id`), ADD KEY `mdl_worknume_wor_ix` (`workshopid`);

--
-- Indexes for table `mdl_workshopform_numerrors_map`
--
ALTER TABLE `mdl_workshopform_numerrors_map`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `mdl_worknumemap_wornon_uix` (`workshopid`,`nonegative`), ADD KEY `mdl_worknumemap_wor_ix` (`workshopid`);

--
-- Indexes for table `mdl_workshopform_rubric`
--
ALTER TABLE `mdl_workshopform_rubric`
 ADD PRIMARY KEY (`id`), ADD KEY `mdl_workrubr_wor_ix` (`workshopid`);

--
-- Indexes for table `mdl_workshopform_rubric_config`
--
ALTER TABLE `mdl_workshopform_rubric_config`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `mdl_workrubrconf_wor_uix` (`workshopid`);

--
-- Indexes for table `mdl_workshopform_rubric_levels`
--
ALTER TABLE `mdl_workshopform_rubric_levels`
 ADD PRIMARY KEY (`id`), ADD KEY `mdl_workrubrleve_dim_ix` (`dimensionid`);

--
-- Indexes for table `mdl_workshop_aggregations`
--
ALTER TABLE `mdl_workshop_aggregations`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `mdl_workaggr_woruse_uix` (`workshopid`,`userid`), ADD KEY `mdl_workaggr_wor_ix` (`workshopid`), ADD KEY `mdl_workaggr_use_ix` (`userid`);

--
-- Indexes for table `mdl_workshop_assessments`
--
ALTER TABLE `mdl_workshop_assessments`
 ADD PRIMARY KEY (`id`), ADD KEY `mdl_workasse_sub_ix` (`submissionid`), ADD KEY `mdl_workasse_gra_ix` (`gradinggradeoverby`), ADD KEY `mdl_workasse_rev_ix` (`reviewerid`);

--
-- Indexes for table `mdl_workshop_assessments_old`
--
ALTER TABLE `mdl_workshop_assessments_old`
 ADD PRIMARY KEY (`id`), ADD KEY `mdl_workasseold_use_ix` (`userid`), ADD KEY `mdl_workasseold_mai_ix` (`mailed`), ADD KEY `mdl_workasseold_wor_ix` (`workshopid`), ADD KEY `mdl_workasseold_sub_ix` (`submissionid`);

--
-- Indexes for table `mdl_workshop_comments_old`
--
ALTER TABLE `mdl_workshop_comments_old`
 ADD PRIMARY KEY (`id`), ADD KEY `mdl_workcommold_use_ix` (`userid`), ADD KEY `mdl_workcommold_mai_ix` (`mailed`), ADD KEY `mdl_workcommold_wor_ix` (`workshopid`), ADD KEY `mdl_workcommold_ass_ix` (`assessmentid`);

--
-- Indexes for table `mdl_workshop_elements_old`
--
ALTER TABLE `mdl_workshop_elements_old`
 ADD PRIMARY KEY (`id`), ADD KEY `mdl_workelemold_wor_ix` (`workshopid`);

--
-- Indexes for table `mdl_workshop_grades`
--
ALTER TABLE `mdl_workshop_grades`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `mdl_workgrad_assstrdim_uix` (`assessmentid`,`strategy`,`dimensionid`), ADD KEY `mdl_workgrad_ass_ix` (`assessmentid`);

--
-- Indexes for table `mdl_workshop_grades_old`
--
ALTER TABLE `mdl_workshop_grades_old`
 ADD PRIMARY KEY (`id`), ADD KEY `mdl_workgradold_wor_ix` (`workshopid`), ADD KEY `mdl_workgradold_ass_ix` (`assessmentid`);

--
-- Indexes for table `mdl_workshop_old`
--
ALTER TABLE `mdl_workshop_old`
 ADD PRIMARY KEY (`id`), ADD KEY `mdl_workold_cou_ix` (`course`);

--
-- Indexes for table `mdl_workshop_rubrics_old`
--
ALTER TABLE `mdl_workshop_rubrics_old`
 ADD PRIMARY KEY (`id`), ADD KEY `mdl_workrubrold_wor_ix` (`workshopid`);

--
-- Indexes for table `mdl_workshop_stockcomments_old`
--
ALTER TABLE `mdl_workshop_stockcomments_old`
 ADD PRIMARY KEY (`id`), ADD KEY `mdl_workstocold_wor_ix` (`workshopid`);

--
-- Indexes for table `mdl_workshop_submissions`
--
ALTER TABLE `mdl_workshop_submissions`
 ADD PRIMARY KEY (`id`), ADD KEY `mdl_worksubm_wor_ix` (`workshopid`), ADD KEY `mdl_worksubm_gra_ix` (`gradeoverby`), ADD KEY `mdl_worksubm_aut_ix` (`authorid`);

--
-- Indexes for table `mdl_workshop_submissions_old`
--
ALTER TABLE `mdl_workshop_submissions_old`
 ADD PRIMARY KEY (`id`), ADD KEY `mdl_worksubmold_use_ix` (`userid`), ADD KEY `mdl_worksubmold_mai_ix` (`mailed`), ADD KEY `mdl_worksubmold_wor_ix` (`workshopid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `mdl_assign`
--
ALTER TABLE `mdl_assign`
MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_assignfeedback_comments`
--
ALTER TABLE `mdl_assignfeedback_comments`
MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_assignfeedback_editpdf_annot`
--
ALTER TABLE `mdl_assignfeedback_editpdf_annot`
MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_assignfeedback_editpdf_cmnt`
--
ALTER TABLE `mdl_assignfeedback_editpdf_cmnt`
MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_assignfeedback_editpdf_quick`
--
ALTER TABLE `mdl_assignfeedback_editpdf_quick`
MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_assignfeedback_file`
--
ALTER TABLE `mdl_assignfeedback_file`
MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_assignment`
--
ALTER TABLE `mdl_assignment`
MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_assignment_submissions`
--
ALTER TABLE `mdl_assignment_submissions`
MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_assignment_upgrade`
--
ALTER TABLE `mdl_assignment_upgrade`
MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_assignsubmission_file`
--
ALTER TABLE `mdl_assignsubmission_file`
MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_assignsubmission_onlinetext`
--
ALTER TABLE `mdl_assignsubmission_onlinetext`
MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_assign_grades`
--
ALTER TABLE `mdl_assign_grades`
MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_assign_plugin_config`
--
ALTER TABLE `mdl_assign_plugin_config`
MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_assign_submission`
--
ALTER TABLE `mdl_assign_submission`
MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_assign_user_flags`
--
ALTER TABLE `mdl_assign_user_flags`
MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_assign_user_mapping`
--
ALTER TABLE `mdl_assign_user_mapping`
MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_backup_controllers`
--
ALTER TABLE `mdl_backup_controllers`
MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_backup_courses`
--
ALTER TABLE `mdl_backup_courses`
MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_backup_logs`
--
ALTER TABLE `mdl_backup_logs`
MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_badge`
--
ALTER TABLE `mdl_badge`
MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_badge_backpack`
--
ALTER TABLE `mdl_badge_backpack`
MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_badge_criteria`
--
ALTER TABLE `mdl_badge_criteria`
MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_badge_criteria_met`
--
ALTER TABLE `mdl_badge_criteria_met`
MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_badge_criteria_param`
--
ALTER TABLE `mdl_badge_criteria_param`
MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_badge_external`
--
ALTER TABLE `mdl_badge_external`
MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_badge_issued`
--
ALTER TABLE `mdl_badge_issued`
MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_badge_manual_award`
--
ALTER TABLE `mdl_badge_manual_award`
MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_block`
--
ALTER TABLE `mdl_block`
MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=41;
--
-- AUTO_INCREMENT for table `mdl_block_community`
--
ALTER TABLE `mdl_block_community`
MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_block_instances`
--
ALTER TABLE `mdl_block_instances`
MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT for table `mdl_block_positions`
--
ALTER TABLE `mdl_block_positions`
MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_block_quickmail_alternate`
--
ALTER TABLE `mdl_block_quickmail_alternate`
MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_block_quickmail_config`
--
ALTER TABLE `mdl_block_quickmail_config`
MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_block_quickmail_drafts`
--
ALTER TABLE `mdl_block_quickmail_drafts`
MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_block_quickmail_log`
--
ALTER TABLE `mdl_block_quickmail_log`
MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_block_quickmail_signatures`
--
ALTER TABLE `mdl_block_quickmail_signatures`
MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_block_recent_activity`
--
ALTER TABLE `mdl_block_recent_activity`
MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `mdl_block_rss_client`
--
ALTER TABLE `mdl_block_rss_client`
MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_blog_association`
--
ALTER TABLE `mdl_blog_association`
MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_blog_external`
--
ALTER TABLE `mdl_blog_external`
MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_book`
--
ALTER TABLE `mdl_book`
MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_book_chapters`
--
ALTER TABLE `mdl_book_chapters`
MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_cache_filters`
--
ALTER TABLE `mdl_cache_filters`
MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_cache_flags`
--
ALTER TABLE `mdl_cache_flags`
MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `mdl_capabilities`
--
ALTER TABLE `mdl_capabilities`
MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=516;
--
-- AUTO_INCREMENT for table `mdl_chat`
--
ALTER TABLE `mdl_chat`
MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_chat_messages`
--
ALTER TABLE `mdl_chat_messages`
MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_chat_messages_current`
--
ALTER TABLE `mdl_chat_messages_current`
MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_chat_users`
--
ALTER TABLE `mdl_chat_users`
MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_choice`
--
ALTER TABLE `mdl_choice`
MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_choice_answers`
--
ALTER TABLE `mdl_choice_answers`
MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_choice_options`
--
ALTER TABLE `mdl_choice_options`
MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_cohort`
--
ALTER TABLE `mdl_cohort`
MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_cohort_members`
--
ALTER TABLE `mdl_cohort_members`
MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_comments`
--
ALTER TABLE `mdl_comments`
MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_config`
--
ALTER TABLE `mdl_config`
MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=456;
--
-- AUTO_INCREMENT for table `mdl_config_log`
--
ALTER TABLE `mdl_config_log`
MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=955;
--
-- AUTO_INCREMENT for table `mdl_config_plugins`
--
ALTER TABLE `mdl_config_plugins`
MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=1104;
--
-- AUTO_INCREMENT for table `mdl_context`
--
ALTER TABLE `mdl_context`
MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=27;
--
-- AUTO_INCREMENT for table `mdl_course`
--
ALTER TABLE `mdl_course`
MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `mdl_course_categories`
--
ALTER TABLE `mdl_course_categories`
MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `mdl_course_completions`
--
ALTER TABLE `mdl_course_completions`
MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_course_completion_aggr_methd`
--
ALTER TABLE `mdl_course_completion_aggr_methd`
MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_course_completion_criteria`
--
ALTER TABLE `mdl_course_completion_criteria`
MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_course_completion_crit_compl`
--
ALTER TABLE `mdl_course_completion_crit_compl`
MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_course_format_options`
--
ALTER TABLE `mdl_course_format_options`
MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `mdl_course_modules`
--
ALTER TABLE `mdl_course_modules`
MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `mdl_course_modules_completion`
--
ALTER TABLE `mdl_course_modules_completion`
MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_course_published`
--
ALTER TABLE `mdl_course_published`
MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_course_request`
--
ALTER TABLE `mdl_course_request`
MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_course_sections`
--
ALTER TABLE `mdl_course_sections`
MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT for table `mdl_data`
--
ALTER TABLE `mdl_data`
MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_data_content`
--
ALTER TABLE `mdl_data_content`
MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_data_fields`
--
ALTER TABLE `mdl_data_fields`
MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_data_records`
--
ALTER TABLE `mdl_data_records`
MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_enrol`
--
ALTER TABLE `mdl_enrol`
MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `mdl_enrol_flatfile`
--
ALTER TABLE `mdl_enrol_flatfile`
MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_enrol_paypal`
--
ALTER TABLE `mdl_enrol_paypal`
MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_event`
--
ALTER TABLE `mdl_event`
MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `mdl_events_handlers`
--
ALTER TABLE `mdl_events_handlers`
MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_events_queue`
--
ALTER TABLE `mdl_events_queue`
MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_events_queue_handlers`
--
ALTER TABLE `mdl_events_queue_handlers`
MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_event_subscriptions`
--
ALTER TABLE `mdl_event_subscriptions`
MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_external_functions`
--
ALTER TABLE `mdl_external_functions`
MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=120;
--
-- AUTO_INCREMENT for table `mdl_external_services`
--
ALTER TABLE `mdl_external_services`
MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `mdl_external_services_functions`
--
ALTER TABLE `mdl_external_services_functions`
MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=42;
--
-- AUTO_INCREMENT for table `mdl_external_services_users`
--
ALTER TABLE `mdl_external_services_users`
MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_external_tokens`
--
ALTER TABLE `mdl_external_tokens`
MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_feedback`
--
ALTER TABLE `mdl_feedback`
MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_feedback_completed`
--
ALTER TABLE `mdl_feedback_completed`
MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_feedback_completedtmp`
--
ALTER TABLE `mdl_feedback_completedtmp`
MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_feedback_item`
--
ALTER TABLE `mdl_feedback_item`
MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_feedback_sitecourse_map`
--
ALTER TABLE `mdl_feedback_sitecourse_map`
MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_feedback_template`
--
ALTER TABLE `mdl_feedback_template`
MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_feedback_tracking`
--
ALTER TABLE `mdl_feedback_tracking`
MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_feedback_value`
--
ALTER TABLE `mdl_feedback_value`
MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_feedback_valuetmp`
--
ALTER TABLE `mdl_feedback_valuetmp`
MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_files`
--
ALTER TABLE `mdl_files`
MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=44;
--
-- AUTO_INCREMENT for table `mdl_files_reference`
--
ALTER TABLE `mdl_files_reference`
MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_filter_active`
--
ALTER TABLE `mdl_filter_active`
MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `mdl_filter_config`
--
ALTER TABLE `mdl_filter_config`
MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_folder`
--
ALTER TABLE `mdl_folder`
MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_forum`
--
ALTER TABLE `mdl_forum`
MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `mdl_forum_digests`
--
ALTER TABLE `mdl_forum_digests`
MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_forum_discussions`
--
ALTER TABLE `mdl_forum_discussions`
MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_forum_posts`
--
ALTER TABLE `mdl_forum_posts`
MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_forum_queue`
--
ALTER TABLE `mdl_forum_queue`
MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_forum_read`
--
ALTER TABLE `mdl_forum_read`
MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_forum_subscriptions`
--
ALTER TABLE `mdl_forum_subscriptions`
MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_forum_track_prefs`
--
ALTER TABLE `mdl_forum_track_prefs`
MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_glossary`
--
ALTER TABLE `mdl_glossary`
MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_glossary_alias`
--
ALTER TABLE `mdl_glossary_alias`
MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_glossary_categories`
--
ALTER TABLE `mdl_glossary_categories`
MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_glossary_entries`
--
ALTER TABLE `mdl_glossary_entries`
MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_glossary_entries_categories`
--
ALTER TABLE `mdl_glossary_entries_categories`
MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_glossary_formats`
--
ALTER TABLE `mdl_glossary_formats`
MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `mdl_grade_categories`
--
ALTER TABLE `mdl_grade_categories`
MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `mdl_grade_categories_history`
--
ALTER TABLE `mdl_grade_categories_history`
MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `mdl_grade_grades`
--
ALTER TABLE `mdl_grade_grades`
MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_grade_grades_history`
--
ALTER TABLE `mdl_grade_grades_history`
MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_grade_import_newitem`
--
ALTER TABLE `mdl_grade_import_newitem`
MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_grade_import_values`
--
ALTER TABLE `mdl_grade_import_values`
MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_grade_items`
--
ALTER TABLE `mdl_grade_items`
MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `mdl_grade_items_history`
--
ALTER TABLE `mdl_grade_items_history`
MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `mdl_grade_letters`
--
ALTER TABLE `mdl_grade_letters`
MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_grade_outcomes`
--
ALTER TABLE `mdl_grade_outcomes`
MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_grade_outcomes_courses`
--
ALTER TABLE `mdl_grade_outcomes_courses`
MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_grade_outcomes_history`
--
ALTER TABLE `mdl_grade_outcomes_history`
MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_grade_settings`
--
ALTER TABLE `mdl_grade_settings`
MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_gradingform_guide_comments`
--
ALTER TABLE `mdl_gradingform_guide_comments`
MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_gradingform_guide_criteria`
--
ALTER TABLE `mdl_gradingform_guide_criteria`
MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_gradingform_guide_fillings`
--
ALTER TABLE `mdl_gradingform_guide_fillings`
MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_gradingform_rubric_criteria`
--
ALTER TABLE `mdl_gradingform_rubric_criteria`
MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_gradingform_rubric_fillings`
--
ALTER TABLE `mdl_gradingform_rubric_fillings`
MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_gradingform_rubric_levels`
--
ALTER TABLE `mdl_gradingform_rubric_levels`
MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_grading_areas`
--
ALTER TABLE `mdl_grading_areas`
MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_grading_definitions`
--
ALTER TABLE `mdl_grading_definitions`
MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_grading_instances`
--
ALTER TABLE `mdl_grading_instances`
MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_groupings`
--
ALTER TABLE `mdl_groupings`
MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_groupings_groups`
--
ALTER TABLE `mdl_groupings_groups`
MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_groups`
--
ALTER TABLE `mdl_groups`
MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_groups_members`
--
ALTER TABLE `mdl_groups_members`
MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_imscp`
--
ALTER TABLE `mdl_imscp`
MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_label`
--
ALTER TABLE `mdl_label`
MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_lesson`
--
ALTER TABLE `mdl_lesson`
MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `mdl_lesson_answers`
--
ALTER TABLE `mdl_lesson_answers`
MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_lesson_attempts`
--
ALTER TABLE `mdl_lesson_attempts`
MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_lesson_branch`
--
ALTER TABLE `mdl_lesson_branch`
MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_lesson_grades`
--
ALTER TABLE `mdl_lesson_grades`
MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_lesson_high_scores`
--
ALTER TABLE `mdl_lesson_high_scores`
MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_lesson_pages`
--
ALTER TABLE `mdl_lesson_pages`
MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_lesson_timer`
--
ALTER TABLE `mdl_lesson_timer`
MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_license`
--
ALTER TABLE `mdl_license`
MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `mdl_lock_db`
--
ALTER TABLE `mdl_lock_db`
MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_log`
--
ALTER TABLE `mdl_log`
MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_logstore_standard_log`
--
ALTER TABLE `mdl_logstore_standard_log`
MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=329;
--
-- AUTO_INCREMENT for table `mdl_log_display`
--
ALTER TABLE `mdl_log_display`
MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=188;
--
-- AUTO_INCREMENT for table `mdl_log_queries`
--
ALTER TABLE `mdl_log_queries`
MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_lti`
--
ALTER TABLE `mdl_lti`
MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_lti_submission`
--
ALTER TABLE `mdl_lti_submission`
MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_lti_types`
--
ALTER TABLE `mdl_lti_types`
MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_lti_types_config`
--
ALTER TABLE `mdl_lti_types_config`
MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_message`
--
ALTER TABLE `mdl_message`
MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `mdl_message_airnotifier_devices`
--
ALTER TABLE `mdl_message_airnotifier_devices`
MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_message_contacts`
--
ALTER TABLE `mdl_message_contacts`
MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_message_processors`
--
ALTER TABLE `mdl_message_processors`
MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `mdl_message_providers`
--
ALTER TABLE `mdl_message_providers`
MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=25;
--
-- AUTO_INCREMENT for table `mdl_message_read`
--
ALTER TABLE `mdl_message_read`
MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_message_working`
--
ALTER TABLE `mdl_message_working`
MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `mdl_mnetservice_enrol_courses`
--
ALTER TABLE `mdl_mnetservice_enrol_courses`
MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_mnetservice_enrol_enrolments`
--
ALTER TABLE `mdl_mnetservice_enrol_enrolments`
MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_mnet_application`
--
ALTER TABLE `mdl_mnet_application`
MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `mdl_mnet_host`
--
ALTER TABLE `mdl_mnet_host`
MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `mdl_mnet_host2service`
--
ALTER TABLE `mdl_mnet_host2service`
MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_mnet_log`
--
ALTER TABLE `mdl_mnet_log`
MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_mnet_remote_rpc`
--
ALTER TABLE `mdl_mnet_remote_rpc`
MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT for table `mdl_mnet_remote_service2rpc`
--
ALTER TABLE `mdl_mnet_remote_service2rpc`
MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT for table `mdl_mnet_rpc`
--
ALTER TABLE `mdl_mnet_rpc`
MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT for table `mdl_mnet_service`
--
ALTER TABLE `mdl_mnet_service`
MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `mdl_mnet_service2rpc`
--
ALTER TABLE `mdl_mnet_service2rpc`
MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT for table `mdl_mnet_session`
--
ALTER TABLE `mdl_mnet_session`
MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_mnet_sso_access_control`
--
ALTER TABLE `mdl_mnet_sso_access_control`
MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_modules`
--
ALTER TABLE `mdl_modules`
MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=23;
--
-- AUTO_INCREMENT for table `mdl_my_pages`
--
ALTER TABLE `mdl_my_pages`
MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `mdl_page`
--
ALTER TABLE `mdl_page`
MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_portfolio_instance`
--
ALTER TABLE `mdl_portfolio_instance`
MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_portfolio_instance_config`
--
ALTER TABLE `mdl_portfolio_instance_config`
MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_portfolio_instance_user`
--
ALTER TABLE `mdl_portfolio_instance_user`
MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_portfolio_log`
--
ALTER TABLE `mdl_portfolio_log`
MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_portfolio_mahara_queue`
--
ALTER TABLE `mdl_portfolio_mahara_queue`
MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_portfolio_tempdata`
--
ALTER TABLE `mdl_portfolio_tempdata`
MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_post`
--
ALTER TABLE `mdl_post`
MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_profiling`
--
ALTER TABLE `mdl_profiling`
MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_qtype_essay_options`
--
ALTER TABLE `mdl_qtype_essay_options`
MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_qtype_match_options`
--
ALTER TABLE `mdl_qtype_match_options`
MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_qtype_match_subquestions`
--
ALTER TABLE `mdl_qtype_match_subquestions`
MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_qtype_multichoice_options`
--
ALTER TABLE `mdl_qtype_multichoice_options`
MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `mdl_qtype_randomsamatch_options`
--
ALTER TABLE `mdl_qtype_randomsamatch_options`
MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_qtype_shortanswer_options`
--
ALTER TABLE `mdl_qtype_shortanswer_options`
MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_question`
--
ALTER TABLE `mdl_question`
MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `mdl_question_answers`
--
ALTER TABLE `mdl_question_answers`
MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `mdl_question_attempts`
--
ALTER TABLE `mdl_question_attempts`
MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `mdl_question_attempt_steps`
--
ALTER TABLE `mdl_question_attempt_steps`
MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `mdl_question_attempt_step_data`
--
ALTER TABLE `mdl_question_attempt_step_data`
MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `mdl_question_calculated`
--
ALTER TABLE `mdl_question_calculated`
MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_question_calculated_options`
--
ALTER TABLE `mdl_question_calculated_options`
MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_question_categories`
--
ALTER TABLE `mdl_question_categories`
MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `mdl_question_datasets`
--
ALTER TABLE `mdl_question_datasets`
MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_question_dataset_definitions`
--
ALTER TABLE `mdl_question_dataset_definitions`
MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_question_dataset_items`
--
ALTER TABLE `mdl_question_dataset_items`
MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_question_hints`
--
ALTER TABLE `mdl_question_hints`
MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_question_multianswer`
--
ALTER TABLE `mdl_question_multianswer`
MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_question_numerical`
--
ALTER TABLE `mdl_question_numerical`
MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_question_numerical_options`
--
ALTER TABLE `mdl_question_numerical_options`
MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_question_numerical_units`
--
ALTER TABLE `mdl_question_numerical_units`
MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_question_response_analysis`
--
ALTER TABLE `mdl_question_response_analysis`
MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_question_response_count`
--
ALTER TABLE `mdl_question_response_count`
MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_question_statistics`
--
ALTER TABLE `mdl_question_statistics`
MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_question_truefalse`
--
ALTER TABLE `mdl_question_truefalse`
MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_question_usages`
--
ALTER TABLE `mdl_question_usages`
MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `mdl_quiz`
--
ALTER TABLE `mdl_quiz`
MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `mdl_quiz_attempts`
--
ALTER TABLE `mdl_quiz_attempts`
MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `mdl_quiz_feedback`
--
ALTER TABLE `mdl_quiz_feedback`
MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `mdl_quiz_grades`
--
ALTER TABLE `mdl_quiz_grades`
MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_quiz_overrides`
--
ALTER TABLE `mdl_quiz_overrides`
MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_quiz_overview_regrades`
--
ALTER TABLE `mdl_quiz_overview_regrades`
MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_quiz_reports`
--
ALTER TABLE `mdl_quiz_reports`
MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `mdl_quiz_slots`
--
ALTER TABLE `mdl_quiz_slots`
MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `mdl_quiz_statistics`
--
ALTER TABLE `mdl_quiz_statistics`
MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_rating`
--
ALTER TABLE `mdl_rating`
MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_registration_hubs`
--
ALTER TABLE `mdl_registration_hubs`
MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_repository`
--
ALTER TABLE `mdl_repository`
MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `mdl_repository_instances`
--
ALTER TABLE `mdl_repository_instances`
MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `mdl_repository_instance_config`
--
ALTER TABLE `mdl_repository_instance_config`
MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_resource`
--
ALTER TABLE `mdl_resource`
MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_resource_old`
--
ALTER TABLE `mdl_resource_old`
MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_role`
--
ALTER TABLE `mdl_role`
MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `mdl_role_allow_assign`
--
ALTER TABLE `mdl_role_allow_assign`
MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `mdl_role_allow_override`
--
ALTER TABLE `mdl_role_allow_override`
MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT for table `mdl_role_allow_switch`
--
ALTER TABLE `mdl_role_allow_switch`
MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `mdl_role_assignments`
--
ALTER TABLE `mdl_role_assignments`
MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `mdl_role_capabilities`
--
ALTER TABLE `mdl_role_capabilities`
MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2196;
--
-- AUTO_INCREMENT for table `mdl_role_context_levels`
--
ALTER TABLE `mdl_role_context_levels`
MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=50;
--
-- AUTO_INCREMENT for table `mdl_role_names`
--
ALTER TABLE `mdl_role_names`
MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_role_sortorder`
--
ALTER TABLE `mdl_role_sortorder`
MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_scale`
--
ALTER TABLE `mdl_scale`
MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `mdl_scale_history`
--
ALTER TABLE `mdl_scale_history`
MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_scorm`
--
ALTER TABLE `mdl_scorm`
MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_scorm_aicc_session`
--
ALTER TABLE `mdl_scorm_aicc_session`
MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_scorm_scoes`
--
ALTER TABLE `mdl_scorm_scoes`
MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_scorm_scoes_data`
--
ALTER TABLE `mdl_scorm_scoes_data`
MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_scorm_scoes_track`
--
ALTER TABLE `mdl_scorm_scoes_track`
MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_scorm_seq_mapinfo`
--
ALTER TABLE `mdl_scorm_seq_mapinfo`
MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_scorm_seq_objective`
--
ALTER TABLE `mdl_scorm_seq_objective`
MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_scorm_seq_rolluprule`
--
ALTER TABLE `mdl_scorm_seq_rolluprule`
MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_scorm_seq_rolluprulecond`
--
ALTER TABLE `mdl_scorm_seq_rolluprulecond`
MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_scorm_seq_rulecond`
--
ALTER TABLE `mdl_scorm_seq_rulecond`
MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_scorm_seq_ruleconds`
--
ALTER TABLE `mdl_scorm_seq_ruleconds`
MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_sessions`
--
ALTER TABLE `mdl_sessions`
MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=151;
--
-- AUTO_INCREMENT for table `mdl_stats_daily`
--
ALTER TABLE `mdl_stats_daily`
MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_stats_monthly`
--
ALTER TABLE `mdl_stats_monthly`
MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_stats_user_daily`
--
ALTER TABLE `mdl_stats_user_daily`
MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_stats_user_monthly`
--
ALTER TABLE `mdl_stats_user_monthly`
MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_stats_user_weekly`
--
ALTER TABLE `mdl_stats_user_weekly`
MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_stats_weekly`
--
ALTER TABLE `mdl_stats_weekly`
MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_survey`
--
ALTER TABLE `mdl_survey`
MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `mdl_survey_analysis`
--
ALTER TABLE `mdl_survey_analysis`
MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_survey_answers`
--
ALTER TABLE `mdl_survey_answers`
MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_survey_questions`
--
ALTER TABLE `mdl_survey_questions`
MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=74;
--
-- AUTO_INCREMENT for table `mdl_tag`
--
ALTER TABLE `mdl_tag`
MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_tag_correlation`
--
ALTER TABLE `mdl_tag_correlation`
MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_tag_instance`
--
ALTER TABLE `mdl_tag_instance`
MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_task_adhoc`
--
ALTER TABLE `mdl_task_adhoc`
MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_task_scheduled`
--
ALTER TABLE `mdl_task_scheduled`
MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=33;
--
-- AUTO_INCREMENT for table `mdl_timezone`
--
ALTER TABLE `mdl_timezone`
MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_tool_customlang`
--
ALTER TABLE `mdl_tool_customlang`
MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_tool_customlang_components`
--
ALTER TABLE `mdl_tool_customlang_components`
MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_upgrade_log`
--
ALTER TABLE `mdl_upgrade_log`
MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=1047;
--
-- AUTO_INCREMENT for table `mdl_url`
--
ALTER TABLE `mdl_url`
MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_user`
--
ALTER TABLE `mdl_user`
MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `mdl_user_devices`
--
ALTER TABLE `mdl_user_devices`
MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_user_enrolments`
--
ALTER TABLE `mdl_user_enrolments`
MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `mdl_user_info_category`
--
ALTER TABLE `mdl_user_info_category`
MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_user_info_data`
--
ALTER TABLE `mdl_user_info_data`
MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_user_info_field`
--
ALTER TABLE `mdl_user_info_field`
MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_user_lastaccess`
--
ALTER TABLE `mdl_user_lastaccess`
MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `mdl_user_password_resets`
--
ALTER TABLE `mdl_user_password_resets`
MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_user_preferences`
--
ALTER TABLE `mdl_user_preferences`
MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=27;
--
-- AUTO_INCREMENT for table `mdl_user_private_key`
--
ALTER TABLE `mdl_user_private_key`
MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_webdav_locks`
--
ALTER TABLE `mdl_webdav_locks`
MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_wiki`
--
ALTER TABLE `mdl_wiki`
MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_wiki_links`
--
ALTER TABLE `mdl_wiki_links`
MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_wiki_locks`
--
ALTER TABLE `mdl_wiki_locks`
MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_wiki_pages`
--
ALTER TABLE `mdl_wiki_pages`
MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_wiki_subwikis`
--
ALTER TABLE `mdl_wiki_subwikis`
MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_wiki_synonyms`
--
ALTER TABLE `mdl_wiki_synonyms`
MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_wiki_versions`
--
ALTER TABLE `mdl_wiki_versions`
MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_workshop`
--
ALTER TABLE `mdl_workshop`
MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_workshopallocation_scheduled`
--
ALTER TABLE `mdl_workshopallocation_scheduled`
MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_workshopeval_best_settings`
--
ALTER TABLE `mdl_workshopeval_best_settings`
MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_workshopform_accumulative`
--
ALTER TABLE `mdl_workshopform_accumulative`
MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_workshopform_comments`
--
ALTER TABLE `mdl_workshopform_comments`
MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_workshopform_numerrors`
--
ALTER TABLE `mdl_workshopform_numerrors`
MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_workshopform_numerrors_map`
--
ALTER TABLE `mdl_workshopform_numerrors_map`
MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_workshopform_rubric`
--
ALTER TABLE `mdl_workshopform_rubric`
MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_workshopform_rubric_config`
--
ALTER TABLE `mdl_workshopform_rubric_config`
MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_workshopform_rubric_levels`
--
ALTER TABLE `mdl_workshopform_rubric_levels`
MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_workshop_aggregations`
--
ALTER TABLE `mdl_workshop_aggregations`
MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_workshop_assessments`
--
ALTER TABLE `mdl_workshop_assessments`
MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_workshop_assessments_old`
--
ALTER TABLE `mdl_workshop_assessments_old`
MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_workshop_comments_old`
--
ALTER TABLE `mdl_workshop_comments_old`
MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_workshop_elements_old`
--
ALTER TABLE `mdl_workshop_elements_old`
MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_workshop_grades`
--
ALTER TABLE `mdl_workshop_grades`
MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_workshop_grades_old`
--
ALTER TABLE `mdl_workshop_grades_old`
MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_workshop_old`
--
ALTER TABLE `mdl_workshop_old`
MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_workshop_rubrics_old`
--
ALTER TABLE `mdl_workshop_rubrics_old`
MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_workshop_stockcomments_old`
--
ALTER TABLE `mdl_workshop_stockcomments_old`
MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_workshop_submissions`
--
ALTER TABLE `mdl_workshop_submissions`
MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_workshop_submissions_old`
--
ALTER TABLE `mdl_workshop_submissions_old`
MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;