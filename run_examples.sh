#!/bin/sh

### Preprocessing
docker run -it -v $(pwd):/InvoiceNet invoicenet:1.0.0 /bin/bash -c "python3 /InvoiceNet/prepare_data.py --data_dir /InvoiceNet/train_data/ --val_size 0.5"

### Training
docker run -it -v $(pwd):/InvoiceNet invoicenet:1.0.0 /bin/bash -c "python3 /InvoiceNet/train.py --data_dir /InvoiceNet/processed_data/ --batch_size 1 --field total_amount --steps 50"

### Prediction
docker run -it -v $(pwd):/InvoiceNet invoicenet:1.0.0 /bin/bash -c "python3 /InvoiceNet/predict.py --data_dir /InvoiceNet/predict_data/  --field total_amount"
