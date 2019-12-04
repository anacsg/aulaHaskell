{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE QuasiQuotes #-}
{-# LANGUAGE TypeFamilies #-}
module Handler.League where

import Import
--import Network.HTTP.Types.Status
import Database.Persist.Postgresql
import Text.Lucius
import Text.Julius



getLeagueR :: Handler Html
getLeagueR = do 
    defaultLayout $ do 
        setTitle "League of Legends"
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
                                        <h1>League of Legends
                                        
                                         <p><p>
                                              
                                                <img src="/static/figurinhas/league/lol1.png" width="75" height="75">
                                              
                                                <img src="/static/figurinhas/league/lol2.png" width="75" height="75">
                                                
                                                <img src="/static/figurinhas/league/lol3.png" width="75" height="75">
                                              
                                                <img src="/static/figurinhas/league/lol4.png" width="75" height="75">
                                              
                                                <img src="/static/figurinhas/league/lol5.png" width="75" height="75">
                                              
                                                <img src="/static/figurinhas/league/lol6.png" width="75" height="75">
                                              
                                                <img src="/static/figurinhas/league/lol7.png" width="75" height="75">
                                              
                                              
                                                <img src="/static/figurinhas/league/lol9.png" width="75" height="75">
                                              
                                                <img src="/static/figurinhas/league/lol10.gif" width="75" height="75">
                                                
                                                <img src="/static/figurinhas/league/lol11.png" width="75" height="75">
                                                
                                                <img src="/static/figurinhas/league/lol12.png" width="75" height="75">
                                                
                                                <img src="/static/figurinhas/league/lol13.png" width="75" height="75">
                                                
                                                <img src="/static/figurinhas/league/lol14.png" width="75" height="75">
                                                
                                                <img src="/static/figurinhas/league/lol15.png" width="75" height="75">

                     <p><p><p><p><p><hr>
                     <a href="@{HomeR}">Voltar
                                        
                                        
                                        
                
        |]