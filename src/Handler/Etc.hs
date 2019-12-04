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
            .row {
              display: flex;
              flex-wrap: wrap;
              padding: 0 4px;
            }
            
            /* Create four equal columns that sits next to each other */
            .column {
              flex: 25%;
              max-width: 25%;
              padding: 0 4px;
            }
            
            .column img {
              margin-top: 8px;
              vertical-align: middle;
              width: 100%;
            }
            
            /* Responsive layout - makes a two column-layout instead of four columns */
            @media screen and (max-width: 800px) {
              .column {
                flex: 50%;
                max-width: 50%;
              }
            }
            
            /* Responsive layout - makes the two columns stack on top of each other instead of next to each other */
            @media screen and (max-width: 600px) {
              .column {
                flex: 100%;
                max-width: 100%;
              }
            }
        |]
        [whamlet|

                                 <p>
                                        <h1>Etc
                                        
                                         <div class="row">
                                              <div class="column">
                                                <img src="/static/figurinhas/Naruto.png" alt="Naruto" width="75" height="75">
                                              <div class="column">
                                                <img src="/static/figurinhas/fig1.png" alt="teste" width="75" height="75">

                                        
                                        
                                        
                                        
                
        |]