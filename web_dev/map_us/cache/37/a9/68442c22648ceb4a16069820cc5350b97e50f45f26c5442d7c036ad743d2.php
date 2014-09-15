<?php

/* index.html */
class __TwigTemplate_37a968442c22648ceb4a16069820cc5350b97e50f45f26c5442d7c036ad743d2 extends Twig_Template
{
    public function __construct(Twig_Environment $env)
    {
        parent::__construct($env);

        $this->parent = false;

        $this->blocks = array(
        );
    }

    protected function doDisplay(array $context, array $blocks = array())
    {
        // line 1
        echo "<!DOCTYPE html>
<html>
  <head>
    <meta name=\"viewport\" content=\"initial-scale=1.0, user-scalable=no\" />
    <title>Map Us</title>
    
    <link rel=\"stylesheet\" href=\"//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css\">

    <style type=\"text/css\">

      html { 
        height: 100%;
        font-family: \"Helvetica-Neue\", Helvetica, Georgia, sans-serif;
      }
      body { height: 100%; margin: 0; padding: 0 }
      #map-canvas { height: 100% }

      #authentication-panel {
        position: absolute;
        z-index: 100;
        width: 360px;
        min-height: 1px;
        padding: 20px 40px 40px 40px;
        top: 50%;
        left: 50%;
        -webkit-transform: translate(-50%, -50%);
        transform: translate(-50%, -50%);
        background-color: #fff;
        -webkit-box-shadow: 0 3px 5px rgba(0,0,0,0.2);
        -moz-box-shadow: 0 3px 5px rgba(0,0,0,0.2);
        box-shadow: 0 3px 5px rgba(0,0,0,0.2); 
      }

      #stats {
        position: absolute;
        z-index: 100;
        width: 60px;
        min-height: 1px;
        bottom: 50px;
        left: 6px;
        background-color: #fff;
        -webkit-box-shadow: 0 3px 5px rgba(0,0,0,0.2);
        -moz-box-shadow: 0 3px 5px rgba(0,0,0,0.2);
        box-shadow: 0 3px 5px rgba(0,0,0,0.2); 
      }

      .stat-container {
        text-align: center;
        padding: 5px;
      }

      .stat-container:not(:last-child) {
        border-bottom: 1px solid #E9E9EB;
      }

      .stat-title {
        color: #A5A5A5;
        margin: 0;
      }

      .stat-number {
        margin: 0;
        color: #434550;
      }

      #authentication-panel .btn {
        width: 100%;
        border: none;
        border-radius: 0.2rem;
      }

      input {
        width: 100%;
        margin-bottom: 1.4rem;
        padding: 1rem;
        background-color: #ecf2f4;
        border-radius: 0.2rem;
        border: none;
      }

      h3 {
        margin-bottom: 20px;
      }

      .marker-options {
        min-height: 70px;
        width: auto;
      }

      .marker-options .btn {
        width: 100%;
        margin-bottom: 5px;
      }

      small {
        width: 100%;
        text-align: center;
      }

      hr {
        margin-top: 10px;
        margin-bottom: 10px;
      }

    </style>

    <script type=\"text/javascript\" src=\"https://maps.googleapis.com/maps/api/js?key=AIzaSyBg9CXf8fdm3dpgPEuB7qNpS2IFNPWe7tw&sensor=true\"></script>
    <script src=\"//code.jquery.com/jquery-1.11.0.min.js\"></script>
    <script type=\"text/javascript\" src=\"app.js\"></script>

  </head>
  <body>

    ";
        // line 114
        if ((!(isset($context["is_authenticated"]) ? $context["is_authenticated"] : null))) {
            // line 115
            echo "    <div id=\"authentication-panel\">
      <h3>What's the secret word?</h3>
      <form role=\"form\" method=\"POST\" action=\"login\">
        <input type=\"text\" name=\"secret_word\" placeholder=\"secret word\">
        <button type=\"submit\" class=\"btn btn-success\"><span class=\"glyphicon glyphicon-ok\"></span></button>
      </form>
    </div>
    ";
        }
        // line 123
        echo "    
    <div id=\"stats\">
      <div class=\"stat-container\">
        <h4 id=\"places-counter\" class=\"stat-number\"></h4>
        <p class=\"stat-title\">Places</p>
      </div>
      <div class=\"stat-container\">
        <h4 id=\"visited-counter\" class=\"stat-number\"></h4>
        <p class=\"stat-title\">Visited</p>
      </div>
    </div>

    <div id=\"map-canvas\"/>
  </body>
</html>";
    }

    public function getTemplateName()
    {
        return "index.html";
    }

    public function isTraitable()
    {
        return false;
    }

    public function getDebugInfo()
    {
        return array (  146 => 123,  136 => 115,  134 => 114,  19 => 1,);
    }
}
