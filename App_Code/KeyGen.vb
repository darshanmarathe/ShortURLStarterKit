

Option Strict On
Imports System.Text
Imports Microsoft.VisualBasic
Imports MonoURLTableAdapters

''' <date>27072005</date><time>070339</time>

''' <type>class</type>

''' <summary>

''' REQUIRES PROPERTIES: KeyLetters, KeyNumbers, MaxChars

''' </summary>

Public Class RandomKeyGenerator
    Dim Key_Letters As String
    Dim Key_Numbers As String
    Dim Key_Chars As Integer
    Dim LettersArray As Char()
    Dim NumbersArray As Char()

    ''' <date>27072005</date><time>071924</time>

    ''' <type>property</type>

    ''' <summary>

    ''' WRITE ONLY PROPERTY. HAS TO BE SET BEFORE CALLING GENERATE()

    ''' </summary>

    Public WriteOnly Property KeyLetters() As String
        Set(ByVal Value As String)
            Key_Letters = Value
        End Set
    End Property

    ''' <date>27072005</date><time>071924</time>

    ''' <type>property</type>

    ''' <summary>

    ''' WRITE ONLY PROPERTY. HAS TO BE SET BEFORE CALLING GENERATE()

    ''' </summary>

    Public WriteOnly Property KeyNumbers() As String
        Set(ByVal Value As String)
            Key_Numbers = Value
        End Set
    End Property

    ''' <date>27072005</date><time>071924</time>

    ''' <type>property</type>

    ''' <summary>

    ''' WRITE ONLY PROPERTY. HAS TO BE SET BEFORE CALLING GENERATE()

    ''' </summary>

    Public WriteOnly Property KeyChars() As Integer
        Set(ByVal Value As Integer)
            Key_Chars = Value
        End Set
    End Property

    ''' <date>27072005</date><time>072344</time>

    ''' <type>function</type>

    ''' <summary>

    ''' GENERATES A RANDOM STRING OF LETTERS AND NUMBERS.

    ''' LETTERS CAN BE RANDOMLY CAPITAL OR SMALL.

    ''' </summary>

    ''' <returns type="String">RETURNS THE

    '''         RANDOMLY GENERATED KEY</returns>

    Function GenerateString() As String
        Dim adp As New MonourlTableAdapter
        Dim str As String = Generate()
        If CInt(adp.GetCount(str)) = 0 Then
            Return str
        Else
            GenerateString()
        End If

    End Function

    Function Generate() As String
        Dim i_key As Integer
        Dim Random1 As Single
        Dim arrIndex As Int16
        Dim sb As New StringBuilder
        Dim RandomLetter As String

        ''' CONVERT LettersArray & NumbersArray TO CHARACTR ARRAYS

        LettersArray = Key_Letters.ToCharArray
        NumbersArray = Key_Numbers.ToCharArray

        For i_key = 1 To Key_Chars
            ''' START THE CLOCK    - LAITH - 27/07/2005 18:01:18 -

            Randomize()
            Random1 = Rnd()
            arrIndex = -1
            ''' IF THE VALUE IS AN EVEN NUMBER WE GENERATE A LETTER,

            ''' OTHERWISE WE GENERATE A NUMBER  

            '''          - LAITH - 27/07/2005 18:02:55 -

            ''' THE NUMBER '111' WAS RANDOMLY CHOSEN. ANY NUMBER

            ''' WILL DO, WE JUST NEED TO BRING THE VALUE

            ''' ABOVE '0'     - LAITH - 27/07/2005 18:40:48 -

            If (CType(Random1 * 111, Integer)) Mod 2 = 0 Then
                ''' GENERATE A RANDOM INDEX IN THE LETTERS

                ''' CHARACTER ARRAY   - LAITH - 27/07/2005 18:47:44 -

                Do While arrIndex < 0
                    arrIndex = _
                     Convert.ToInt16(LettersArray.GetUpperBound(0) _
                     * Random1)
                Loop
                RandomLetter = LettersArray(arrIndex)
                ''' CREATE ANOTHER RANDOM NUMBER. IF IT IS ODD,

                ''' WE CAPITALIZE THE LETTER

                '''      - LAITH - 27/07/2005 18:55:59 -

                If (CType(arrIndex * Random1 * 99, Integer)) Mod 2 <> 0 Then
                    RandomLetter = LettersArray(arrIndex).ToString
                    RandomLetter = RandomLetter.ToUpper
                End If
                sb.Append(RandomLetter)
            Else
                ''' GENERATE A RANDOM INDEX IN THE NUMBERS

                ''' CHARACTER ARRAY   - LAITH - 27/07/2005 18:47:44 -

                Do While arrIndex < 0
                    arrIndex = _
                      Convert.ToInt16(NumbersArray.GetUpperBound(0) _
                      * Random1)
                Loop
                sb.Append(NumbersArray(arrIndex))
            End If
        Next
        Return sb.ToString
    End Function
End Class