<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the
 * installation. You don't have to use the web site, you can
 * copy this file to "wp-config.php" and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * MySQL settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://codex.wordpress.org/Editing_wp-config.php
 *
 * @package WordPress
 */

// ** MySQL settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define('DB_NAME', 'wordpressdb');

/** MySQL database username */
define('DB_USER', 'wordpress');

/** MySQL database password */
define('DB_PASSWORD', 'wordpresspass');

/** MySQL hostname */
define('DB_HOST', 'localhost');

/** Database Charset to use in creating database tables. */
define('DB_CHARSET', 'utf8mb4');

/** The Database Collate type. Don't change this if in doubt. */
define('DB_COLLATE', '');

/**#@+
 * Authentication Unique Keys and Salts.
 *
 * Change these to different unique phrases!
 * You can generate these using the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}
 * You can change these at any point in time to invalidate all existing cookies. This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define('AUTH_KEY',         ',9BONJ1NPEC{${=G6mk^]Ujz|5<h=++-QsY~)U9c.=3xAj/s&gI{mt+]Q2eBpkBe');
define('SECURE_AUTH_KEY',  '6fhbU3@ZE* r+*u3.miOd-#dJa{.*NzSk|&_iC}v :xrnn*)<Hd*2 lsE-!e[|78');
define('LOGGED_IN_KEY',    '<d}WTeNBv0M+3^>-X/0yOe-n9NNf8DUd[{.+PM>~hHuK*sVu:~S%a(30ZiwPUKT_');
define('NONCE_KEY',        ';XOXw*T.uVl&+@gUj/yCvD5EmV5JCdM}){6Aa)3_3K&u|0sNl*kQ_@n>|3#mkZg`');
define('AUTH_SALT',        '(xx!G@++t>PVT@PM$h1,M e6pR`F:$*J-=q:|4-j7|TOR5ot4pmhK}+kS&[?sB|[');
define('SECURE_AUTH_SALT', '#!2-6|r>9+5G=r-8U$uR7IinP&L=Ac,-{eW:`-rwKH-/T$(f0jm#fwf.#av;qjZ)');
define('LOGGED_IN_SALT',   '7STx{2,zK7UTGCB..vezK?%Pb@q~e%g(L0y14l$3^-z=0T.@RVI*ZtOmn-Wamy92');
define('NONCE_SALT',       '| n%+mJrN5+-AC{p=<l?Vm_otJy?h-QA.e0tz)hVu4nNvK(Dn$A]>OScd8S[{1br');

/**#@-*/

/**
 * WordPress Database Table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix  = 'wp_';

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the Codex.
 *
 * @link https://codex.wordpress.org/Debugging_in_WordPress
 */
define('WP_DEBUG', false);

/* That's all, stop editing! Happy blogging. */

/** Absolute path to the WordPress directory. */
if ( !defined('ABSPATH') )
	define('ABSPATH', dirname(__FILE__) . '/');

/** Sets up WordPress vars and included files. */
require_once(ABSPATH . 'wp-settings.php');

