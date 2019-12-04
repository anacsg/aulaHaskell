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
                                        <h1>Animes
                                        
                                         <div class="row">
                                              <div class="column">
                                                <img src="/static/figurinhas/animes/Naruto.png" alt="Naruto" width="75" height="75">
                                              <div class="column">
                                                <img src="/static/figurinhas/animes/fig1.png" alt="teste" width="75" height="75">

                                        
                                        
                                        
                                        
                
        |]