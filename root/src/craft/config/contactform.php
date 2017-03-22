<?php
   namespace Craft;

   $toEmail = craft()->request->getPost('toEmail');
   $toEmail = craft()->security->validateData($toEmail);

   $prependSubject = craft()->request->getPost('prependSubject');
   $prependSubject = craft()->security->validateData($prependSubject);

   return array(
       'toEmail' => ($toEmail ?: null),
       'prependSubject' => ($prependSubject ?: null)

   );
