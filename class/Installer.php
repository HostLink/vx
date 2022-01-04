<?php

use Composer\Script\Event;

class Installer
{
    public static function postPackageInstall(Event $event)
    {
        $installer = new Installer;
        echo "Database setup...\n";
        $config = [];
        $config["context"]["name"] = "_vx";

        $config["modules"] = ["mathsgod/puxt-vx"];

        $config["database"]["hostname"] = $installer->input("Please input the hostname: ");
        $config["database"]["username"] = $installer->input("Please input the username: ");
        $config["database"]["password"] = $installer->input("Please input the password: ");
        $config["database"]["database"] = $installer->input("Please input the database: ");



        $config["VX"]["jwt"]["secret"] =  $installer->generateRandomString();
        $config["VX"]["language"]["en"] = "English";
        $config["VX"]["language"]["zh-hk"] = "中文";


        $var = var_export($config, true);
        $var = str_replace("array (", "[", $var);
        $var = str_replace(")", "]", $var);
        file_put_contents(dirname(__DIR__) . "/puxt.config.php", "<?php\n\nreturn " . $var . ";\n");

        $installer->installDB();
    }

    function installDB()
    {

        echo "Database install...\n";
        if (!is_readable($file = dirname(__DIR__) . "/puxt.config.php")) {
            die($file . " not readable");
        }

        $config = require($file);

        $dbhostname = $config["database"]["hostname"];
        $dbuser = $config["database"]["username"];
        $dbpassword = $config["database"]["password"];
        $dbname = $config["database"]["database"];
        $dbport = $config["database"]["port"] ?? "3306";

        if (!$dbuser || !$dbpassword || !$dbname) {
            die("db config config error");
        }

        $cmd = "mysql -h {$dbhostname} -u {$dbuser} -P {$dbport} -p{$dbpassword} {$dbname} < " . __DIR__ . "/vx.sql";

        `$cmd`;
        echo "Done\n";
    }



    function input(string $prompt = null): string
    {
        echo $prompt;
        $handle = fopen("php://stdin", "r");
        $output = fgets($handle);
        return trim($output);
    }

    function generateRandomString($length = 128)
    {
        $string = '';
        $string .= '0123456789';
        $string .= 'abcdefghijklmnopqrstuvwxyz';
        $string .= 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
        return substr(str_shuffle(str_repeat($x = $string, ceil($length / strlen($x)))), 1, $length);
    }
}
