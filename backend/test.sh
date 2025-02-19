curl https://api.openai.com/v1/chat/completions \
  -H "Content-Type: application/json" \
  -H "Authorization: Bearer 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" \
  -d '{
    "model": "gpt-4o-mini", 
    "messages": [
      {
        "role": "user", 
        "content": "Generate 5 multiple-choice questions on human reproduction in science with 4 options and correct answers. Format: JSON [{\"question\": \"\", \"options\": [\"\", \"\", \"\", \"\"], \"answer\": \"\"}]"
      }
    ], 
    "temperature": 0.7
  }'

