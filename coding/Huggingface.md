
1. intall huggingface_hub
`pip install huggingface_hub`
2. create account online and login with TOKEN
`huggingface-cli login`
3. download model from huggingface_hub, make sure you have the access to the model by applying for it online
In shell: 
`huggingface-cli download <model_id>`
In python:
```
from transformers import AutoModelForCausalLM, AutoTokenizer
model_id = "meta-llama/Llama-2-7b"
model = AutoModelForCausalLM.from_pretrained(model_id, force_download=True)
tokenizer = AutoTokenizer.from_pretrained(model_id, force_download=True)
```
4. check downloaded model
`ls  ~/.cache/huggingface/hub`


