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
            
            
            .column img {
              width: 100%;
              align-self: center;
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