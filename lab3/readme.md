## Ссылки

Программное обеспечение: [QuteMol](https://qutemol.sourceforge.net/)

Белок: [1AV1](https://www.rcsb.org/structure/1AV1)

## Подготовка

Для визуализации структуры белка необходимо:

1. Открыть `QuteMol`
2. Загрузить белок при помощи кнопки загрузки

![RasMol - Window example](./Open-pdb.png)

В результате в окне приложения должна появиться загруженная структура  
(структура большого размера может довольно долго прогружаться)  

![Main](./Main.png)

## Визуализация

`QuteMol` поддерживает только 3 типа визуализации

- Space-Fill
- Licorice
- Balls'n'Sticks

![Visualisation](./Visualisation.png)

### Space-Fill

По умолчанию структура белка показывается в представлении Space-Fill  
![SpaceFill](./1av1.pdb.png)

### Licorice (Wireframe)

В разделе `Geometry` нужно переключиться на `Licorice`  
![Licorice](./1av1wire.pdb.png)

### Balls'n'Sticks

Что-то среднее между `Space-Fill` и `Licorice`  
В разделе `Geometry` нужно переключиться на `Balls'n'Sticks`  
![Balls'n'Sticks](./1av1sticks.pdb.png)


## Цветовые модели

### CPK

В разделе Geometry в Material Color выбрать Per atom
![PerAtom](./PerAtom.png)

### Различными цветами по доменам (частям) белка

В том же разделе выбрать Per chain
![PerChain](./1av1perchain.png)

## Изображение белка публикационного качества

Использовал представление `Balls'n'Sticks`, цветовую модель `Per chain` и пресет `Molecule of the Month`  
![Publication](./Publication.png)  
