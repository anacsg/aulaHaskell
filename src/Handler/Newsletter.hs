{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE QuasiQuotes #-}
{-# LANGUAGE TypeFamilies #-}
module Handler.Newsletter where

import Import
--import Network.HTTP.Types.Status
import Database.Persist.Postgresql
import Text.Lucius
import Text.Julius

-- renderDivs
formNewslettter :: Form Produto 
formNewslettter = renderBootstrap $ Newsletter 
    <$> areq textField "Email: " Nothing
    


getNewsletterR :: Handler Html
getNewsletterR = do 
    (widget,enctype) <- generateFormPost formNewslettter 
    defaultLayout $ do 
        msg <- getMessage
        [whamlet|
            $maybe mensa <- msg
                <div>
                    ^{mensa}
            
            <h1>
                Newsletter
                
            <form method=post action=@{NewsletterR}>
                ^{widget}
                <input type="submit" value="Cadastrar">
        |]

postNewsletterR :: Handler Html
postNewsletterR = do 
    ((result,_),_) <- runFormPost formNewslettter
    case result of 
        FormSuccess newsletter -> do 
            runDB $ insert newsletter
            setMessage [shamlet|
                <h2>
                    EMAIL INSERIDO COM SUCESSO
            |]
            redirect NewsletterR
        _ -> redirect HomeR

getListNewsletterR :: Handler Html 
getListNewsletterR = do 
    -- select * from NewsletterR order by produto.nome
    newsletter <- runDB $ selectList [] [Asc NewsletterREmail]
    defaultLayout $ do 
        $(whamletFile "templates/newsletter.hamlet")

postApagarEmailR :: EmailId -> Handler Html
postApagarEmailR pid = do 
    _ <- runDB $ get404 pid
    runDB $ delete pid
    redirect ListEmailR