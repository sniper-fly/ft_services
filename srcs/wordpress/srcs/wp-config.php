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
 * @link https://wordpress.org/support/article/editing-wp-config-php/
 *
 * @package WordPress
 */

// ** MySQL settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'wordpress' );

/** MySQL database username */
define( 'DB_USER', 'admin' );

/** MySQL database password */
define( 'DB_PASSWORD', 'admin' );

/** MySQL hostname */
define( 'DB_HOST', 'mysql-service:3306' );

/** Database Charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8mb4' );

/** The Database Collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

/**#@+
 * Authentication Unique Keys and Salts.
 *
 * Change these to different unique phrases!
 * You can generate these using the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}
 * You can change these at any point in time to invalidate all existing cookies. This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define( 'AUTH_KEY',         'Iur=WEl|a5tv/4S^5`k%pm#.T$B)YJh,q$}%)KZB3lt*OzY-8/KhoV<wNP^LARPm' );
define( 'SECURE_AUTH_KEY',  'layHlJy)M/Q/9xg9]zZG?!A<Ld&{McoG/:7JkKWUV/i)yV94f/^n!}q-PXa_:^Iz' );
define( 'LOGGED_IN_KEY',    'IyD, 2I|Mw]Ha[Jk(z@T?U^3d0(7; u7OXH-Czu>5ZU5>LUR;7sr/9[eP$6Bg9jt' );
define( 'NONCE_KEY',        'DkzhF?7G*~7jN=xxZ aKbMv60HXsh^| /*w(F&A4J?}VIxmE#<wGt,?VECA;v!p6' );
define( 'AUTH_SALT',        'Lk$5~7R=H2,o]Z4`?p|Y44$u`Gu4jtiuAK^L )Njw6)%4QfE:t{8&_.nC#Hh,?F ' );
define( 'SECURE_AUTH_SALT', 'j,lrX[7xJ/OB#CK;i,LBuYi$h`+6SWc4:%0 V^(:{pR-QTAB0paNs}sF2/|Go.K7' );
define( 'LOGGED_IN_SALT',   't^kPx.N(ME<]nny=h9%;sF}/.&zGp?gBK+l1(NHeM@#>6E?U*wUgup?6mB)*9D_%' );
define( 'NONCE_SALT',       '^/E_8tWfMjtm# *tS~,Nr||!)r+2AVAM<!B-+pLH4lsthUKd)Wh1R%kpBBLqoQX~' );

/**#@-*/

/**
 * WordPress Database Table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = 'wp_';

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the documentation.
 *
 * @link https://wordpress.org/support/article/debugging-in-wordpress/
 */
define( 'WP_DEBUG', false );

/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';
