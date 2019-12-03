{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE QuasiQuotes #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE TypeFamilies #-}
module Handler.Home where

import Import
import Text.Lucius
import Text.Julius
--import Network.HTTP.Types.Status
import Database.Persist.Postgresql

getPage2R :: Handler Html 
getPage2R = do 
    defaultLayout $ do 
        $(whamletFile "templates/page2.hamlet")

getPage1R :: Handler Html 
getPage1R = do 
    defaultLayout $ do 
        addStylesheet (StaticR css_bootstrap_css)
        toWidgetHead $(juliusFile "templates/page1.julius")
        toWidgetHead $(luciusFile "templates/page1.lucius")
        $(whamletFile "templates/page1.hamlet")

getHomeR :: Handler Html
getHomeR = do 
    defaultLayout $ do 
        -- remoto
        addScriptRemote "https://code.jquery.com/jquery-3.4.1.min.js"
        -- esta no projeto
        addStylesheet (StaticR css_bootstrap_css)
        sess <- lookupSession "_NOME"
        toWidgetHead [julius|
            function ola(){
                alert("OLA MUNDO");
            }
        |]
        toWidgetHead [lucius|
            .masthead,
            .navbar {
                background-color: #000000;
            }
            
            .navbar-default .navbar-nav > .active > a {
                background-color: transparent;
                border-bottom: 2px solid white;
            }
            
            .navbar-nav {
                padding-bottom: 1em;
            }
            
            .masthead {
                margin-top: -21px;
                color: white;
                text-align: center;
                min-height: 400px;
                background-image: url("/static/megumin2.png");
                background-color: #C75055;
                background-repeat: no-repeat;
                background-position: center;
                background-attachment: fixed;
            }
            
            .masthead .header {
                max-width: 700px;
                margin: 0 auto;
                font-family: Lato,'Helvetica Neue',Arial,Helvetica,sans-serif;
            }
            
            .masthead h1.header {
                margin-top: 1em;
                margin-bottom: 0em;
                font-size: 5em;
                line-height: 1.2em;
                font-weight: normal;
                font-family: "Pacifico";
                color: black;
             }
            
            .masthead h2 {
                font-size: 1.7em;
                font-weight: normal;
            }
            
            .masthead .btn {
                margin: 1em 0;
            }
            
            
            /* Common styles for all types */
            .bs-callout {
              padding: 20px;
              margin: 20px 0;
              border: 1px solid #eee;
              border-left-width: 5px;
              border-radius: 3px;
            }
            
            .bs-callout p:last-child {
              margin-bottom: 0;
            }
            
            .bs-callout-info {
              border-left-color: #1b809e;
            }
            
            /* Space things out */
            .bs-docs-section {
              margin-bottom: 60px;
            }
            .bs-docs-section:last-child {
              margin-bottom: 0;
            }
            
            /* Buttons */
            .btn.btn-info.btn-lg {
              background-color: #000000 !important;
              border-color: #000000 !important;
              font-family: Lato,'Helvetica Neue',Arial,Helvetica,sans-serif;
            }
            
            #message {
                margin-bottom: 40px;
            }
            
            .teste {
                margin-top: -21px;
                color: white;
                text-align: center;
                min-height: 500px;
                background-image: url("kUPBS0.jpg");
                background-repeat: no-repeat;
                background-position: center;
                background-attachment: fixed;
            }
         
            
            
            
            
        |]
        [whamlet|
            
            <div .masthead>
                <div .container>
                    <div .row>
                        <h1 .header>
                            Figurinhas de Animes
                        <h2>
                            Inscreva-se na nossa newsletter:
                        <a href="newsletter" .btn.btn-info.btn-lg>
                            Clique aqui!
            
            <div .container>
                <!-- Starting
                    ================================================== -->
                <div .bs-docs-section>
                    <div .row>
                        <div .col-lg-12>
                            <div .page-header>
                                <h1 #start>Lista de Animes
            
                                <p>
                                    Monte seu pacote personalizado de figurinhas! 
                                    Basta fazer o download das imagens desejadas e utilizar um aplicativo de montagem de pacotes,
                                    como o <a href="">XXXXX</a>.
            
                                <ul .list-group>
            
                                   
            
                <hr>
            
                <!-- Forms
                    ================================================== -->
                <div .bs-docs-section>
                    <div .row>
                        <div .col-lg-12>
                            <div .page-header>
                                <h1 #forms>Envie uma imagem!
            
                                <p>
                                    Envie uma imagem e especifique o anime.
            
                   
            
                      
            
            
               
        |]
