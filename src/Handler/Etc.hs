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
        -- remoto
        addScriptRemote "https://code.jquery.com/jquery-3.4.1.min.js"
        -- esta no projeto
        addStylesheet (StaticR css_bootstrap_css)
        sess <- lookupSession "_NOME"
        toWidgetHead [lucius|
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
        |]
        [whamlet|
            <div .container>
                <div .bs-docs-section>
                    <div .row>
                        <div .col-lg-12>
                            <div .page-header>
                            
                                 <p>
                                        <h1 #start>Etc
                                        
                                        <img src="/static/figurinhas/Naruto.png" width="75" height="75"> 
                                        <img src="/static/figurinhas/fig1.png" width="75" height="75"> 
                
        |]