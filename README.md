# Video Game Icon

Como trocar o ícone do seu app via código.

![Sample](ChangeIcon/assets/changeicon.gif?raw=true) 

## Configurando o Info.plist

Adicione `CFBundleIcons` no Info.plist

Adicione `CFBundleAlternateIcons` como `Dictionary`, vai ser usado para os ícones alternativos

Criamos 3 dicionários abaixo do `CFBundleAlternateIcons`, eles corresponderão ao `ns64`, `ps`, and `sega`

Para cada `Dictionary`, criamos uma propriedade chamada `CFBundleIconFiles` como Array. Esse array conterá os nomes dos nossos ícones.


```swift

<key>CFBundleIcons</key>
	<dict>
		<key>CFBundleAlternateIcons</key>
		<dict>
			<key>n64</key>
			<dict>
				<key>CFBundleIconFiles</key>
				<array>
					<string>n64-icon</string>
				</array>
			</dict>
			<key>ps</key>
			<dict>
				<key>CFBundleIconFiles</key>
				<array>
					<string>ps-icon</string>
				</array>
			</dict>
			<key>sega</key>
			<dict>
				<key>CFBundleIconFiles</key>
				<array>
					<string>sega-icon</string>
				</array>
			</dict>
		</dict>
		<key>CFBundlePrimaryIcon</key>
		<dict>
			<key>CFBundleIconFiles</key>
			<array/>
			<key>UIPrerenderedIcon</key>
			<false/>
		</dict>
	</dict>
  ```

**Se você nãon configurar esses parâmetros corretamentes a troca de íncones não irá funcionar.**

## Uso

O uso é simples, cada botão faz a chamada nesse código passando o nome do ícone para qual deve ser trocado.

```swift
func changeIcon(to name: String?) {
        //Verifica se o app suporta troca de ícones
        guard UIApplication.shared.supportsAlternateIcons else {
            return;
        }
        
        // Troca o ícone para uma imágem específica a prtir do nome informado
        UIApplication.shared.setAlternateIconName(name) { (error) in
            // Depois da troca printa uma memsagem de erro ou de sucesso.
            if let error = error {
                print("App icon failed to due to \(error.localizedDescription)")
            } else {
                print("App icon changed successfully.")
            }
        }
    }
```

Para mais dicas e conteúdos como este, me siga no [instagram](https://instagram.com/rapholivera).
