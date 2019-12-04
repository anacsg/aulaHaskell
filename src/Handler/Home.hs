{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE QuasiQuotes #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE TypeFamilies #-}
module Handler.Home where

import Import
import Yesod.Form.Bootstrap3 (BootstrapFormLayout (..), renderBootstrap3)
import Text.Lucius
import Text.Julius
--import Network.HTTP.Types.Status
import Database.Persist.Postgresql

getHomeR :: Handler Html
getHomeR = do 
    defaultLayout $ do
        setTitle "Figurinhas!"
        addScriptRemote "https://code.jquery.com/jquery-3.4.1.min.js"
        -- esta no projeto
        sess <- lookupSession "_NOME"
        [whamlet|
            
            <div .masthead>
                <div .container>
                    <div .row>
                        <h1 .header>
                            Figurinhas
                        <h2>
                        <a href="newsletter" .btn.btn-info.btn-lg>
                            Inscreva-se na nossa newsletter!
            
            <div .container>
                <!-- Starting
                    ================================================== -->
                <div .bs-docs-section>
                    <div .row>
                        <div .col-lg-12>
                            <div .page-header>
                            
                                 <p>
                                    Monte seu pacote personalizado de figurinhas!
                                    Basta fazer o download das imagens desejadas e utilizar um aplicativo de montagem de pacotes,
                                    como o <a href="">XXXXX</a>.
                            
                            
                                <h1 #start>Índice
            
                                <ul .list-group>

                                    <li .list-group-item>
                                        <a href="">Exemplo 1
                                    
                                    <li .list-group-item>
                                        <a href="">Exemplo 2
                                    
                                    <li .list-group-item>
                                        <a href="">Etc...
                                    
            
                                   
            
                <hr>
            
            
               
        |]
