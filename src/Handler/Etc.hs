{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE QuasiQuotes #-}
{-# LANGUAGE TypeFamilies #-}
module Handler.Etc where

import Import
--import Network.HTTP.Types.Status
import Database.Persist.Postgresql
import Text.Lucius
import Text.Julius



getEtcR :: Handler Html
getEtcR = do 
    defaultLayout $ do 
        setTitle "Etc"
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
        <div class="container">
            <p>
            <h1>Etc
            <p><p>
            <div class="col">
                <img src="/static/figurinhas/etc/e1.png" width="75" height="75">
                <img src="/static/figurinhas/etc/e2.png" width="75" height="75">
                <img src="/static/figurinhas/etc/e3.png" width="75" height="75">
                <img src="/static/figurinhas/etc/e4.png" width="75" height="75">
            <div class="col">
                <img src="/static/figurinhas/etc/e5.png" width="75" height="75">
                <img src="/static/figurinhas/etc/e6.png" width="75" height="75">
                <img src="/static/figurinhas/etc/e7.png" width="75" height="75">
                <img src="/static/figurinhas/etc/e8.png" width="75" height="75">
            <p><p><p><p><p><hr>
            <a href="@{HomeR}">Voltar                     
                
        |]