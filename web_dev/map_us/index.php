<?php
    ini_set('display_errors', 'On');
    require_once('database.php');
    require_once('session.php');

    require 'lib/Slim/Slim.php';
    \Slim\Slim::registerAutoloader();

    $app = new \Slim\Slim(array(
        'debug' => true,
        'view' => new \Slim\Views\Twig(),
        'templates.path' => 'templates'
    ));

    $view = $app->view();
    
    $view->parserOptions = array(
        'debug' => true,
        'cache' => dirname(__FILE__) . '/cache'
    );

    function setup($app) {
        $app->contentType('application/json');
        $app->response()->header('Access-Control-Allow-Origin', '*');
        $app->response()->header('Access-Control-Allow-Methods','POST, GET, PUT, DELETE, OPTIONS, HEAD');
        $app->response()->header('Access-Control-Allow-Headers', 'X-Requested-With, Content-Type');
        $app->response()->header('Access-Control-Allow-Credentials', 'true');
    }

    // ROUTES

    define("HIS_SECRET_WORD", "fuckoff");
    define("HER_SECRET_WORD", "addicted");

    $app->get('/', function () use ($app) {
        $context = array();
        $context['is_authenticated'] = false;

        if(isset($_SESSION['secret_word'])) {
            $context['is_authenticated'] = true;
        }
        
        $app->render('index.html', $context);
    });

    $app->post('/login', function() use ($app) {
        setup($app);
        $data = $app->request->post();

        if($data['secret_word'] == HIS_SECRET_WORD || $data['secret_word'] == HER_SECRET_WORD) {
            $_SESSION['secret_word'] = $data['secret_word'];
        }

        $app->redirect('/~ei10076/projects/map_us/');
    });

    $app->get('/logout', function() use($app) {
        session_destroy();
        $app->redirect('/~ei10076/projects/map_us/');
    });

    // get all markers
    $app->get('/api/markers', function() use ($app) {
        global $db;
        setup($app);

        if(isset($_SESSION['secret_word'])) {
            $stmt = $db->prepare("select * from marker");

            try {
                $stmt->execute();
                $result = $stmt->fetchAll();
                echo json_encode(array('status_code' => '000', 'status_msg' => 'OK', 'data' => $result));
            } catch(PDOException $e) {
                echo json_encode(array("status_code" => "001", "status_msg" => "REQUEST_FAILED"));
            }
        } else {
            echo json_encode(array("status_code" => "002", "status_msg" => "ACCESS_DENIED"));
        }
    });

    // create a new marker
    $app->post('/api/markers', function() use ($app) {
        global $db;
        setup($app);
        $data = $app->request->post();

        if(isset($_SESSION['secret_word'])) {
            $stmt = $db->prepare("insert into marker (id, lat, lng, type, visited, created_at) values (default, ?, ?, ?, default, default)");

            $type = "M";
            if($_SESSION['secret_word'] == HER_SECRET_WORD) {
                $type = "F";
            }

            try {
                $db->beginTransaction();
                $stmt->execute( array($data['lat'], $data['lng'], $type));
                $marker_id = $db->lastInsertId();
                $db->commit();
                echo json_encode(array("status_code" => "000", "status_msg" => "OK", 'data' => array('id' => $marker_id, 'type' => $type)));
            } catch(PDOException $e) {
                $db->rollback();
                echo json_encode(array("status_code" => "001", "status_msg" => "REQUEST_FAILED"));
            }
        } else {
            echo json_encode(array("status_code" => "002", "status_msg" => "ACCESS_DENIED"));
        }
        
    });

    // update marker identified by id
    $app->put('/api/markers/:id', function($id) use ($app) {
        global $db;
        setup($app);
        $data = $app->request->put();

        if(isset($_SESSION['secret_word'])) {
            $stmt = $db->prepare('update marker set lat = ?, lng = ? where id = ?');

            try {
                $db->beginTransaction();
                $stmt->execute( array($data['lat'], $data['lng'], $id));
                $db->commit();
                echo json_encode(array("status_code" => "000", "status_msg" => "OK"));
            } catch(PDOException $e) {
                $db->rollback();
                echo json_encode(array("status_code" => "001", "status_msg" => "REQUEST_FAILED"));
            }
        } else {
            echo json_encode(array("status_code" => "002", "status_msg" => "ACCESS_DENIED"));
        }
        
    });

    $app->put('/api/markers/visited/:id', function($id) use ($app) {
        global $db;
        setup($app);

        if(isset($_SESSION['secret_word'])) {
            $stmt = $db->prepare("update marker set visited = 1 where id = ?");

            try {
                $db->beginTransaction();
                $stmt->execute( array($id));
                $db->commit();
                echo json_encode(array("status_code" => "000", "status_msg" => "OK"));
            } catch(PDOException $e) {
                $db->rollback();
                echo json_encode(array("status_code" => "001", "status_msg" => "REQUEST_FAILED"));
            }
        } else {
            echo json_encode(array("status_code" => "002", "status_msg" => "ACCESS_DENIED"));
        }
    });


    $app->run();
?>
