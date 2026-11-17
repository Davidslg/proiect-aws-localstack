#!/bin/bash
set -e

QUEUE_NAME="comenzi-magazin"

echo "1. Cream coada SQS..."
QUEUE_URL=$(lstk aws sqs create-queue \
  --queue-name "$QUEUE_NAME" \
  --query QueueUrl --output text)

echo "2. Trimitem o comanda..."
lstk aws sqs send-message \
  --queue-url "$QUEUE_URL" \
  --message-body "Comanda 101: laptop, cantitate 1"

echo "3. Primim comanda..."
RECEIPT_HANDLE=$(lstk aws sqs receive-message \
  --queue-url "$QUEUE_URL" \
  --wait-time-seconds 5 \
  --query 'Messages[0].ReceiptHandle' --output text)

if [ "$RECEIPT_HANDLE" = "None" ] || [ -z "$RECEIPT_HANDLE" ]; then
  echo "Nu a fost primit niciun mesaj."
  exit 1
fi

echo "4. Stergem mesajul procesat..."
lstk aws sqs delete-message \
  --queue-url "$QUEUE_URL" \
  --receipt-handle "$RECEIPT_HANDLE"

echo "Demonstratia SQS s-a incheiat cu succes!"
