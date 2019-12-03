{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE QuasiQuotes #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE TypeFamilies #-}
module Handler.Email where

import Import
import Text.Lucius
import Text.Julius
--import Network.HTTP.Types.Stactus
import Database.Persist.Postgresql

-- renderDivs
formEmail :: Form Email 
formAtor = renderBootstrap $ Email
    <$> areq textField "Nome: " Nothing
    <*> areq dayField "Nasc: " Nothing

getNewslR :: Handler Html
getNewslR = do 
    (widget,_) <- generateFormPost formEmail
    msg <- getMessage
    defaultLayout $ 
        [whamlet|
            $maybe mensa <- msg 
                <div>
                    ^{mensa}
            
            <h1>
                CADASTRO DE EMAIL
            
            <form method=post action=@{AtorR}>
                ^{widget}
                <input type="submit" value="Cadastrar">
        |]

postNewslR :: Handler Html
postNewslR = do 
    ((result,_),_) <- runFormPost formEmail
    case result of 
        FormSuccess ator -> do 
            runDB $ insert email 
            setMessage [shamlet|
                <div>
                    EMAIL INCLUIDO
            |]
            redirect NewslR
        _ -> redirect HomeR






