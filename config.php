<?php  // Moodle configuration file

unset($CFG);
global $CFG;
$CFG = new stdClass();

$CFG->dbtype    = 'mysqli';
$CFG->dblibrary = 'native';
$CFG->dbhost    = '143.198.69.155';
$CFG->dbname    = 'pazemente_pos';
$CFG->dbuser    = 'posgraduacao';
$CFG->dbpass    = 'Tnx4Lha7m9hoGJKu';
$CFG->prefix    = '';
$CFG->dboptions = array (
  'dbpersist' => 0,
  'dbport' => '',
  'dbsocket' => '',
  'dbcollation' => 'utf8mb4_unicode_ci',
);

$CFG->wwwroot   = 'https://pos-graduacao.pazemente.online';
$CFG->dataroot  = '/var/www/moodledata';
$CFG->admin     = 'admin';

$CFG->directorypermissions = 0777;

// $CFG->debug = (E_ALL | E_STRICT); // Mostra todos os erros e avisos
// $CFG->debugdisplay = 1; // Exibe erros na tela (não recomendado em produção)

require_once(__DIR__ . '/lib/setup.php');

// There is no php closing tag in this file,
// it is intentional because it prevents trailing whitespace problems!
