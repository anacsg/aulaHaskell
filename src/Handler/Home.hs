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
            h1 {
                color : red;
            }
            
            ul {
                display: inline;
                list-style: none;
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
                                    Para montar seu pacote personalizado de figurinhas,
                                    basta fazer o download das imagens desejadas e utilizar um aplicativo de montagem de pacotes,
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
