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

getHomeR :: Handler Html
getHomeR = do 
    defaultLayout $ do
        setTitle "Figurinhas!"
        -- remoto
        addScriptRemote "https://code.jquery.com/jquery-3.4.1.min.js"
        -- esta no projeto
        addStylesheet (StaticR css_bootstrap_css)
        sess <- lookupSession "_NOME"
        toWidgetHead [julius|
            --window.location.href="https://animenews.ml"
        |]
        toWidgetHead [lucius|
            .masthead,
            .navbar {
                background-color: #000000;
                min-height: 50px;
            }
            
            .masthead {
                margin-top: -21px;
                color: white;
                text-align: center;
                min-height: 350px;
                background-image: url("/static/clouds.jpg");
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
            
            .login {
                float: right;
            }
            
            #message {
                margin-bottom: 40px;
            }
        |]
        [whamlet|
            <div .masthead>
                <div .container>
                    <div .row>
                        <h1 .header>
                            Figurinhas!
                        <h2>
                        <a href="@{NewsletterR}" .btn.btn-info.btn-lg>
                            Inscreva-se na nossa newsletter!
            
            <div .container>
                <div .bs-docs-section>
                    <div .row>
                        <div .col-lg-12>
                            <div .page-header>
                            
                                 <p>
                                    Monte seu pacote personalizado de figurinhas!
                                    Basta fazer o download das imagens desejadas e utilizar um aplicativo de montagem de pacotes,
                                    como o <a href="https://play.google.com/store/apps/details?id=com.easycodes.stickercreator">WAStickerApps</a>.

            
                                <ul .list-group>

                                    <li .list-group-item>
                                        <a href="@{}">Animes
                                    
                                    <li .list-group-item>
                                        <a href="@{}">League of Legends
                                    
                                    <li .list-group-item>
                                        <a href="@{EtcR}">Etc
                                    
            
                                   <p><p><p><p><p><hr>
                                   <a href="@{EntrarR}" class="login">Login
            
                <hr>
            
            
               
        |]
