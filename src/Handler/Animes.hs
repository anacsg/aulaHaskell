{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE QuasiQuotes #-}
{-# LANGUAGE TypeFamilies #-}
module Handler.Animes where

import Import
--import Network.HTTP.Types.Status
import Database.Persist.Postgresql
import Text.Lucius
import Text.Julius



getAnimesR :: Handler Html
getAnimesR = do 
    defaultLayout $ do
        setTitle "Animes"
        -- remoto
        addScriptRemote "https://code.jquery.com/jquery-3.4.1.min.js"
        -- esta no projeto
        addStylesheet (StaticR css_bootstrap_css)
        sess <- lookupSession "_NOME"
        toWidgetHead [lucius|
            .row {
              display: flex;
              flex-wrap: wrap;
              padding: 0 4px;
            }
            
            
            .column img {
              width: 100%;
              align-self: center;
            }
            
        |]
        [whamlet|

        <p>
        <div class="container">
            <h1>Animes
            
            
    
            <div class="col">
                <img src="/static/figurinhas/animes/an1.png" width="75" height="75">
                <img src="/static/figurinhas/animes/an2.png" width="75" height="75">
                <img src="/static/figurinhas/animes/an3.png" width="75" height="75">
                <img src="/static/figurinhas/animes/an4.png" width="75" height="75">
                <img src="/static/figurinhas/animes/an5.png" width="75" height="75">
            <div class="col">
                <img src="/static/figurinhas/animes/an6.png" width="75" height="75">
                <img src="/static/figurinhas/animes/an7.png" width="75" height="75">
                <img src="/static/figurinhas/animes/an8.png" width="75" height="75">
                <img src="/static/figurinhas/animes/an9.png" width="75" height="75">
                <img src="/static/figurinhas/animes/an10.png" width="75" height="75">
            <div class="col">
                <img src="/static/figurinhas/animes/an12.png" width="75" height="75">
                <img src="/static/figurinhas/animes/an13.png" width="75" height="75">
                <img src="/static/figurinhas/animes/an14.png" width="75" height="75">
                <img src="/static/figurinhas/animes/an15.png" width="75" height="75">
            
            <p><p><p><p><hr>
            <a href="@{HomeR}">Voltar
                        
        |]