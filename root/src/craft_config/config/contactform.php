<?php
   namespace Craft;

   $toEmail = craft()->request->getPost('toEmail');
   $toEmail = craft()->security->validateData($toEmail);

   return array(
       'toEmail' => ($toEmail ?: null)

   );
